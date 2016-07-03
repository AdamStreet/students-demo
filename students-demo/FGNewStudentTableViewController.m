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
#import "FGTextFieldEventHandlerHelper.h"

@interface FGNewStudentTableViewController ()

@property (nonatomic) FGBarButtonItem *doneButtonItem;

@property (nonatomic) FGTextFieldEventHandlerHelper *textFieldEventHandlerHelper;

@property (nonatomic) FGFirstNameTextFieldTableViewCell *firstNameTextFieldTableViewCell;
@property (nonatomic) FGLastNameTextFieldTableViewCell *lastNameTextFieldTableViewCell;
@property (nonatomic) FGAvatarTableViewCell *avatarTableViewCell;
@property (nonatomic) FGAddPhotoTableViewCell *addPhotoTableViewCell;

@end

typedef NS_ENUM(NSUInteger, Sections) {
	kSectionAvatar = 0,
	kSectionAddPhoto = 1,
	kSectionNameTextFields = 2,
	kNumberOfSections = 3,
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

#pragma mark - Private methods

- (FGDatabaseManager *)databaseManager
{
	return [FGDatabaseManager mainDatabaseManager];
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

- (BOOL)validateContent
{
	BOOL isValid = (0 < [self.firstNameTextFieldTableViewCell.textField.text length] ||
					0 < [self.lastNameTextFieldTableViewCell.textField.text length]);
	
	self.doneButtonItem.enabled = isValid;
	
	return isValid;
}

- (void)dismissKeyboard
{
	[self.firstNameTextFieldTableViewCell.textField resignFirstResponder];
	[self.lastNameTextFieldTableViewCell.textField resignFirstResponder];
}

#pragma mark Accessors

- (FGTextFieldEventHandlerHelper *)textFieldEventHandlerHelper
{
	if (!_textFieldEventHandlerHelper) {
		_textFieldEventHandlerHelper = [[FGTextFieldEventHandlerHelper alloc] init];
		__weak FGNewStudentTableViewController *weakSelf = self;
		_textFieldEventHandlerHelper.changeHandler = ^(FGTextField *textField){
			[weakSelf validateContent];
		};
		_textFieldEventHandlerHelper.finisingHandler = ^(FGTextField *textField) {
			return YES;
		};
	}
	
	return _textFieldEventHandlerHelper;
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

- (FGFirstNameTextFieldTableViewCell *)firstNameTextFieldTableViewCell
{
	if (!_firstNameTextFieldTableViewCell) {
		_firstNameTextFieldTableViewCell = [self.tableView dequeueReusableCellWithIdentifier:FGFirstNameTextFieldTableViewCellIdentifier
																				forIndexPath:[NSIndexPath indexPathForRow:kTextFieldRowFirstName inSection:kSectionNameTextFields]];
		[self.textFieldEventHandlerHelper registerTextField:_firstNameTextFieldTableViewCell.textField];
	}
	
	return _firstNameTextFieldTableViewCell;
}

- (FGLastNameTextFieldTableViewCell *)lastNameTextFieldTableViewCell
{
	if (!_lastNameTextFieldTableViewCell) {
		_lastNameTextFieldTableViewCell = [self.tableView dequeueReusableCellWithIdentifier:FGLastNameTextFieldTableViewCellIdentifier
																			   forIndexPath:[NSIndexPath indexPathForRow:kTextFieldRowLastName inSection:kSectionNameTextFields]];
		[self.textFieldEventHandlerHelper registerTextField:_lastNameTextFieldTableViewCell.textField];
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
	[self dismissKeyboard];
	
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
