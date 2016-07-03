//
//  FGStudentCardCollectionViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGStudentCardCollectionViewCell.h"

NSString * const FGStudentCardCollectionViewCellIdentifier = @"FGStudentCardCollectionViewCell";

const CGSize FGStudentCardCollectionViewCellSuggestedSize = {300.0, 200.0};

@interface FGStudentCardCollectionViewCell ()

@property (nonatomic) FGStudentCardDetailView *studentCardDetailView;
@property (nonatomic) FGStudentCardBackgroundView *studentCardBackgroundView;

@end

static NSTimeInterval kFlipAnimationDuration = 0.5;

@implementation FGStudentCardCollectionViewCell

@synthesize student = _student;

#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		self.layer.cornerRadius = 5.0;
		self.clipsToBounds = YES;
		
		self.backgroundColor = [UIColor clearColor];
		
		UIView *contentView = self.contentView;
		
		FGView *studentCardDetailView = self.studentCardDetailView;
		studentCardDetailView.frame = contentView.bounds;
		studentCardDetailView.autoresizingMask = (UIViewAutoresizingFlexibleWidth |
												  UIViewAutoresizingFlexibleHeight);
		[contentView addSubview:studentCardDetailView];
		
		FGView *studentCardBackgroundView = self.studentCardBackgroundView;
		studentCardBackgroundView.frame = contentView.bounds;
		studentCardBackgroundView.autoresizingMask = (UIViewAutoresizingFlexibleWidth |
													  UIViewAutoresizingFlexibleHeight);
		//[contentView addSubview:studentCardBackgroundView]; - Hidden by default
	}
	
	return self;
}

#pragma mark - Private methods

- (void)updateLabels
{
	[self.studentCardDetailView.avatarImageView setImageURL:[self.student avatarImageURL]
												 completion:nil];
	
	NSString *studentFullName = [self.student fullName];
	
	self.studentCardDetailView.nameLabel.text = studentFullName;
	
	// Background
	
	self.studentCardBackgroundView.nameLabel.text = studentFullName;
	self.studentCardBackgroundView.phoneLabel.label.text = self.student.phone;
	self.studentCardBackgroundView.cellLabel.label.text = self.student.cell;
	self.studentCardBackgroundView.emailLabel.label.text = self.student.email;
	
	self.studentCardBackgroundView.trashButton.tapHandler = ^{
		if (self.trashButtonTapHandler) {
			self.trashButtonTapHandler();
		}
	};
}

#pragma mark Accessors
#pragma mark - View lifecycle
#pragma mark - Public methods

- (void)flipCard:(BOOL)animated
{
	UIViewAnimationOptions direction = UIViewAnimationOptionTransitionFlipFromRight;
	UIView *fromView = self.studentCardDetailView;
	UIView *toView = self.studentCardBackgroundView;
	
	if (self.isFlipped) {
		direction = UIViewAnimationOptionTransitionFlipFromLeft;
		fromView = self.studentCardBackgroundView;
		toView = self.studentCardDetailView;
	}
	
	[UIView transitionFromView:fromView
						toView:toView
					  duration:(animated? kFlipAnimationDuration : 0.0)
					   options:direction
					completion:nil];
}

#pragma mark Accessors

- (FGStudentCardDetailView *)studentCardDetailView
{
	if (!_studentCardDetailView) {
		_studentCardDetailView = [[FGStudentCardDetailView alloc] initWithFrame:CGRectZero];
	}
	
	return _studentCardDetailView;
}

- (FGStudentCardBackgroundView *)studentCardBackgroundView
{
	if (!_studentCardBackgroundView) {
		_studentCardBackgroundView = [[FGStudentCardBackgroundView alloc] initWithFrame:CGRectZero];
	}
	
	return _studentCardBackgroundView;
}


- (void)setStudent:(FGStudent *)student
{
	_student = student;
	
	[self updateLabels];
}

- (BOOL)isFlipped
{
	return ![self.studentCardDetailView superview];
}

#pragma mark Overrides
#pragma mark - User interaction handlers
#pragma mark - Notification handlers
#pragma mark - KVO
#pragma mark - <<#delegate#>>

@end
