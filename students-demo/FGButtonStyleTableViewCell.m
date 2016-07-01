//
//  FGButtonStyleTableViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGButtonStyleTableViewCell.h"

#import "UIColor+CustomColors.h"

@implementation FGButtonStyleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		self.textLabel.textColor = [UIColor buttonTextColor];
	}
	
	return self;
}

@end
