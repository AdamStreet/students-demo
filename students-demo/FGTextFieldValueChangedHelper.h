//
//  FGTextFieldValueChangedHandler.h
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FGTextField;

typedef void(^FGTextFieldValueChangedHelperChangeHandler)();

@interface FGTextFieldValueChangedHelper : NSObject

@property (nonatomic, copy) FGTextFieldValueChangedHelperChangeHandler changeHandler;

- (void)registerTextField:(FGTextField *)textField;
- (void)foldTextField:(FGTextField *)textField;

- (NSSet<FGTextField *> *)registeredTextFields;

@end
