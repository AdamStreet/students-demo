//
//  FGTableViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGTableViewCell.h"

@interface FGTableViewCell ()

@property (nonatomic, getter=hasAddedInitialConstraints) BOOL addedInitialConstraints;

@end


@implementation FGTableViewCell

#pragma mark - Initialization 

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
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
