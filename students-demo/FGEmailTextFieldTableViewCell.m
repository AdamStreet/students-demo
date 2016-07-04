//
//  FGEmailTextFieldTableViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 03/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGEmailTextFieldTableViewCell.h"

#import "FGLocalization.h"

NSString * const FGEmailTextFieldTableViewCellIdentifier = @"FGEmailTextFieldTableViewCell";

@implementation FGEmailTextFieldTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		self.textField.keyboardType = UIKeyboardTypeEmailAddress;
		self.prefixLabel.text = FGLocalizedString(@"Email", @"Student input prefix");
		self.textField.placeholder = FGLocalizedString(@"Email address", @"Student input placeholder");
	}
	
	return self;
}

@end
