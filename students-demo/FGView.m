//
//  FGView.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGView.h"

@interface FGView ()

@property (nonatomic, getter=hasAddedInitialConstraints) BOOL addedInitialConstraints;

@end


@implementation FGView

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
