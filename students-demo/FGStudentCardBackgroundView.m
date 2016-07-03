//
//  FGStudentCardBackgroundView.m
//  students-demo
//
//  Created by Adam Szabo on 03/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGStudentCardBackgroundView.h"

@interface FGStudentCardBackgroundView ()

@property (nonatomic) FGLabel *nameLabel;
@property (nonatomic) FGImagedLabel *phoneLabel;
@property (nonatomic) FGImagedLabel *cellLabel;
@property (nonatomic) FGImagedLabel *emailLabel;

@property (nonatomic) FGButton *trashButton;

@end


@implementation FGStudentCardBackgroundView

#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		UIView *containerView = self;
		
		FGLabel *nameLabel = self.nameLabel;
		[containerView addSubview:nameLabel];
		
		FGImagedLabel *phoneLabel = self.phoneLabel;
		[containerView addSubview:phoneLabel];
		
		FGImagedLabel *cellLabel = self.cellLabel;
		[containerView addSubview:cellLabel];
		
		FGImagedLabel *emailLabel = self.emailLabel;
		[containerView addSubview:emailLabel];
		
		FGButton *trashButton = self.trashButton;
		[containerView addSubview:trashButton];
		
		nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
		phoneLabel.translatesAutoresizingMaskIntoConstraints = NO;
		cellLabel.translatesAutoresizingMaskIntoConstraints = NO;
		emailLabel.translatesAutoresizingMaskIntoConstraints = NO;
		trashButton.translatesAutoresizingMaskIntoConstraints = NO;
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
	
	UIView *nameLabel = self.nameLabel;
	UIView *phoneLabel = self.phoneLabel;
	UIView *cellLabel = self.cellLabel;
	UIView *emailLabel = self.emailLabel;
	UIView *trashButton = self.trashButton;
	
	NSDictionary *subviews = NSDictionaryOfVariableBindings(nameLabel,
															phoneLabel, cellLabel, emailLabel,
															trashButton);
	
	[containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[nameLabel]-|"
																		  options:kNilOptions
																		  metrics:nil
																			views:subviews]];
	[containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[nameLabel]"
																		  options:kNilOptions
																		  metrics:nil
																			views:subviews]];
	
	[containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[phoneLabel]-|"
																		  options:kNilOptions
																		  metrics:nil
																			views:subviews]];
	[containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[nameLabel]-[phoneLabel]"
																		  options:kNilOptions
																		  metrics:nil
																			views:subviews]];
	
	[containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[cellLabel]-|"
																		  options:kNilOptions
																		  metrics:nil
																			views:subviews]];
	[containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[phoneLabel]-[cellLabel]"
																		  options:kNilOptions
																		  metrics:nil
																			views:subviews]];
	
	[containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[emailLabel]-|"
																		  options:kNilOptions
																		  metrics:nil
																			views:subviews]];
	[containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[cellLabel]-[emailLabel]"
																		  options:kNilOptions
																		  metrics:nil
																			views:subviews]];
	
	[containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[trashButton]"
																		  options:kNilOptions
																		  metrics:nil
																			views:subviews]];
	[containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[trashButton]-|"
																		  options:kNilOptions
																		  metrics:nil
																			views:subviews]];
}

#pragma mark - Public methods
#pragma mark Accessors

- (FGLabel *)nameLabel
{
	if (!_nameLabel) {
		_nameLabel = [[FGLabel alloc] initWithFrame:CGRectZero];
		_nameLabel.textAlignment = NSTextAlignmentCenter;
	}
	
	return _nameLabel;
}

- (FGImagedLabel *)phoneLabel
{
	if (!_phoneLabel) {
		_phoneLabel = [[FGImagedLabel alloc] initWithFrame:CGRectZero];
		_phoneLabel.imageView.image = [UIImage imageNamed:@"icon_label_phone"];
	}
	
	return _phoneLabel;
}

- (FGImagedLabel *)cellLabel
{
	if (!_cellLabel) {
		_cellLabel = [[FGImagedLabel alloc] initWithFrame:CGRectZero];
		_cellLabel.imageView.image = [UIImage imageNamed:@"icon_label_cell"];
	}
	
	return _cellLabel;
}

- (FGImagedLabel *)emailLabel
{
	if (!_emailLabel) {
		_emailLabel = [[FGImagedLabel alloc] initWithFrame:CGRectZero];
		_emailLabel.imageView.image = [UIImage imageNamed:@"icon_label_email"];
	}
	
	return _emailLabel;
}

- (FGButton *)trashButton
{
	if (!_trashButton) {
		_trashButton = [[FGButton alloc] initWithFrame:CGRectZero];
		[_trashButton setImage:[UIImage imageNamed:@"icon_button_trash"]
					  forState:UIControlStateNormal];
	}
	
	return _trashButton;
}

#pragma mark Overrides
#pragma mark - User interaction handlers
#pragma mark - Notification handlers
#pragma mark - KVO
#pragma mark - <>

@end
