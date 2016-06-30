//
//  FGDatabaseManager.h
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface FGDatabaseManager : NSObject

+ (void)initializeMainDatabaseManagerWithName:(NSString *)name;

+ (instancetype)mainDatabaseManager;

@end


@interface FGDatabaseManager (Inserting)

- (__kindof NSManagedObject *)insertEntity:(NSString *)entityName;

@end


@interface FGDatabaseManager (Deleting)

- (void)deleteEntity:(__kindof NSManagedObject *)object;

@end


@interface FGDatabaseManager (Persisting)

- (void)saveContext;

@end