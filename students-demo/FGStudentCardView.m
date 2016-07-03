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

@property (nonatomic) FGGradientView *topShadow;
@property (nonatomic) FGGradientView *bottomShadow;

@end


@implementation FGStudentCardView

#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		UIView *contentView = self;
		
		self.backgroundColor = [UIColor cardBackgroundColor];
		
		FGGradientView *topShadow = self.topShadow;
		[contentView addSubview:topShadow];
		
		FGGradientView *bottomShadow = self.bottomShadow;
		[contentView addSubview:bottomShadow];
		
		// Prepare for autolayout
		
		topShadow.translatesAutoresizingMaskIntoConstraints = NO;
		bottomShadow.translatesAutoresizingMaskIntoConstraints = NO;
	}
	
	return self;
}

#pragma mark - View lifecycle

- (void)setupInitialConstraints
{
	[super setupInitialConstraints];
	
	UIView *contentView = self;
	
	UIView *topShadow = self.topShadow;
	UIView *bottomShadow = self.bottomShadow;
	
	NSDictionary *subviews = NSDictionaryOfVariableBindings(topShadow, bottomShadow);
	
	static const CGFloat kShadowHeight = 15.0;
	[contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[topShadow]|"
																		options:0
																		metrics:nil
																		  views:subviews]];
	[contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topShadow(height)]"
																		options:0
																		metrics:@{@"height" : @(kShadowHeight)}
																		  views:subviews]];
	
	[contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[bottomShadow]|"
																		options:0
																		metrics:nil
																		  views:subviews]];
	[contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bottomShadow(height)]|"
																		options:0
																		metrics:@{@"height" : @(kShadowHeight)}
																		  views:subviews]];
}

#pragma mark - Public methods
#pragma mark Accessors

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
