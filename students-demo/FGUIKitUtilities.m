//
//  FGUIKitUtilities.m
//  students-demo
//
//  Created by Adam Szabo on 03/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGUIKitUtilities.h"

@implementation FGUIKitUtilities

+ (BOOL)isIPadLayout
{
	return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}

+ (UIInterfaceOrientationMask)defaultSupportedInterfaceOrientations
{
	if ([self isIPadLayout])
		return UIInterfaceOrientationMaskAll;
	
	return UIInterfaceOrientationMaskPortrait;
}

@end

