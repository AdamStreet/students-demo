//
//  FGImagedLabel.h
//  students-demo
//
//  Created by Adam Szabo on 03/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGView.h"

#import "FGLabel.h"
#import "FGImageView.h"

@interface FGImagedLabel : FGView

@property (nonatomic, readonly) FGImageView *imageView;
@property (nonatomic, readonly) FGLabel *label;

@end
