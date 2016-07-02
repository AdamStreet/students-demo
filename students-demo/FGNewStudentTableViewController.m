//
//  FGNewStudentTableViewController.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGNewStudentTableViewController.h"

#import "FGStudentFetcher.h"
#import "FGStudentAPIKeys.h"
#import "FGDatabaseManager.h"
#import "FGAddRandomStudentTableViewCell.h"
#import "FGAvatarTableViewCell.h"
#import "FGAddPhotoTableViewCell.h"
#import "FGFirstNameTextFieldTableViewCell.h"
#import "FGLastNameTextFieldTableViewCell.h"
#import "FGAvatarImageView.h"
#import "FGTextField.h"
#import "FGImagePickerViewController.h"
#import "FGAlertView.h"
#import "FGLocalization.h"

@interface FGNewStudentTableViewController ()

@property (nonatomic, weak) NSURLSessionTask *pendingSessionTask;

@property (nonatomic) FGFirstNameTextFieldTableViewCell *firstNameTextFieldTableViewCell;
@property (nonatomic) FGLastNameTextFieldTableViewCell *lastNameTextFieldTableViewCell;
@property (nonatomic) FGAvatarTableViewCell *avatarTableViewCell;

@end

typedef NS_ENUM(NSUInteger, Sections) {
	kSectionAddRandomUser = 0,
	kSectionAvatar = 1,
	kSectionAddPhoto = 2,
	kSectionNameTextFields = 3,
	kNumberOfSections = 4,
};

typedef NS_ENUM(NSUInteger, TextFieldsRows) {
	kTextFieldRowFirstName = 0,
	kTextFieldRowLastName = 1,
	kNumberOfTextFieldsRows = 2,
};

@implementation FGNewStudentTableViewController

@synthesize tableView = _tableView;

#pragma mark - Initialization

- (id)initWithNewStudent
{
	self = [super initWithStyle:UITableViewStyleGrouped];
//	if (self) {
//	}
	
	return self;
};

- (void)dealloc
{
	[self cancelPendingTask];
}

#pragma mark - Private methods

- (void)fetchRandomUser
{
	[self clearInputValues];
	
	[self cancelPendingTask];
	
	self.pendingSessionTask = [FGStudentFetcher fetchRandomStudentMetadata:^(NSDictionary *studentMetadata, NSError *error) {
		if (error) {
			[self showConnectionError:error];
			
			return;
		}
		
		[self cancelPendingTask];
		
		[self fillStudentDetails:[studentMetadata valueForKeyPath:FGStudentAPIKeysFirstNameKeyPath]
						lastName:[studentMetadata valueForKeyPath:FGStudentAPIKeysLastNameKeyPath]
				 avatarImagePath:[studentMetadata valueForKeyPath:FGStudentAPIKeysLargeAvatarKeyPath]];
	}];
}

- (void)cancelPendingTask
{
	[self.pendingSessionTask cancel], self.pendingSessionTask = nil;
}

- (void)clearInputValues
{
	self.firstNameTextFieldTableViewCell.textField.text = nil;
	self.lastNameTextFieldTableViewCell.textField.text = nil;
	[self.avatarTableViewCell.avatarImageView clear];
}

- (void)addPhoto
{
	FGImagePickerViewController *imagePickerViewController = [[FGImagePickerViewController alloc] initWithoutNib];
	__weak FGImagePickerViewController *weakImagePickerViewController = imagePickerViewController;
	imagePickerViewController.completion = ^(UIImage *image){
		if (image) {
			self.avatarTableViewCell.avatarImageView.imageView.image = image;
		}
		[weakImagePickerViewController.presentingViewController dismissViewControllerAnimated:YES
																			   completion:nil];
	};
	[self presentViewController:imagePickerViewController
					   animated:YES
					 completion:nil];
}

- (void)showConnectionError:(NSError *)error
{
	FGAlertView *alertView = [[FGAlertView alloc] initWithTitle:FGLocalizedString(@"Connection Error", @"Connection error title")
														message:[error localizedDescription]
											  cancelButtonTitle:FGLocalizedString(@"Okay", @"connection error cancel button title")
											  otherButtonTitles:nil
													 completion:nil];
	[alertView show];
}

- (void)fillStudentDetails:(NSString *)firstName
				  lastName:(NSString *)lastName
		   avatarImagePath:(NSString *)imagePath
{
	self.firstNameTextFieldTableViewCell.textField.text = firstName;
	self.lastNameTextFieldTableViewCell.textField.text = lastName;
	[self.avatarTableViewCell.avatarImageView setImageURL:[NSURL URLWithString:imagePath]
											   completion:^(NSError *error) {
												   if (error) {
													   [self showConnectionError:error];
												   }
											   }];
}

#pragma mark Accessors

- (FGFirstNameTextFieldTableViewCell *)firstNameTextFieldTableViewCell
{
	if (!_firstNameTextFieldTableViewCell) {
		_firstNameTextFieldTableViewCell = [self.tableView dequeueReusableCellWithIdentifier:FGFirstNameTextFieldTableViewCellIdentifier
																				forIndexPath:[NSIndexPath indexPathForRow:kTextFieldRowFirstName inSection:kSectionNameTextFields]];
	}
	
	return _firstNameTextFieldTableViewCell;
}

- (FGLastNameTextFieldTableViewCell *)lastNameTextFieldTableViewCell
{
	if (!_lastNameTextFieldTableViewCell) {
		_lastNameTextFieldTableViewCell = [self.tableView dequeueReusableCellWithIdentifier:FGLastNameTextFieldTableViewCellIdentifier
																			   forIndexPath:[NSIndexPath indexPathForRow:kTextFieldRowLastName inSection:kSectionNameTextFields]];
	}
	
	return _lastNameTextFieldTableViewCell;
}

- (FGAvatarTableViewCell *)avatarTableViewCell
{
	if (!_avatarTableViewCell) {
		_avatarTableViewCell = [self.tableView dequeueReusableCellWithIdentifier:FGAvatarTableViewCellIdentifier
																	forIndexPath:[NSIndexPath indexPathForRow:0 inSection:kSectionAvatar]];
	}
	
	return _avatarTableViewCell;
}

#pragma mark - View lifecycle

//- (void)loadView
//{
//	[super loadView];
//}

- (UINavigationItem *)navigationItem
{
	UINavigationItem *navigationItem = [super navigationItem];
	
	navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
																					  target:self
																					  action:@selector(doneButtonTapped:)];
	
	return navigationItem;
}

#pragma mark - Public methods
#pragma mark Accessors
#pragma mark Overrides

- (FGTableView *)tableView
{
	if (!_tableView) {
		_tableView = [super tableView];
		
		[_tableView registerClass:[FGAddRandomStudentTableViewCell class]
		   forCellReuseIdentifier:FGAddRandomStudentTableViewCellIdentifier];
		[_tableView registerClass:[FGAvatarTableViewCell class]
		   forCellReuseIdentifier:FGAvatarTableViewCellIdentifier];
		[_tableView registerClass:[FGAddPhotoTableViewCell class]
		   forCellReuseIdentifier:FGAddPhotoTableViewCellIdentifier];
		[_tableView registerClass:[FGFirstNameTextFieldTableViewCell class]
		   forCellReuseIdentifier:FGFirstNameTextFieldTableViewCellIdentifier];
		[_tableView registerClass:[FGLastNameTextFieldTableViewCell class]
		   forCellReuseIdentifier:FGLastNameTextFieldTableViewCellIdentifier];
		
		_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	}
	
	return _tableView;
}

#pragma mark - User interaction handlers

- (void)doneButtonTapped:(id)sender
{
	FGStudent *newStudent = [[FGDatabaseManager mainDatabaseManager] insertEntity:[FGStudent entityName]];
	newStudent.firstName = self.firstNameTextFieldTableViewCell.textField.text;
	newStudent.lastName = self.lastNameTextFieldTableViewCell.textField.text;
	
	NSURL *avatarURL = self.avatarTableViewCell.avatarImageView.imageURL;
	if (avatarURL) {
		newStudent.avatarImageURLString = [avatarURL absoluteString];
	} else {
		// TODO Save in file & create entity
	}

	[[FGDatabaseManager mainDatabaseManager] saveContext];
	
	if (self.completionHandler) {
		self.completionHandler(newStudent);
	}
}

#pragma mark - Notification handlers
#pragma mark - KVO
#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return kNumberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	switch (section) {
		case kSectionAddRandomUser:
			return 1;
			
		case kSectionAvatar:
			return 1;
			
		case kSectionAddPhoto:
			return 1;
			
		case kSectionNameTextFields:
			return kNumberOfTextFieldsRows;
			
		default:
			break;
	}
	
	NSAssert(NO, @"Unhandled section");
	
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *tableViewCellIdentifier = nil;
	__kindof UITableViewCell *cell = nil;
	
	switch (indexPath.section) {
		case kSectionAddRandomUser:
			tableViewCellIdentifier = FGAddRandomStudentTableViewCellIdentifier;
			
			break;
		case kSectionAvatar:
			cell = self.avatarTableViewCell;
			
			break;
		case kSectionAddPhoto:
			tableViewCellIdentifier = FGAddPhotoTableViewCellIdentifier;
			
			break;
		case kSectionNameTextFields:
			if (indexPath.row == 0) {
				cell = self.firstNameTextFieldTableViewCell;
			} else {
				cell = self.lastNameTextFieldTableViewCell;
			}
			
			break;
			
		default:
			break;
	}
	
	if (!cell) {
		cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier																		forIndexPath:indexPath];
	}
	
	// Bind required elements
	switch (indexPath.section) {
		case kSectionAvatar:
			self.avatarTableViewCell = cell;
			
			break;

		case kSectionNameTextFields:
			if (indexPath.row == 0) {
				self.firstNameTextFieldTableViewCell = cell;
			} else {
				self.lastNameTextFieldTableViewCell = cell;
			}
			
			break;
			
		default:
			break;
	}
	
	return cell;
}

#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return FLT_EPSILON;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
	return FLT_EPSILON;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == kSectionAvatar)
		return 120.0;
	
	return tableView.rowHeight;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch (indexPath.section) {
		case kSectionAddRandomUser:
			return YES;
			
		case kSectionAddPhoto:
			return YES;
			
		default:
			return NO;
	}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == kSectionAddRandomUser) {
		[self fetchRandomUser];
		
		[tableView deselectRowAtIndexPath:indexPath animated:YES];
		
		return;
	}
	
	if (indexPath.section == kSectionAddPhoto) {
		[self addPhoto];
		
		return;
	}
	
	NSAssert1(NO, @"Undhandled indexPath: %@", indexPath);
}

@end
