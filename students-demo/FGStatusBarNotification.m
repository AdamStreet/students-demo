//
//  FGStatusBarNotification.m
//  students-demo
//
//  Created by Adam Szabo on 03/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGStatusBarNotification.h"

#import "UIColor+CustomColors.h"
#import "FGButton.h"

@interface FGStatusBarNotification ()

@property (nonatomic) FGButton *alertLabel;

@property (nonatomic) NSTimer *dismissTimer;

@end

static const CGFloat kNotificationHeight = 64.0;

@implementation FGStatusBarNotification

#pragma mark - Initialization

static FGStatusBarNotification *sharedInstance = nil;

+ (BOOL)isSharedNotificationInitialized
{
	return !!sharedInstance;
}

+ (void)initializeSharedNotification
{
	if (sharedInstance) {
		NSAssert(NO, @"Shared instance already initialized");
		
		return;
	}
	
	sharedInstance = [[self alloc] init];
}

+ (instancetype)sharedNotification
{
	if (![self isSharedNotificationInitialized]) {
//		NSAssert(NO, @"Shared instance has not been initialized");
		
		[self initializeSharedNotification];
	}
	
	return sharedInstance;
}

- (instancetype)init
{
	self = [super init];
	if (self) {
	}

	return self;
}

#pragma mark - Private methods

- (void)showAlertView:(BOOL)animated
{
	UIView *alertLabel = self.alertLabel;
	
	UIView *superView = [UIApplication sharedApplication].keyWindow;
	alertLabel.frame = CGRectMake(0.0, 0.0, superView.frame.size.width, kNotificationHeight);
	
	if (![self isVisible]) {
		[superView addSubview:alertLabel];
	}
	
	const CGAffineTransform hiddenStateTransform = CGAffineTransformMakeTranslation(0.0, -kNotificationHeight);
	alertLabel.transform = hiddenStateTransform;
	
	[UIView animateWithDuration:0.5
						  delay:0.0
						options:kNilOptions
					 animations:^{
						 alertLabel.transform = CGAffineTransformIdentity;
					 }
					 completion:nil];
}

- (void)dismissAfterDelay:(NSTimeInterval)afterDelay
{
	if (0.0 < afterDelay) {
		self.dismissTimer = [NSTimer scheduledTimerWithTimeInterval:afterDelay
															 target:self
														   selector:@selector(dimissTimerFired:)
														   userInfo:nil
															repeats:NO];
	} else {
		self.dismissTimer = nil;
	}
}

- (void)showWithTitle:(NSString *)title
autoDismissAfterDelay:(NSTimeInterval)afterDelay
		   tapHandler:(FGButtonTapHandler)tapHandler
{
	[self setTitle:title
		tapHandler:tapHandler];
	
	if (!self.isVisible) {
		[self showAlertView:YES];
	}
	
	[self dismissAfterDelay:afterDelay];
}

- (void)setTitle:(NSString *)title
	  tapHandler:(FGButtonTapHandler)tapHandler
{
	self.alertLabel.tapHandler = tapHandler;
	
	[self.alertLabel setTitle:title
					 forState:UIControlStateNormal];
	
	self.dismissTimer = nil;
}

- (void)dismiss:(BOOL)animated
{
	self.alertLabel.tapHandler = nil;
	
	self.dismissTimer = nil;
	
	UIView *alertLabel = self.alertLabel;
	
	const CGAffineTransform hiddenStateTransform = CGAffineTransformMakeTranslation(0.0, -kNotificationHeight);
	
	[UIView animateWithDuration:0.5
						  delay:0.0
						options:kNilOptions
					 animations:^{
						 alertLabel.transform = hiddenStateTransform;
					 }
					 completion:^(BOOL finished) {
						 alertLabel.transform = CGAffineTransformIdentity;
						 [alertLabel removeFromSuperview];
					 }];
}

- (BOOL)isVisible
{
	return !!self.alertLabel.superview;
}

#pragma mark Accessors

- (FGButton *)alertLabel
{
	if (!_alertLabel) {
		_alertLabel = [[FGButton alloc] initWithFrame:CGRectZero];
		_alertLabel.titleLabel.textAlignment = NSTextAlignmentCenter;
		_alertLabel.titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
		[_alertLabel setTitleColor:[UIColor statusNotificationTitleColor]
						  forState:UIControlStateNormal];
		_alertLabel.autoresizingMask = (UIViewAutoresizingFlexibleWidth);
		_alertLabel.backgroundColor = [UIColor statusNotificationBackgroundColor];
		
		_alertLabel.titleLabel.adjustsFontSizeToFitWidth = YES;
		_alertLabel.titleLabel.minimumScaleFactor = (12.0 / _alertLabel.titleLabel.font.pointSize);
	}
	
	return _alertLabel;
}

- (void)setDismissTimer:(NSTimer *)dismissTimer
{
	[_dismissTimer invalidate];
	
	_dismissTimer = dismissTimer;
}

#pragma mark - Public methods

+ (void)showWithTitle:(NSString *)title
autoDismissAfterDelay:(NSTimeInterval)afterDelay
		   tapHandler:(FGButtonTapHandler)tapHandler
{
	[[self sharedNotification] showWithTitle:title
					   autoDismissAfterDelay:afterDelay
								  tapHandler:tapHandler];
}

+ (void)showWithTitle:(NSString *)title
{
	[[self sharedNotification] showWithTitle:title
					   autoDismissAfterDelay:0.0
								  tapHandler:nil];
}

+ (void)setTitle:(NSString *)title
{
	[self setTitle:title tapHandler:nil];
}

+ (void)setTitle:(NSString *)title
	  tapHandler:(FGButtonTapHandler)tapHandler
{
	[[self sharedNotification] setTitle:title
							 tapHandler:tapHandler];
}

+ (void)dismiss
{
	[[self sharedNotification] dismiss:YES];
}

+ (void)dismissAfterDelay:(NSTimeInterval)afterDelay
{
	[[self sharedNotification] dismissAfterDelay:afterDelay];
}

+ (BOOL)isVisible
{
	return [[self sharedNotification] isVisible];
}

#pragma mark Accessors
#pragma mark Overrides
#pragma mark - User interaction handlers
#pragma mark - Notification handlers

- (void)dimissTimerFired:(id)sender
{
	[self dismiss:YES];
	
	self.dismissTimer = nil;
}

#pragma mark - KVO
#pragma mark - <>

@end
