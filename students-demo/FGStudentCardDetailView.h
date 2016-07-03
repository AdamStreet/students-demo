//
//  FGStudentDetailView.h
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGStudentCardView.h"

#import "FGAvatarImageView.h"
#import "FGLabel.h"

@interface FGStudentCardDetailView : FGStudentCardView

@property (nonatomic, readonly) FGAvatarImageView *avatarImageView;
@property (nonatomic, readonly) FGLabel *nameLabel;
@property (nonatomic, readonly) FGLabel *majorLabel;

@end
