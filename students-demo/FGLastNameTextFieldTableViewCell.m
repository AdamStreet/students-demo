//
//  FGLastNameTextFieldTableViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGLastNameTextFieldTableViewCell.h"

#import "FGLocalization.h"

NSString * const FGLastNameTextFieldTableViewCellIdentifier = @"FGLastNameTextFieldTableViewCell";

@implementation FGLastNameTextFieldTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		self.textField.placeholder = FGLocalizedString(@"Last name", @"Student input placeholder");
		self.prefixLabel.text = FGLocalizedString(@"Last", @"Student input prefix");
	}
	
	return self;
}

@end
