//
//  FGAddPhotoTableViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGAddPhotoTableViewCell.h"

#import "FGLocalization.h"

NSString * const FGAddPhotoTableViewCellIdentifier = @"FGAddPhotoTableViewCell";

@implementation FGAddPhotoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		self.textLabel.text = FGLocalizedString(@"Add Profile Photo", @"Add photo button title");
		self.textLabel.textAlignment = NSTextAlignmentCenter;
		
		self.topSeparator.hidden = YES;
		self.bottomSeparator.hidden = YES;
	}
	
	return self;
}

@end
