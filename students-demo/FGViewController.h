//
//  ViewController.h
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FGViewControllerDismissHandler)(__kindof UIViewController *presentingViewController);
@interface FGViewController : UIViewController

@property (nonatomic, copy) FGViewControllerDismissHandler cancellationHandler;

- (instancetype)initWithoutNib;

@end

