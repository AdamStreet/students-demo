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

+ (UIColor *)buttonDisabledTextColor
{
	return [UIColor colorWithWhite:0.75 alpha:1.0];
}

+ (UIColor *)cardBackgroundColor
{
	return [UIColor colorWithRed:(192.0 / 255.0)
						   green:(232.0 / 255.0)
							blue:(229.0 / 255.0)
						   alpha:1.0];
}

+ (UIColor *)shadowStartColor
{
	return [UIColor colorWithRed:(167.0 / 255.0)
						   green:(223.0 / 255.0)
							blue:(224.0 / 255.0)
						   alpha:1.0];
}

+ (UIColor *)shadowEndColor
{
	return [UIColor colorWithRed:(167.0 / 255.0)
						   green:(223.0 / 255.0)
							blue:(224.0 / 255.0)
						   alpha:0.0];
}

+ (UIColor *)statusNotificationTitleColor
{
	return [UIColor darkTextColor];
}

+ (UIColor *)statusNotificationBackgroundColor
{
	return [self shadowStartColor];
}

@end
