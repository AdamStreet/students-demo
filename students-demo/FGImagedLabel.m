//
//  FGImagedLabel.m
//  students-demo
//
//  Created by Adam Szabo on 03/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGImagedLabel.h"

@interface FGImagedLabel ()

@property (nonatomic) FGImageView *imageView;
@property (nonatomic) FGLabel *label;

@end


@implementation FGImagedLabel

#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		UIView *containerView = self;
		
		FGImageView *imageView = self.imageView;
		[containerView addSubview:imageView];
		
		FGLabel *label = self.label;
		[containerView addSubview:label];
		
		imageView.translatesAutoresizingMaskIntoConstraints = NO;
		label.translatesAutoresizingMaskIntoConstraints = NO;
	}
	
	return self;
}

#pragma mark - Private methods
#pragma mark Accessors
#pragma mark - View lifecycle

- (void)setupInitialConstraints
{
	[super setupInitialConstraints];
	
	UIView *containerView = self;
	
	UIView *imageView = self.imageView;
	UIView *label = self.label;
	
	NSDictionary *subviews = NSDictionaryOfVariableBindings(imageView, label);
	
	[containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[imageView]-[label]-|"
																		  options:kNilOptions
																		  metrics:nil
																			views:subviews]];
	[imageView addConstraint:[NSLayoutConstraint constraintWithItem:imageView
														  attribute:NSLayoutAttributeWidth
														  relatedBy:NSLayoutRelationEqual
															 toItem:imageView
														  attribute:NSLayoutAttributeHeight
														 multiplier:1.0
														   constant:0.0]];
	[containerView addConstraint:[NSLayoutConstraint constraintWithItem:imageView
															  attribute:NSLayoutAttributeTop
															  relatedBy:NSLayoutRelationGreaterThanOrEqual
																 toItem:label
															  attribute:NSLayoutAttributeTop
															 multiplier:1.0
															   constant:0.0]];
	[containerView addConstraint:[NSLayoutConstraint constraintWithItem:imageView
															  attribute:NSLayoutAttributeBottom
															  relatedBy:NSLayoutRelationLessThanOrEqual
																 toItem:label
															  attribute:NSLayoutAttributeBottom
															 multiplier:1.0
															   constant:0.0]];
	[containerView addConstraint:[NSLayoutConstraint constraintWithItem:imageView
															  attribute:NSLayoutAttributeCenterY
															  relatedBy:NSLayoutRelationEqual
																 toItem:label
															  attribute:NSLayoutAttributeCenterY
															 multiplier:1.0
															   constant:0.0]];
	
	[containerView addConstraint:[NSLayoutConstraint constraintWithItem:label
															  attribute:NSLayoutAttributeCenterY
															  relatedBy:NSLayoutRelationEqual
																 toItem:containerView
															  attribute:NSLayoutAttributeCenterY
															 multiplier:1.0
															   constant:0.0]];
	[containerView addConstraint:[NSLayoutConstraint constraintWithItem:label
															  attribute:NSLayoutAttributeHeight
															  relatedBy:NSLayoutRelationLessThanOrEqual
																 toItem:containerView
															  attribute:NSLayoutAttributeHeight
															 multiplier:1.0
															   constant:0.0]];
}

#pragma mark - Public methods
#pragma mark Accessors

- (FGImageView *)imageView
{
	if (!_imageView) {
		_imageView = [[FGImageView alloc] initWithFrame:CGRectZero];
	}
	
	return _imageView;
}

- (FGLabel *)label
{
	if (!_label) {
		_label = [[FGLabel alloc] initWithFrame:CGRectZero];
	}
	
	return _label;
}

#pragma mark Overrides
#pragma mark - User interaction handlers
#pragma mark - Notification handlers
#pragma mark - KVO
#pragma mark - <>

@end
