//
//  FGStudentTableViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGStudentTableViewCell.h"

#import "FGStudent.h"

NSString * const FGStudentTableViewCellIdentifier = @"FGStudentTableViewCell";

@implementation FGStudentTableViewCell

#pragma mark - Initialization

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	
	return self;
}

#pragma mark - Private methods

- (void)updateLabels
{
	self.textLabel.text = [self.student fullName];
}

#pragma mark Accessors
#pragma mark - View lifecycle
#pragma mark - Public methods
#pragma mark Accessors

- (void)setStudent:(FGStudent *)student
{
	_student = student;
	
	[self updateLabels];
}

#pragma mark Overrides
#pragma mark - User interaction handlers
#pragma mark - Notification handlers
#pragma mark - KVO
#pragma mark - <<#delegate#>>

@end
