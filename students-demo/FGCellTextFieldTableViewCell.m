//
//  FGCellTextFieldTableViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 03/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGCellTextFieldTableViewCell.h"

#import "FGLocalization.h"

NSString * const FGCellTextFieldTableViewCellIdentifier = @"FGCellTextFieldTableViewCell";

@implementation FGCellTextFieldTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		self.textField.placeholder = FGLocalizedString(@"Cell number", @"Student input placeholder");
		self.prefixLabel.text = FGLocalizedString(@"Cell", @"Student input prefix");
	}
	
	return self;
}

@end
