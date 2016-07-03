//
//  FGTextFieldValueChangedHandler.h
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FGTextField;

typedef void(^FGTextFieldEventHandlerHelperTextDidChangeHandler)(FGTextField *textField);
typedef BOOL(^FGTextFieldEventHandlerHelperShouldReturnHandler)(FGTextField *textField);

@interface FGTextFieldEventHandlerHelper : NSObject <UITextFieldDelegate>

@property (nonatomic, copy) FGTextFieldEventHandlerHelperTextDidChangeHandler changeHandler;
@property (nonatomic, copy) FGTextFieldEventHandlerHelperShouldReturnHandler finisingHandler;

- (void)registerTextField:(FGTextField *)textField;
- (void)foldTextField:(FGTextField *)textField;

- (NSSet<FGTextField *> *)registeredTextFields;

@end
