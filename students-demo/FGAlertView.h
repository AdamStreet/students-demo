//
//  FGAlertView.h
//  students-demo
//
//  Created by Adam Szabo on 01/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FGAlertViewCompletion)(NSInteger tappedButtonIndex, NSInteger cancelButtonIndex);

@interface FGAlertView : NSObject

- (instancetype)initWithTitle:(NSString *)title
					  message:(NSString *)message
			cancelButtonTitle:(NSString *)cancelButtonTitle
			otherButtonTitles:(NSArray<NSString *> *)otherButtonTitles
				   completion:(FGAlertViewCompletion)completion;

- (void)show;

@end
