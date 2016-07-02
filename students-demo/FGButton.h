//
//  FGButton.h
//  students-demo
//
//  Created by Adam Szabo on 01/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FGButtonTapHandler)();

@interface FGButton : UIButton

@property (nonatomic, copy) FGButtonTapHandler tapHandler;

@end
