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
		[self updateLabel];
	}
	
	return self;
}

- (void)updateLabel
{
	NSString *title = nil;
	switch (self.avatarState) {
		case FGAddPhotoTableViewCellAvatarStateNoAvatar:
			title = FGLocalizedString(@"Add Profile Photo", @"Manipulate Photo button title");
			
			break;
			
		case FGAddPhotoTableViewCellAvatarStateAssignedAvatar:
			title = FGLocalizedString(@"Remove Profile Photo", @"Manipulate Photo button title");
			
			break;
			
		default:
			break;
	}
	
	[self.button setTitle:title
				 forState:UIControlStateNormal];
}

- (void)setAvatarState:(FGAddPhotoTableViewCellAvatarState)avatarState
{
	_avatarState = avatarState;
	
	[self updateLabel];
}

@end
