//
//  FGStudentCardBackgroundView.h
//  students-demo
//
//  Created by Adam Szabo on 03/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGStudentCardView.h"

#import "FGImagedLabel.h"
#import "FGButton.h"

@interface FGStudentCardBackgroundView : FGStudentCardView

@property (nonatomic, readonly) FGLabel *nameLabel;
@property (nonatomic, readonly) FGImagedLabel *phoneLabel;
@property (nonatomic, readonly) FGImagedLabel *cellLabel;
@property (nonatomic, readonly) FGImagedLabel *emailLabel;

@property (nonatomic, readonly) FGButton *trashButton;
@property (nonatomic, readonly) FGButton *editButton;

@end
