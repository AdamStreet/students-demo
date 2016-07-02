//
//  AppDelegate.m
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGAppDelegate.h"

#import "FGDatabaseManager.h"
#import "FGRootViewController.h"
#import "FGSessionProvider.h"
#import "FGRemoteDataFetcher.h"
#import "FGAnalytics.h"
#import "FGCrashReporter.h"

@interface FGAppDelegate ()

@end


@implementation FGAppDelegate

#pragma mark - Private methods

- (void)initializeCrashReporter
{
	[FGCrashReporter startCrashReporter];
}

- (void)initializeAnalytics
{
	[FGAnalytics startAnalytics];
}

- (void)initializeNetworkLayer
{
	[FGSessionProvider initializeSharedProviderWithURLSession:nil];
	[FGRemoteDataFetcher initializeSharedFetcherWithSessionProvider:[FGSessionProvider sharedProvider]];
}

- (void)initializeDatabase
{
	[FGDatabaseManager initializeMainDatabaseManagerWithName:@"students_demo"];
}

- (void)bootUp
{
	[self initializeCrashReporter];
	[self initializeAnalytics];
	[self initializeDatabase];
	[self initializeNetworkLayer];
}

- (UIViewController *)startViewController
{
	return [[FGRootViewController alloc] initWithoutNib];
}

#pragma mark - <UIApplicationDelegate>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[self bootUp];
	
	// Prepare UI
	
	UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];	// Support iOS 7.x by -initWithFrame:
#if TEST
	FGViewController *grayViewController = [[FGViewController alloc] initWithoutNib];
	grayViewController.view.backgroundColor = [UIColor grayColor];
	window.rootViewController = grayViewController;
#else
	window.rootViewController = [self startViewController];
#endif
	
	self.window = window;
	
	[window makeKeyAndVisible];
	
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	// Saves changes in the application's managed object context before the application terminates.
	[[FGDatabaseManager mainDatabaseManager] saveContext];
}

@end
