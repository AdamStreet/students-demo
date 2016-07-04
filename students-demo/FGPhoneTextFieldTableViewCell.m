//
//  FGPhoneTextFieldTableViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 03/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGPhoneTextFieldTableViewCell.h"

#import "FGLocalization.h"

NSString * const FGPhoneTextFieldTableViewCellIdentifier = @"FGPhoneTextFieldTableViewCell";

@implementation FGPhoneTextFieldTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		self.textField.placeholder = FGLocalizedString(@"Phone number", @"Student input placeholder");
		self.prefixLabel.text = FGLocalizedString(@"Phone", @"Student input prefix");
	}
	
	return self;
}

@end
