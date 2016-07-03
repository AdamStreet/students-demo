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
		UIView *contentView = self.contentView;
		
		FGAvatarImageView *avatarImageView = self.avatarImageView;
		[contentView addSubview:avatarImageView];
		
		FGLabel *nameLabel = self.nameLabel;
		[contentView addSubview:nameLabel];
		
		FGButton *fakeInfoButton = self.fakeInfoButton;
		[contentView addSubview:fakeInfoButton];
		
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
	
	UIView *contentView = self.contentView;
	
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

#pragma mark - Public methods
#pragma mark Accessors

- (FGAvatarImageView *)avatarImageView
{
	if (!_avatarImageView) {
		_avatarImageView = [[FGAvatarImageView alloc] initWithFrame:CGRectZero];
	}
	
	return _avatarImageView;
}

- (FGLabel *)nameLabel
{
	if (!_nameLabel) {
		_nameLabel = [[FGLabel alloc] initWithFrame:CGRectZero];
		_nameLabel.textAlignment = NSTextAlignmentCenter;
	}
	
	return _nameLabel;
}

- (FGButton *)fakeInfoButton
{
	if (!_fakeInfoButton) {
		_fakeInfoButton = [[FGButton alloc] initWithFrame:CGRectZero];
		[_fakeInfoButton setImage:[UIImage imageNamed:@"icon_button_info"]
						 forState:UIControlStateNormal];
		_fakeInfoButton.userInteractionEnabled = NO;
	}
	
	return _fakeInfoButton;
}

#pragma mark Overrides
#pragma mark - User interaction handlers
#pragma mark - Notification handlers
#pragma mark - KVO
#pragma mark - <>

@end
