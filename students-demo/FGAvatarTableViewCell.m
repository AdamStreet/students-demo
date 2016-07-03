//
//  FGAvatarTableViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGAvatarTableViewCell.h"

#import "FGAvatarImageView.h"

NSString * const FGAvatarTableViewCellIdentifier = @"FGAvatarTableViewCell";

@interface FGAvatarTableViewCell ()

@property (nonatomic) FGAvatarImageView *avatarImageView;

@end

@implementation FGAvatarTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		self.topSeparator.hidden = YES;
		self.bottomSeparator.hidden = YES;
		
		UIView *contentView = self.contentView;
		
		FGAvatarImageView *avatarImageView = [[FGAvatarImageView alloc] initWithFrame:CGRectZero];
		[contentView addSubview:avatarImageView];
		self.avatarImageView = avatarImageView;
		
		avatarImageView.translatesAutoresizingMaskIntoConstraints = NO;
	}
	
	return self;
}

#pragma mark - View lifecycle

#pragma mark - Public methods

#pragma mark Overrides

- (void)setupInitialConstraints
{
	[super setupInitialConstraints];
	
	UIView *contentView = self.contentView;
	UIView *avatarImageView = self.avatarImageView;
	
	[contentView addConstraint:[NSLayoutConstraint constraintWithItem:avatarImageView
															attribute:NSLayoutAttributeCenterX
															relatedBy:NSLayoutRelationEqual
															   toItem:contentView
															attribute:NSLayoutAttributeCenterX
														   multiplier:1.0
															 constant:0.0]];
	[contentView addConstraint:[NSLayoutConstraint constraintWithItem:avatarImageView
															attribute:NSLayoutAttributeCenterY
															relatedBy:NSLayoutRelationEqual
															   toItem:contentView
															attribute:NSLayoutAttributeCenterY
														   multiplier:1.0
															 constant:0.0]];
	
	[contentView addConstraint:[NSLayoutConstraint constraintWithItem:avatarImageView
															attribute:NSLayoutAttributeWidth
															relatedBy:NSLayoutRelationLessThanOrEqual
															   toItem:contentView
															attribute:NSLayoutAttributeWidth
														   multiplier:1.0
															 constant:0.0]];
	[contentView addConstraint:[NSLayoutConstraint constraintWithItem:avatarImageView
															attribute:NSLayoutAttributeHeight
															relatedBy:NSLayoutRelationLessThanOrEqual
															   toItem:contentView
															attribute:NSLayoutAttributeHeight
														   multiplier:1.0
															 constant:0.0]];
	
	NSArray<NSLayoutConstraint *> *idealConstraints =
	@[[NSLayoutConstraint constraintWithItem:avatarImageView
								   attribute:NSLayoutAttributeHeight
								   relatedBy:NSLayoutRelationEqual
									  toItem:nil
								   attribute:NSLayoutAttributeNotAnAttribute
								  multiplier:1.0
									constant:100.0]];
	[idealConstraints enumerateObjectsUsingBlock:^(NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		obj.priority = UILayoutPriorityDefaultHigh;
	}];
	[contentView addConstraints:idealConstraints];
	
	[avatarImageView addConstraint:[NSLayoutConstraint constraintWithItem:avatarImageView
																attribute:NSLayoutAttributeWidth
																relatedBy:NSLayoutRelationEqual
																   toItem:avatarImageView
																attribute:NSLayoutAttributeHeight
															   multiplier:1.0
																 constant:0.0]];
}

@end
