//
//  FGGradientView.h
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FGGradientView : UIView

@property (nonatomic, readonly) CAGradientLayer *layer;

- (void)setColors:(NSArray<UIColor *> *)colors;

@end
