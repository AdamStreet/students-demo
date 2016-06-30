//
//  FGDatabaseManager.h
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FGDatabaseManager : NSObject

+ (void)initializeMainDatabaseManagerWithName:(NSString *)name;

+ (instancetype)mainDatabaseManager;

- (void)saveContext;

@end
