//
//  CustomColors.m
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "UIColor+CustomColors.h"

@implementation UIColor (CustomColors)

+ (UIColor *)generalBackgroundColor
{
	return [UIColor colorWithWhite:1.0 alpha:1.0];
}

+ (UIColor *)separatorColor
{
	return [UIColor colorWithWhite:0.0 alpha:0.25];
}

+ (UIColor *)buttonTextColor
{
	// Get tint color
	UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
	
	return view.tintColor;
}

@end
