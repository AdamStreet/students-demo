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
@property (nonatomic) FGView *backgroundCardView;

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
		
		UIView *contentView = self.contentView;
		FGStudentCardDetailView *studentCardDetailView = [[FGStudentCardDetailView alloc] initWithFrame:contentView.bounds];
		studentCardDetailView.frame = contentView.bounds;
		[self addSubview:studentCardDetailView];
		self.studentCardDetailView = studentCardDetailView;
	}
	
	return self;
}

#pragma mark - Private methods

- (void)updateLabels
{
	[self.studentCardDetailView.avatarImageView setImageURL:[self.student avatarImageURL]
												 completion:nil];
	
	self.studentCardDetailView.nameLabel.text = [self.student fullName];
}

- (FGView *)backgroundCardView
{
	if (!_backgroundCardView) {
		_backgroundCardView = [[FGView alloc] initWithFrame:self.bounds];
	}
	
	return _backgroundCardView;
}

#pragma mark Accessors
#pragma mark - View lifecycle
#pragma mark - Public methods

- (void)flipCard:(BOOL)animated
{
	UIViewAnimationOptions direction = UIViewAnimationOptionTransitionFlipFromRight;
	UIView *fromView = self.studentCardDetailView;
	UIView *toView = self.backgroundCardView;
	
	if (self.isFlipped) {
		direction = UIViewAnimationOptionTransitionFlipFromLeft;
		fromView = self.backgroundCardView;
		toView = self.studentCardDetailView;
	}
	
	[UIView transitionFromView:fromView
						toView:toView
					  duration:(animated? kFlipAnimationDuration : 0.0)
					   options:direction
					completion:nil];
}

#pragma mark Accessors

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
