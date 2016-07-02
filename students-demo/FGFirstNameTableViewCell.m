//
//  FGFirstNameTableViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 01/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGFirstNameTableViewCell.h"

NSString * const FGFirstNameTableViewCellIdentifier = @"FGFirstNameTableViewCell";

@implementation FGFirstNameTableViewCell

#pragma mark - Private methods

- (void)updateLabels
{
	self.textLabel.text = self.student.firstName;
}

#pragma mark - Public methods

#pragma mark Overrides

- (void)setStudent:(FGStudent *)student
{
	[super setStudent:student];
	
	[self updateLabels];
}

@end
