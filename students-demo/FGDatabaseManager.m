//
//  FGDatabaseManager.m
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGDatabaseManager.h"

#import <CoreData/CoreData.h>

#import "FGLocalPaths.h"

@interface FGDatabaseManager ()

@property (nonatomic, copy) NSString *name;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation FGDatabaseManager

#pragma mark - Initialization

static FGDatabaseManager *mainDatabaseManager = nil;

+ (instancetype)mainDatabaseManager
{
	return mainDatabaseManager;
}

+ (void)initializeMainDatabaseManagerWithName:(NSString *)name
{
	NSParameterAssert(name);
	
	if (mainDatabaseManager) {
		NSAssert(NO, @"Main Database is already created");
		
		return;
	}
	
	mainDatabaseManager = [[self alloc] initWithName:name];
}

- (instancetype)initWithName:(NSString *)name
{
	NSParameterAssert(name);
	
	self = [super init];
	if (self) {
		self.name = name;
	}
	return self;
}

#pragma mark - Public methods

#pragma mark - Core Data stack (generated)

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSManagedObjectModel *)managedObjectModel {
	// The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
	if (_managedObjectModel != nil) {
		return _managedObjectModel;
	}
	NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"students_demo" withExtension:@"momd"];
	_managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
	return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
	// The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
	if (_persistentStoreCoordinator != nil) {
		return _persistentStoreCoordinator;
	}
	
	// Create the coordinator and store
	
	_persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
	NSURL *storeURL = [[FGLocalPaths applicationDocumentsDirectoryURL]
					   URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite", self.name]];
	NSError *error = nil;
	NSString *failureReason = @"There was an error creating or loading the application's saved data.";
	if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
		// Report any error we got.
		NSMutableDictionary *dict = [NSMutableDictionary dictionary];
		dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
		dict[NSLocalizedFailureReasonErrorKey] = failureReason;
		dict[NSUnderlyingErrorKey] = error;
		error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
		// Replace this with code to handle the error appropriately.
		// abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
	}
	
	return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext {
	// Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
	if (_managedObjectContext != nil) {
		return _managedObjectContext;
	}
	
	NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
	if (!coordinator) {
		return nil;
	}
	_managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
	[_managedObjectContext setPersistentStoreCoordinator:coordinator];
	return _managedObjectContext;
}

@end


@implementation FGDatabaseManager (Inserting)

- (__kindof NSManagedObject *)insertEntity:(NSString *)entityName
{
	return [NSEntityDescription insertNewObjectForEntityForName:entityName
										 inManagedObjectContext:self.managedObjectContext];
}

@end


@implementation FGDatabaseManager (Deleting)

- (void)deleteEntity:(__kindof NSManagedObject *)object
{
	[self.managedObjectContext deleteObject:object];
}

@end


@implementation FGDatabaseManager (Persisting)

- (void)saveContext {
	NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
	if (managedObjectContext != nil) {
		NSError *error = nil;
		if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
			// Replace this implementation with code to handle the error appropriately.
			// abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
			NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
			
			abort();
		}
	}
}

- (void)rollback
{
	[self.managedObjectContext rollback];
}

@end


@implementation FGDatabaseManager (Fetching)

- (NSArray *)fetchResultsOfRequest:(NSFetchRequest *)fetchRequest
{
	NSError *error = nil;
	NSArray *result = [self fetchResultsOfRequest:fetchRequest error:&error];
	
	if (error) {
		NSAssert1(NO, @"Error while performing fetch: %@", error);
	}
	
	return result;
}

- (NSArray *)fetchResultsOfRequest:(NSFetchRequest *)fetchRequest
							 error:(NSError * __autoreleasing *)error
{
	return [self.managedObjectContext executeFetchRequest:fetchRequest
													error:error];
}

- (NSFetchedResultsController *)fetchedResultsControllerForFetchRequest:(NSFetchRequest *)fetchRequest
													 sectionNameKeyPath:(NSString *)sectionNameKeyPath
															  cacheName:(NSString *)cacheName
{
	NSError *error = nil;
	NSFetchedResultsController *controller = [self fetchedResultsControllerForFetchRequest:fetchRequest
																		sectionNameKeyPath:sectionNameKeyPath
																				 cacheName:cacheName
																					 error:&error];
	
	if (error) {
		NSAssert1(NO, @"Error while performing fetch: %@", error);
	}
	
	return controller;
}

- (NSFetchedResultsController *)fetchedResultsControllerForFetchRequest:(NSFetchRequest *)fetchRequest
													 sectionNameKeyPath:(NSString *)sectionNameKeyPath
															  cacheName:(NSString *)cacheName
																  error:(NSError * __autoreleasing *)error
{
	NSFetchedResultsController *fetchedResultsController =
	[[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
										managedObjectContext:self.managedObjectContext
										  sectionNameKeyPath:sectionNameKeyPath
												   cacheName:cacheName];
	
	if (![fetchedResultsController performFetch:error])
		return nil;
	
	return fetchedResultsController;
}

@end

@implementation FGDatabaseManager (Performing)

- (void)performBlockAndWait:(void (^)())block
{
	[self.managedObjectContext performBlockAndWait:block];
}

- (void)performBlock:(void (^)())block
{
	[self.managedObjectContext performBlock:block];
}


@end
