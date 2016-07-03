//
//  FGCollectionViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGCollectionViewCell.h"

#import "UIColor+CustomColors.h"

@interface FGCollectionViewCell ()

@property (nonatomic, getter=hasAddedInitialConstraints) BOOL addedInitialConstraints;

@end


@implementation FGCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = [UIColor cardBackgroundColor];
		
		[self setNeedsUpdateConstraints];
	}
	
	return self;
}

#pragma mark - View lifecycle

- (void)updateConstraints
{
	if (!self.hasAddedInitialConstraints) {
		[self setupInitialConstraints];
		
		self.addedInitialConstraints = YES;
	}
	
	[super updateConstraints];
}

#pragma mark - Public methods

- (void)setupInitialConstraints
{
	// Does nothing by default
}

@end
