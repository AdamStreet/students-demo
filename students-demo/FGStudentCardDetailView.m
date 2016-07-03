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

@property (nonatomic) FGButton *fakeInfoButton;

@end

@implementation FGStudentCardDetailView

#pragma mark - Initialization 

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
		
		// Bring back shadows (optional)
		[contentView bringSubviewToFront:self.topShadow];
		[contentView bringSubviewToFront:self.bottomShadow];
		
		// Prepare for autolayout
		
		avatarImageView.translatesAutoresizingMaskIntoConstraints = NO;
		nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
		fakeInfoButton.translatesAutoresizingMaskIntoConstraints = NO;
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
	UIView *fakeInfoButton = self.fakeInfoButton;
	
	NSDictionary *subviews = NSDictionaryOfVariableBindings(nameLabel, fakeInfoButton, avatarImageView);
	
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
}

@end
