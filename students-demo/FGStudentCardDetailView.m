//
//  FGStudentDetailView.m
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGStudentCardDetailView.h"

#import "FGGradientView.h"
#import "UIColor+CustomColors.h"
#import "FGButton.h"

@interface FGStudentCardDetailView ()

@property (nonatomic) FGAvatarImageView *avatarImageView;
@property (nonatomic) FGLabel *nameLabel;

@property (nonatomic) FGGradientView *topShadow;
@property (nonatomic) FGGradientView *bottomShadow;

@property (nonatomic) FGButton *fakeInfoButton;

@end

@implementation FGStudentCardDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		UIView *contentView = self;
		
		FGAvatarImageView *avatarImageView = [[FGAvatarImageView alloc] initWithFrame:CGRectZero];
		[contentView addSubview:avatarImageView];
		self.avatarImageView = avatarImageView;
		
		FGLabel *nameLabel = [[FGLabel alloc] initWithFrame:CGRectZero];
		nameLabel.textAlignment = NSTextAlignmentCenter;
		[contentView addSubview:nameLabel];
		self.nameLabel = nameLabel;
		
		FGButton *fakeInfoButton = [[FGButton alloc] initWithFrame:CGRectZero];
		[fakeInfoButton setImage:[UIImage imageNamed:@"icon_button_info"]
						forState:UIControlStateNormal];
		[contentView addSubview:fakeInfoButton];
		self.fakeInfoButton = fakeInfoButton;
		
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
		
		avatarImageView.translatesAutoresizingMaskIntoConstraints = NO;
		nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
		fakeInfoButton.translatesAutoresizingMaskIntoConstraints = NO;
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
	
	UIView *avatarImageView = self.avatarImageView;
	UIView *nameLabel = self.nameLabel;
	UIView *topShadow = self.topShadow;
	UIView *bottomShadow = self.bottomShadow;
	UIView *fakeInfoButton = self.fakeInfoButton;
	
	NSDictionary *subviews = NSDictionaryOfVariableBindings(topShadow, bottomShadow, nameLabel, fakeInfoButton, avatarImageView);
	
	// Avatar image view
	static const CGFloat kGapBetweenElements = 10.0;
	static const CGFloat kAvatarSize = 75.0;
	[contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(gap)-[avatarImageView]"
																		options:0
																		metrics:@{@"gap" : @(kGapBetweenElements)}
																		  views:subviews]];
	[contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(gap)-[avatarImageView(height)]"
																		options:0
																		metrics:@{@"gap" : @(kGapBetweenElements),
																				  @"height" : @(kAvatarSize)}
																		  views:subviews]];
	[avatarImageView addConstraint:[NSLayoutConstraint constraintWithItem:avatarImageView
																attribute:NSLayoutAttributeWidth
																relatedBy:NSLayoutRelationEqual
																   toItem:avatarImageView
																attribute:NSLayoutAttributeHeight
															   multiplier:1.0
																 constant:0.0]];
	
	// Name label
	[contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[avatarImageView]-(gap)-[nameLabel]-|"
																		options:0
																		metrics:@{@"gap" : @(kGapBetweenElements)}
																		  views:subviews]];
	[contentView addConstraint:[NSLayoutConstraint constraintWithItem:nameLabel
															attribute:NSLayoutAttributeCenterY
															relatedBy:NSLayoutRelationEqual
															   toItem:avatarImageView
															attribute:NSLayoutAttributeCenterY
														   multiplier:1.0
															 constant:0.0]];
	
	// Info
	[contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[fakeInfoButton]-(gap)-|"
																		options:0
																		metrics:@{@"gap" : @(kGapBetweenElements)}
																		  views:subviews]];
	[contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[fakeInfoButton]-(gap)-|"
																		options:0
																		metrics:@{@"gap" : @(kGapBetweenElements)}
																		  views:subviews]];
	
	// Shadows
	
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
