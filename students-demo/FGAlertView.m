//
//  FGAlertView.m
//  students-demo
//
//  Created by Adam Szabo on 01/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGAlertView.h"

@interface FGAlertView () <UIAlertViewDelegate>

@property (nonatomic) UIAlertView *alertView;
@property (nonatomic, copy) FGAlertViewCompletion completion;

@end


@implementation FGAlertView

- (instancetype)initWithTitle:(NSString *)title
					  message:(NSString *)message
			cancelButtonTitle:(NSString *)cancelButtonTitle
			otherButtonTitles:(NSArray<NSString *> *)otherButtonTitles
				   completion:(FGAlertViewCompletion)completion
{
	self = [super init];
	if (self) {
		self.completion = completion;
		
		UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
															message:message
														   delegate:self
												  cancelButtonTitle:cancelButtonTitle
												  otherButtonTitles:nil];
		[otherButtonTitles enumerateObjectsUsingBlock:^(NSString * _Nonnull otherButtonTitle, NSUInteger idx, BOOL * _Nonnull stop) {
			[alertView addButtonWithTitle:otherButtonTitle];
		}];
		self.alertView = alertView;
	}
	
	return self;
}

#pragma mark - Initialization
#pragma mark - Private methods
#pragma mark Accessors
#pragma mark - View lifecycle
#pragma mark - Public methods

- (void)show
{
	[self.alertView show];
}

#pragma mark Accessors
#pragma mark Overrides
#pragma mark - User interaction handlers
#pragma mark - Notification handlers
#pragma mark - KVO
#pragma mark - <UIAlertViewDelegate>

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (self.completion) {
		self.completion(buttonIndex, alertView.cancelButtonIndex);
	}
}

@end
