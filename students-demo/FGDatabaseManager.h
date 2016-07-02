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

- (instancetype)initWithName:(NSString *)name;

@end


@interface FGDatabaseManager (Inserting)

- (__kindof NSManagedObject *)insertEntity:(NSString *)entityName;

@end


@interface FGDatabaseManager (Deleting)

- (void)deleteEntity:(__kindof NSManagedObject *)object;

@end


@interface FGDatabaseManager (Persisting)

- (void)saveContext;

- (void)rollback;

@end


@interface FGDatabaseManager (Fetching)

- (NSArray *)fetchResultsOfRequest:(NSFetchRequest *)fetchRequest;
- (NSArray *)fetchResultsOfRequest:(NSFetchRequest *)fetchRequest
							 error:(NSError * __autoreleasing *)error;

- (NSFetchedResultsController *)fetchedResultsControllerForFetchRequest:(NSFetchRequest *)fetchRequest
													 sectionNameKeyPath:(NSString *)sectionNameKeyPath
															  cacheName:(NSString *)cacheName;
- (NSFetchedResultsController *)fetchedResultsControllerForFetchRequest:(NSFetchRequest *)fetchRequest
													 sectionNameKeyPath:(NSString *)sectionNameKeyPath
															  cacheName:(NSString *)cacheName
																  error:(NSError * __autoreleasing *)error;

@end


@interface FGDatabaseManager (Performing)

- (void)performBlockAndWait:(void (^)())block;

- (void)performBlock:(void (^)())block;

@end
