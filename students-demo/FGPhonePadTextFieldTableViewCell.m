//
//  FGNumberInputTextFieldTableViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 03/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGPhonePadTextFieldTableViewCell.h"

@implementation FGPhonePadTextFieldTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		self.textField.keyboardType = UIKeyboardTypePhonePad;
	}
	
	return self;
}

@end
