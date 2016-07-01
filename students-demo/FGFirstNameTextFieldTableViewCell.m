//
//  FGFirstNameTextFieldTableViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGFirstNameTextFieldTableViewCell.h"

#import "FGLocalization.h"

NSString * const FGFirstNameTextFieldTableViewCellIdentifier = @"FGFirstNameTextFieldTableViewCell";

@implementation FGFirstNameTextFieldTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		self.textField.placeholder = FGLocalizedString(@"First name", @"First name placeholder");
		self.prefixLabel.text = FGLocalizedString(@"First", @"First name prefix");
		
		self.bottomSeparator.hidden = YES;
	}
	
	return self;
}
@end
