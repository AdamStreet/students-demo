//
//  FGTextFieldValueChangedHandler.m
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGTextFieldValueChangedHelper.h"

#import "FGTextField.h"

@interface FGTextFieldValueChangedHelper ()

@property (nonatomic) NSMutableSet<FGTextField *> *registeredTextFieldsInternalSet;

@end


@implementation FGTextFieldValueChangedHelper

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
}

- (void)foldTextField:(FGTextField *)textField
{
	[self.registeredTextFieldsInternalSet removeObject:textField];
}

- (NSSet<FGTextField *> *)registeredTextFields
{
	return [self.registeredTextFieldsInternalSet copy];
}

#pragma mark Accessors

#pragma mark - Notification handlers

- (void)handleTextFieldTextDidChangeNotification:(NSNotification *)notification
{
	FGTextField *textField = notification.object;
	
	NSAssert(textField, @"Missing text field - how is that possible?");
	
	if ([[self registeredTextFields] containsObject:textField]) {
		if (self.changeHandler) {
			self.changeHandler(notification.object);
		}
	}
}

@end
