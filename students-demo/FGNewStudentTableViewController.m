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
#import "FGAvatarImageFileHelper.h"
#import "FGBarButtonItem.h"
#import "FGTextFieldEventHandlerHelper.h"
#import "FGCellTextFieldTableViewCell.h"
#import "FGPhoneTextFieldTableViewCell.h"
#import "FGEmailTextFieldTableViewCell.h"

@interface FGNewStudentTableViewController ()

@property (nonatomic) FGStudent *student;

@property (nonatomic) FGBarButtonItem *doneButtonItem;

@property (nonatomic) FGTextFieldEventHandlerHelper *textFieldEventHandlerHelper;

@property (nonatomic) FGFirstNameTextFieldTableViewCell *firstNameTextFieldTableViewCell;
@property (nonatomic) FGLastNameTextFieldTableViewCell *lastNameTextFieldTableViewCell;
@property (nonatomic) FGPhoneTextFieldTableViewCell *phoneTextFieldTableViewCell;
@property (nonatomic) FGCellTextFieldTableViewCell *cellTextFieldTableViewCell;
@property (nonatomic) FGEmailTextFieldTableViewCell *emailTextFieldTableViewCell;
@property (nonatomic) FGAvatarTableViewCell *avatarTableViewCell;
@property (nonatomic) FGAddPhotoTableViewCell *addPhotoTableViewCell;

@end

typedef NS_ENUM(NSUInteger, Sections) {
	kSectionAvatar = 0,
	kSectionAddPhoto = 1,
	kSectionInputTextFields = 2,
	kNumberOfSections = 3,
};

typedef NS_ENUM(NSUInteger, TextFieldsRows) {
	kTextFieldRowFirstName = 0,
	kTextFieldRowLastName = 1,
	kTextFieldRowEmail = 2,
	kTextFieldRowCell = 3,
	kTextFieldRowPhone = 4,
	kNumberOfTextFieldsRows = 5,
};

@implementation FGNewStudentTableViewController

@synthesize tableView = _tableView;

#pragma mark - Initialization

- (instancetype)initWithStudent:(FGStudent *)student
{
	self = [super initWithStyle:UITableViewStyleGrouped];
	if (self) {
		self.student = student;
		
		if (student) {
			self.title = FGLocalizedString(@"Change Student Details", @"Student manipulator screen title");
		} else {
			self.title = FGLocalizedString(@"Add Student", @"Student manipulator screen title");
		}
	}
	return self;
}

- (id)initWithNewStudent	// Convenience initializes
{
	return [self initWithStudent:nil];
};

#pragma mark - Private methods

- (FGDatabaseManager *)databaseManager
{
	return [FGDatabaseManager mainDatabaseManager];
}

- (BOOL)hasAddedPhoto
{
	return (self.avatarTableViewCell.avatarImageView.imageURL ||
			self.avatarTableViewCell.avatarImageView.imageView.image);
}

- (void)removePhoto
{
	[self.avatarTableViewCell.avatarImageView clear];
	
	[self updateAddPhotoCellState];
}

- (void)updateAddPhotoCellState
{
	self.addPhotoTableViewCell.avatarState = ([self hasAddedPhoto]?
											  FGAddPhotoTableViewCellAvatarStateAssignedAvatar : FGAddPhotoTableViewCellAvatarStateNoAvatar);
}

- (void)addPhoto
{
	FGImagePickerViewController *imagePickerViewController = [[FGImagePickerViewController alloc] initWithoutNib];
	__weak FGImagePickerViewController *weakImagePickerViewController = imagePickerViewController;
	imagePickerViewController.completion = ^(UIImage *image){
		if (image) {
			[self.avatarTableViewCell.avatarImageView clear];
			self.avatarTableViewCell.avatarImageView.imageView.image = image;
		}
		
		[self updateAddPhotoCellState];
		
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
	[self.view endEditing:YES];
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
																				forIndexPath:[NSIndexPath indexPathForRow:kTextFieldRowFirstName inSection:kSectionInputTextFields]];
		[self.textFieldEventHandlerHelper registerTextField:_firstNameTextFieldTableViewCell.textField];
		_firstNameTextFieldTableViewCell.textField.text = self.student.firstName;
	}
	
	return _firstNameTextFieldTableViewCell;
}

- (FGLastNameTextFieldTableViewCell *)lastNameTextFieldTableViewCell
{
	if (!_lastNameTextFieldTableViewCell) {
		_lastNameTextFieldTableViewCell = [self.tableView dequeueReusableCellWithIdentifier:FGLastNameTextFieldTableViewCellIdentifier
																			   forIndexPath:[NSIndexPath indexPathForRow:kTextFieldRowLastName inSection:kSectionInputTextFields]];
		[self.textFieldEventHandlerHelper registerTextField:_lastNameTextFieldTableViewCell.textField];
		_lastNameTextFieldTableViewCell.textField.text = self.student.lastName;
	}
	
	return _lastNameTextFieldTableViewCell;
}

- (FGPhoneTextFieldTableViewCell *)phoneTextFieldTableViewCell
{
	if (!_phoneTextFieldTableViewCell) {
		_phoneTextFieldTableViewCell = [self.tableView dequeueReusableCellWithIdentifier:FGPhoneTextFieldTableViewCellIdentifier
																			forIndexPath:[NSIndexPath indexPathForRow:kTextFieldRowPhone inSection:kSectionInputTextFields]];
		[self.textFieldEventHandlerHelper registerTextField:_phoneTextFieldTableViewCell.textField];
		_phoneTextFieldTableViewCell.textField.text = self.student.phone;
	}
	
	return _phoneTextFieldTableViewCell;
}

- (FGCellTextFieldTableViewCell *)cellTextFieldTableViewCell
{
	if (!_cellTextFieldTableViewCell) {
		_cellTextFieldTableViewCell = [self.tableView dequeueReusableCellWithIdentifier:FGCellTextFieldTableViewCellIdentifier
																		   forIndexPath:[NSIndexPath indexPathForRow:kTextFieldRowCell inSection:kSectionInputTextFields]];
		[self.textFieldEventHandlerHelper registerTextField:_cellTextFieldTableViewCell.textField];
		_cellTextFieldTableViewCell.textField.text = self.student.cell;
	}
	
	return _cellTextFieldTableViewCell;
}

- (FGEmailTextFieldTableViewCell *)emailTextFieldTableViewCell
{
	if (!_emailTextFieldTableViewCell) {
		_emailTextFieldTableViewCell = [self.tableView dequeueReusableCellWithIdentifier:FGEmailTextFieldTableViewCellIdentifier
																			forIndexPath:[NSIndexPath indexPathForRow:kTextFieldRowEmail inSection:kSectionInputTextFields]];
		[self.textFieldEventHandlerHelper registerTextField:_emailTextFieldTableViewCell.textField];
		_emailTextFieldTableViewCell.textField.text = self.student.email;
	}
	
	return _emailTextFieldTableViewCell;
}

- (FGAvatarTableViewCell *)avatarTableViewCell
{
	if (!_avatarTableViewCell) {
		_avatarTableViewCell = [self.tableView dequeueReusableCellWithIdentifier:FGAvatarTableViewCellIdentifier
																	forIndexPath:[NSIndexPath indexPathForRow:0 inSection:kSectionAvatar]];
		[_avatarTableViewCell.avatarImageView setImageURL:[self.student avatarImageURL]
											   completion:nil];
	}
	
	return _avatarTableViewCell;
}

- (FGAddPhotoTableViewCell *)addPhotoTableViewCell
{
	if (!_addPhotoTableViewCell) {
		_addPhotoTableViewCell = [self.tableView dequeueReusableCellWithIdentifier:FGAddPhotoTableViewCellIdentifier
																	  forIndexPath:[NSIndexPath indexPathForRow:0 inSection:kSectionAddPhoto]];
		_addPhotoTableViewCell.button.tapHandler = ^{
			if (![self hasAddedPhoto]) {
				[self addPhoto];
			} else {
				[self removePhoto];
			}
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
	[self updateAddPhotoCellState];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	
	[self dismissKeyboard];
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
		[_tableView registerClass:[FGPhoneTextFieldTableViewCell class]
		   forCellReuseIdentifier:FGPhoneTextFieldTableViewCellIdentifier];
		[_tableView registerClass:[FGCellTextFieldTableViewCell class]
		   forCellReuseIdentifier:FGCellTextFieldTableViewCellIdentifier];
		[_tableView registerClass:[FGEmailTextFieldTableViewCell class]
		   forCellReuseIdentifier:FGEmailTextFieldTableViewCellIdentifier];
	}
	
	return _tableView;
}

#pragma mark - User interaction handlers

- (void)doneButtonTapped:(id)sender
{
	NSAssert([self validateContent], @"Content is not valid: button should be disabled");
	
	[self dismissKeyboard];
	
	FGStudent *student = self.student;
	if (!student) {
		student = [[self databaseManager] insertEntity:[FGStudent entityName]];
	}
	
	student.firstName = self.firstNameTextFieldTableViewCell.textField.text;
	student.lastName = self.lastNameTextFieldTableViewCell.textField.text;
	student.email = self.emailTextFieldTableViewCell.textField.text;
	student.phone = self.phoneTextFieldTableViewCell.textField.text;
	student.cell = self.cellTextFieldTableViewCell.textField.text;
	
	NSURL *avatarURL = self.avatarTableViewCell.avatarImageView.imageURL;
	
	const BOOL isExistingStudent = !!self.student;
	const BOOL hasChangedAvatarImage = ![self.avatarTableViewCell.avatarImageView.imageURL isFileURL];
	
	if (!isExistingStudent || hasChangedAvatarImage) {
		[FGAvatarImageFileHelper clearAvatarImageFile:student.avatarImageFile
									  databaseManager:[self databaseManager]];
		
		if (avatarURL) {
			student.avatarImageURLString = [avatarURL absoluteString];
		} else {
			UIImage *createdImage = self.avatarTableViewCell.avatarImageView.imageView.image;
			if (createdImage) {
				FGAvatarImageFile *avatarImageFile = [FGAvatarImageFileHelper avatarImageFileWithImage:createdImage
																					   databaseManager:[self databaseManager]];
				student.avatarImageFile = avatarImageFile;
			}
		}
	}

	[[self databaseManager] saveContext];
	
	if (self.completionHandler) {
		self.completionHandler(student);
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
			
		case kSectionInputTextFields:
			return kNumberOfTextFieldsRows;
			
		default:
			break;
	}
	
	NSAssert(NO, @"Unhandled section");
	
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	__kindof FGSeparatedTableViewCell *cell = nil;
	
	switch (indexPath.section) {
		case kSectionAvatar:
			cell = self.avatarTableViewCell;
			cell.topSeparator.hidden = YES;
			cell.bottomSeparator.hidden = YES;
			
			break;
			
		case kSectionAddPhoto:
			cell = self.addPhotoTableViewCell;
			cell.topSeparator.hidden = YES;
			cell.bottomSeparator.hidden = YES;
			
			break;
			
		case kSectionInputTextFields: {
			switch (indexPath.row) {
				case kTextFieldRowFirstName:
					cell = self.firstNameTextFieldTableViewCell;
					cell.bottomSeparator.hidden = YES;
					
					break;
					
				case kTextFieldRowLastName:
					cell = self.lastNameTextFieldTableViewCell;
					cell.bottomSeparator.hidden = YES;
					
					break;
				case kTextFieldRowEmail:
					cell = self.emailTextFieldTableViewCell;
					cell.bottomSeparator.hidden = YES;
					
					break;
				case kTextFieldRowCell:
					cell = self.cellTextFieldTableViewCell;
					cell.bottomSeparator.hidden = YES;
					
					break;
				case kTextFieldRowPhone:
					cell = self.phoneTextFieldTableViewCell;
					
					break;
				default:
					break;
			}
			
			break;
		}
			
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
