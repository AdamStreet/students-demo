//
//  FGAvatarImageView.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGAvatarImageView.h"

@implementation FGAvatarImageView

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		self.clipsToBounds = YES;
	}
	
	return self;
}

- (void)drawRect:(CGRect)rect {
	[super drawRect:rect];
	
	self.layer.cornerRadius = (self.frame.size.height / 2.0);
}

@end
