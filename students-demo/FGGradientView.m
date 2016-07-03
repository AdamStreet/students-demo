//
//  FGGradientView.m
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGGradientView.h"

@implementation FGGradientView

@dynamic layer;

+ (Class)layerClass
{
	return [CAGradientLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		self.layer.startPoint = CGPointMake(0,0);
		self.layer.endPoint = CGPointMake(0,1);
	}
	
	return self;
}

- (void)setColors:(NSArray<UIColor *> *)colors
{
	NSMutableArray *cgColors = [NSMutableArray arrayWithCapacity:[colors count]];
	[colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull color, NSUInteger idx, BOOL * _Nonnull stop) {
		[cgColors addObject:(id)[color CGColor]];
	}];
	
	self.layer.colors = [cgColors copy];
}

@end
