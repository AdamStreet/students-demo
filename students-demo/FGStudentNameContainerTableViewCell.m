//
//  FGStudentNameContainerTableViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGStudentNameContainerTableViewCell.h"

@implementation FGStudentNameContainerTableViewCell

#pragma mark - Initialization

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		self.textLabel.textAlignment = NSTextAlignmentCenter;
		
		self.backgroundColor = [UIColor clearColor];
	}
	
	return self;
}

@end
