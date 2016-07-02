//
//  FGLastNameTableViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 01/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGLastNameTableViewCell.h"

NSString * const FGLastNameTableViewCellIdentifier = @"FGLastNameTableViewCell";

@implementation FGLastNameTableViewCell

#pragma mark - Initialization

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
	}
	
	return self;
}

#pragma mark - Private methods

- (void)updateLabels
{
	self.textLabel.text = self.student.lastName;
}

#pragma mark - Public methods

#pragma mark Overrides

- (void)setStudent:(FGStudent *)student
{
	[super setStudent:student];
	
	[self updateLabels];
}
@end
