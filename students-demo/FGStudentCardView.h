//
//  FGStudentCardView.h
//  students-demo
//
//  Created by Adam Szabo on 03/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGView.h"

#import "FGGradientView.h"

@interface FGStudentCardView : FGView

@property (nonatomic, readonly) FGView *contentView;

@property (nonatomic, readonly) FGGradientView *topShadow;
@property (nonatomic, readonly) FGGradientView *bottomShadow;

@end
