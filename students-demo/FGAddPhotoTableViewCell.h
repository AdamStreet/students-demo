//
//  FGAddPhotoTableViewCell.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGButtonedTableViewCell.h"

typedef NS_ENUM(NSInteger, FGAddPhotoTableViewCellAvatarState)
{
	FGAddPhotoTableViewCellAvatarStateNoAvatar = 0,
	FGAddPhotoTableViewCellAvatarStateAssignedAvatar
};

extern NSString * const FGAddPhotoTableViewCellIdentifier;

@interface FGAddPhotoTableViewCell : FGButtonedTableViewCell

@property (nonatomic) FGAddPhotoTableViewCellAvatarState avatarState;

@end
