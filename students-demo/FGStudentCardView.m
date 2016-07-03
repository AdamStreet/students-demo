//
//  FGStudentCardView.m
//  students-demo
//
//  Created by Adam Szabo on 03/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGStudentCardView.h"

#import "UIColor+CustomColors.h"

@interface FGStudentCardView ()

@property (nonatomic) FGView *contentView;
@property (nonatomic) FGGradientView *topShadow;
@property (nonatomic) FGGradientView *bottomShadow;

@end


@implementation FGStudentCardView

#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		UIView *view = self;
		
		self.backgroundColor = [UIColor cardBackgroundColor];
		
		FGView *contentView = self.contentView;
		[view addSubview:contentView];
		
		FGGradientView *topShadow = self.topShadow;
		[view addSubview:topShadow];
		
		FGGradientView *bottomShadow = self.bottomShadow;
		[view addSubview:bottomShadow];
		
		// Prepare for autolayout
		
		contentView.translatesAutoresizingMaskIntoConstraints = NO;
		topShadow.translatesAutoresizingMaskIntoConstraints = NO;
		bottomShadow.translatesAutoresizingMaskIntoConstraints = NO;
	}
	
	return self;
}

#pragma mark - View lifecycle

- (void)setupInitialConstraints
{
	[super setupInitialConstraints];
	
	UIView *view = self;
	
	UIView *contentView = self.contentView;
	
	UIView *topShadow = self.topShadow;
	UIView *bottomShadow = self.bottomShadow;
	
	
	NSDictionary *subviews = NSDictionaryOfVariableBindings(contentView, topShadow, bottomShadow);
	
	[view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[contentView]-|"
																 options:0
																 metrics:nil
																   views:subviews]];
	[view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[contentView]-|"
																 options:0
																 metrics:nil
																   views:subviews]];
	
	static const CGFloat kShadowHeight = 15.0;
	[view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[topShadow]|"
																		options:0
																		metrics:nil
																		  views:subviews]];
	[view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topShadow(height)]"
																		options:0
																		metrics:@{@"height" : @(kShadowHeight)}
																		  views:subviews]];
	
	[view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[bottomShadow]|"
																		options:0
																		metrics:nil
																		  views:subviews]];
	[view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bottomShadow(height)]|"
																		options:0
																		metrics:@{@"height" : @(kShadowHeight)}
																		  views:subviews]];
}

#pragma mark - Public methods
#pragma mark Accessors

- (FGView *)contentView
{
	if (!_contentView) {
		_contentView = [[FGView alloc] initWithFrame:CGRectZero];
	}
	
	return _contentView;
}

- (FGGradientView *)topShadow
{
	if (!_topShadow) {
		_topShadow = [[FGGradientView alloc] initWithFrame:CGRectZero];
		[_topShadow setColors:@[[UIColor shadowStartColor],
								[UIColor shadowEndColor]]];
	}
	
	return _topShadow;
}

- (FGGradientView *)bottomShadow
{
	if (!_bottomShadow) {
		_bottomShadow = [[FGGradientView alloc] initWithFrame:CGRectZero];
		[_bottomShadow setColors:@[[UIColor shadowEndColor],
								   [UIColor shadowStartColor]]];
	}
	
	return _bottomShadow;
}

#pragma mark Overrides
#pragma mark - User interaction handlers
#pragma mark - Notification handlers
#pragma mark - KVO
#pragma mark - <>

@end
