//
//  FGMenuItemProvider.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FGMenuItem.h"

extern NSString * const FGMenuItemIdentifierListOfStudents;
extern NSString * const FGMenuItemIdentifierAddStudent;

@interface FGMenuItemProvider : NSObject

+ (NSArray<FGMenuItem *> *)loadMenuItems;

@end
