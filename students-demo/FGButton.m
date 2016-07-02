//
//  FGButton.m
//  students-demo
//
//  Created by Adam Szabo on 01/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGButton.h"

#import "UIColor+CustomColors.h"

@implementation FGButton

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self setTitleColor:[UIColor buttonTextColor]
				   forState:UIControlStateNormal];
		[self setTitleColor:[UIColor buttonDisabledTextColor]
				   forState:UIControlStateDisabled];
		
		[self addTarget:self
				 action:@selector(buttonTapped:)
	   forControlEvents:UIControlEventTouchUpInside];
	}
	
	return self;
}

#pragma mark - User interaction handler

- (void)buttonTapped:(id)sender
{
	NSAssert1(sender == self, @"Unknown sender: %@", sender);
	
	if (self.tapHandler) {
		self.tapHandler();
	}
}

@end
