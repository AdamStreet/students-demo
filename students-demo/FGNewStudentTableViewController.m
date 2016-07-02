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
#import "FGAvatarImageFileCreator.h"
#import "FGBarButtonItem.h"
#import "FGTextFieldValueChangedHelper.h"

@interface FGNewStudentTableViewController ()

@property (nonatomic, weak) NSURLSessionTask *pendingSessionTask;

@property (nonatomic) FGBarButtonItem *doneButtonItem;

@property (nonatomic) FGTextFieldValueChangedHelper *textFieldValueChangedHelper;

@property (nonatomic) FGAddRandomStudentTableViewCell *addRandomStudentTableViewCell;
@property (nonatomic) FGFirstNameTextFieldTableViewCell *firstNameTextFieldTableViewCell;
@property (nonatomic) FGLastNameTextFieldTableViewCell *lastNameTextFieldTableViewCell;
@property (nonatomic) FGAvatarTableViewCell *avatarTableViewCell;
@property (nonatomic) FGAddPhotoTableViewCell *addPhotoTableViewCell;

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

- (FGDatabaseManager *)databaseManager
{
	return [FGDatabaseManager mainDatabaseManager];
}

- (void)fetchRandomUser
{
	[self clearInputValues];
	[self setInputValuesEnabled:NO];
	
	[self cancelPendingTask];
	
	self.addRandomStudentTableViewCell.buttonState = FGAddRandomStudentTableViewCellButtonStateLoading;
	
	self.pendingSessionTask = [FGStudentFetcher fetchRandomStudentMetadata:^(NSDictionary *studentMetadata, NSError *error) {
		if (error) {
			[self showConnectionError:error];
			
			[self clearInputValues];
			[self setInputValuesEnabled:YES];
		} else {
		
			self.addRandomStudentTableViewCell.buttonState = FGAddRandomStudentTableViewCellButtonStateLoaded;
			
			[self cancelPendingTask];
			
			[self fillStudentDetails:[studentMetadata valueForKeyPath:FGStudentAPIKeysFirstNameKeyPath]
							lastName:[studentMetadata valueForKeyPath:FGStudentAPIKeysLastNameKeyPath]
					 avatarImagePath:[studentMetadata valueForKeyPath:FGStudentAPIKeysLargeAvatarKeyPath]];
		}
		
		[self validateContent];
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
	
	[self validateContent];
}

- (void)setInputValuesEnabled:(BOOL)enabled
{
	self.firstNameTextFieldTableViewCell.textField.enabled = enabled;
	self.lastNameTextFieldTableViewCell.textField.enabled = enabled;
	self.addPhotoTableViewCell.button.enabled = enabled;
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

- (BOOL)validateContent
{
	BOOL isValid = (0 < [self.firstNameTextFieldTableViewCell.textField.text length] ||
					0 < [self.lastNameTextFieldTableViewCell.textField.text length]);
	
	self.doneButtonItem.enabled = isValid;
	
	return isValid;
}

#pragma mark Accessors

- (FGTextFieldValueChangedHelper *)textFieldValueChangedHelper
{
	if (!_textFieldValueChangedHelper) {
		_textFieldValueChangedHelper = [[FGTextFieldValueChangedHelper alloc] init];
		__weak FGNewStudentTableViewController *weakSelf = self;
		_textFieldValueChangedHelper.changeHandler = ^{
			[weakSelf validateContent];
		};
	}
	
	return _textFieldValueChangedHelper;
}

- (FGBarButtonItem *)doneButtonItem
{
	if (!_doneButtonItem) {
		_doneButtonItem = [[FGBarButtonItem alloc]
						   initWithBarButtonSystemItem:UIBarButtonSystemItemSave
						   target:self
						   action:@selector(doneButtonTapped:)];
	}
	
	return _doneButtonItem;
}

- (FGAddRandomStudentTableViewCell *)addRandomStudentTableViewCell
{
	if (!_addRandomStudentTableViewCell) {
		_addRandomStudentTableViewCell = [self.tableView dequeueReusableCellWithIdentifier:FGAddRandomStudentTableViewCellIdentifier
																			  forIndexPath:[NSIndexPath indexPathForRow:0 inSection:kSectionAddRandomUser]];
		_addRandomStudentTableViewCell.button.tapHandler = ^{
			[self fetchRandomUser];
		};
	}
	
	return _addRandomStudentTableViewCell;
}

- (FGFirstNameTextFieldTableViewCell *)firstNameTextFieldTableViewCell
{
	if (!_firstNameTextFieldTableViewCell) {
		_firstNameTextFieldTableViewCell = [self.tableView dequeueReusableCellWithIdentifier:FGFirstNameTextFieldTableViewCellIdentifier
																				forIndexPath:[NSIndexPath indexPathForRow:kTextFieldRowFirstName inSection:kSectionNameTextFields]];
		[self.textFieldValueChangedHelper registerTextField:_firstNameTextFieldTableViewCell.textField];
	}
	
	return _firstNameTextFieldTableViewCell;
}

- (FGLastNameTextFieldTableViewCell *)lastNameTextFieldTableViewCell
{
	if (!_lastNameTextFieldTableViewCell) {
		_lastNameTextFieldTableViewCell = [self.tableView dequeueReusableCellWithIdentifier:FGLastNameTextFieldTableViewCellIdentifier
																			   forIndexPath:[NSIndexPath indexPathForRow:kTextFieldRowLastName inSection:kSectionNameTextFields]];
		[self.textFieldValueChangedHelper registerTextField:_lastNameTextFieldTableViewCell.textField];
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

- (FGAddPhotoTableViewCell *)addPhotoTableViewCell
{
	if (!_addPhotoTableViewCell) {
		_addPhotoTableViewCell = [self.tableView dequeueReusableCellWithIdentifier:FGAddPhotoTableViewCellIdentifier
																	  forIndexPath:[NSIndexPath indexPathForRow:0 inSection:kSectionAddPhoto]];
		_addPhotoTableViewCell.button.tapHandler = ^{
			[self addPhoto];
		};
	}
	
	return _addPhotoTableViewCell;
}

#pragma mark - View lifecycle

- (UINavigationItem *)navigationItem
{
	UINavigationItem *navigationItem = [super navigationItem];
	
	navigationItem.rightBarButtonItem = self.doneButtonItem;
	
	return navigationItem;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	[self validateContent];
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
	}
	
	return _tableView;
}

#pragma mark - User interaction handlers

- (void)doneButtonTapped:(id)sender
{
	FGStudent *newStudent = [[self databaseManager] insertEntity:[FGStudent entityName]];
	newStudent.firstName = self.firstNameTextFieldTableViewCell.textField.text;
	newStudent.lastName = self.lastNameTextFieldTableViewCell.textField.text;
	
	NSURL *avatarURL = self.avatarTableViewCell.avatarImageView.imageURL;
	if (avatarURL) {
		newStudent.avatarImageURLString = [avatarURL absoluteString];
	} else {
		UIImage *createdImage = self.avatarTableViewCell.avatarImageView.imageView.image;
		if (createdImage) {
			FGAvatarImageFile *avatarImageFile = [FGAvatarImageFileCreator avatarImageFileWithImage:createdImage
																			  databaseManager:[self databaseManager]];
			newStudent.avatarImageFile = avatarImageFile;
		}
	}

	[[self databaseManager] saveContext];
	
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
	__kindof UITableViewCell *cell = nil;
	
	switch (indexPath.section) {
		case kSectionAddRandomUser:
			cell = self.addRandomStudentTableViewCell;
			
			break;
		case kSectionAvatar:
			cell = self.avatarTableViewCell;
			
			break;
		case kSectionAddPhoto:
			cell = self.addPhotoTableViewCell;
			
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

@end
