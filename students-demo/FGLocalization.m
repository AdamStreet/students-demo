//
//  FGLocalization.m
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGLocalization.h"

@implementation FGLocalization

@end

inline NSString* FGLocalizedString(NSString *label, NSString *comment)
{
	return [[NSBundle mainBundle] localizedStringForKey:label value:nil table:nil];
}