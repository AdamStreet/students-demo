//
//  FGTextFieldValueChangedHandler.m
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGTextFieldEventHandlerHelper.h"

#import "FGTextField.h"

@interface FGTextFieldEventHandlerHelper ()

@property (nonatomic) NSMutableSet<FGTextField *> *registeredTextFieldsInternalSet;

@end


@implementation FGTextFieldEventHandlerHelper

#pragma mark - Initialization

- (instancetype)init
{
	self = [super init];
	if (self) {
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(handleTextFieldTextDidChangeNotification:)
													 name:UITextFieldTextDidChangeNotification
												   object:nil];
	}
	return self;
}

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Private methods

- (FGTextField *)castedTextField:(UITextField *)textField
{
	if ([textField isKindOfClass:[FGTextField class]])
		return (FGTextField *)textField;
	
	return nil;
}

#pragma mark Accessors

- (NSMutableSet<FGTextField *> *)registeredTextFieldsInternalSet
{
	if (!_registeredTextFieldsInternalSet) {
		_registeredTextFieldsInternalSet = [NSMutableSet set];
	}
	
	return _registeredTextFieldsInternalSet;
}

#pragma mark - Public methods

- (void)registerTextField:(FGTextField *)textField
{
	[self.registeredTextFieldsInternalSet addObject:textField];
	textField.delegate = self;
}

- (void)foldTextField:(FGTextField *)textField
{
	[self.registeredTextFieldsInternalSet removeObject:textField];
	textField.delegate = nil;
}

- (NSSet<FGTextField *> *)registeredTextFields
{
	return [self.registeredTextFieldsInternalSet copy];
}

#pragma mark Accessors

#pragma mark - Notification handlers

- (void)handleTextFieldTextDidChangeNotification:(NSNotification *)notification
{
	FGTextField *textField = [self castedTextField:notification.object];
	
	if ([[self registeredTextFields] containsObject:textField]) {
		if (self.changeHandler) {
			self.changeHandler(notification.object);
		}
	}
}

#pragma mark - <UITextFieldDelegate>

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	FGTextField *potentionalTextField = [self castedTextField:textField];
	
	if ([[self registeredTextFields] containsObject:potentionalTextField]) {
		if (self.finisingHandler) {
			if(self.finisingHandler(potentionalTextField)) {
				[textField resignFirstResponder];
			}
		}
	}
	
	return NO;
}

@end
