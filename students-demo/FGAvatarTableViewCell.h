//
//  FGAvatarTableViewCell.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGTransparentTableViewCell.h"

@class FGAvatarImageView;

extern NSString * const FGAvatarTableViewCellIdentifier;

@interface FGAvatarTableViewCell : FGTransparentTableViewCell

@property (nonatomic, readonly) FGAvatarImageView *avatarImageView;

@end
