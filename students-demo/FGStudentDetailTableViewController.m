//
//  FGStudentDetailTableViewController.m
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGStudentDetailTableViewController.h"

#import "FGFirstNameTableViewCell.h"
#import "FGLastNameTableViewCell.h"
#import "FGStudentAvatarTableViewCell.h"
#import "FGLocalization.h"

@interface FGStudentDetailTableViewController ()

@property (nonatomic) FGStudent *student;

@end

typedef NS_ENUM(NSUInteger, SectionNames) {
	kSectionNameAvatarImage = 0,
	kSectionNameFullName = 1,
	kNumberOfSections = 2
};

typedef NS_ENUM(NSUInteger, FullNameRowName) {
	kFullNameRowNameFirstName = 0,
	kFullNameRowNameLastName = 1,
	kNumberOfFullNameRows = 2
};

@implementation FGStudentDetailTableViewController

@synthesize tableView = _tableView;

#pragma mark - Initialization

- (id)initWithStudent:(FGStudent *)student
{
	self = [super initWithStyle:UITableViewStyleGrouped];
	if (self) {
		self.student = student;
		
		self.title = FGLocalizedString(@"Student Info", @"Student detail screen title");
	}
	
	return self;
}

#pragma mark - Private methods
#pragma mark Accessors
#pragma mark - View lifecycle
#pragma mark - Public methods
#pragma mark Accessors

- (FGTableView *)tableView
{
	if (!_tableView) {
		_tableView = [super tableView];
		
		[_tableView registerClass:[FGFirstNameTableViewCell class]
		   forCellReuseIdentifier:FGFirstNameTableViewCellIdentifier];
		[_tableView registerClass:[FGLastNameTableViewCell class]
		   forCellReuseIdentifier:FGLastNameTableViewCellIdentifier];
		[_tableView registerClass:[FGStudentAvatarTableViewCell class]
		   forCellReuseIdentifier:FGStudentAvatarTableViewCellIdentifier];
	}
	
	return _tableView;
}

#pragma mark Overrides
#pragma mark - User interaction handlers
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
		case kSectionNameAvatarImage:
			return 1;
		case kSectionNameFullName:
			return kNumberOfFullNameRows;
	}
	
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *cellIdentifier = nil;
	
	if (indexPath.section == kSectionNameAvatarImage) {
		cellIdentifier = FGStudentAvatarTableViewCellIdentifier;
	} else if (indexPath.section == kSectionNameFullName) {
		if (indexPath.row == kFullNameRowNameFirstName) {
			cellIdentifier = FGFirstNameTableViewCellIdentifier;
		} else if (indexPath.row == kFullNameRowNameLastName) {
			cellIdentifier = FGLastNameTableViewCellIdentifier;
		}
	}
	
	FGBaseStudentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
	
	cell.student = self.student;
	
	return cell;
}

#pragma mark - <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == kSectionNameAvatarImage)
		return 100.0;
	
	return tableView.rowHeight;
}

@end
