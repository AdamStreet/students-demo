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
		
		FGGradientView *topShadow = [[FGGradientView alloc] initWithFrame:CGRectZero];
		[topShadow setColors:@[[UIColor shadowStartColor],
							   [UIColor shadowEndColor]]];
		[contentView addSubview:topShadow];
		self.topShadow = topShadow;
		
		FGGradientView *bottomShadow = [[FGGradientView alloc] initWithFrame:CGRectZero];
		[bottomShadow setColors:@[[UIColor shadowEndColor],
								  [UIColor shadowStartColor]]];
		[contentView addSubview:bottomShadow];
		self.bottomShadow = bottomShadow;
		
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

@end
