//
//  FGStatusBarNotification.h
//  students-demo
//
//  Created by Adam Szabo on 03/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FGButton.h"

@interface FGStatusBarNotification : NSObject

+ (void)showWithTitle:(NSString *)title;
+ (void)showWithTitle:(NSString *)title
autoDismissAfterDelay:(NSTimeInterval)afterDelay
		   tapHandler:(FGButtonTapHandler)tapHandler;

+ (void)setTitle:(NSString *)title;
+ (void)setTitle:(NSString *)title
	  tapHandler:(FGButtonTapHandler)tapHandler;

+ (void)dismiss;
+ (void)dismissAfterDelay:(NSTimeInterval)afterDelay;

+ (BOOL)isVisible;

@end
