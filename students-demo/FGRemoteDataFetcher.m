//
//  FGRemoteDataFetcher.m
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGRemoteDataFetcher.h"

#import "FGSessionProvider.h"
#import "FGJSONConverter.h"
#import "FGLogger.h"

@interface FGRemoteDataFetcher ()

@property (nonatomic) FGSessionProvider *sessionProvider;

@end


@implementation FGRemoteDataFetcher

#pragma mark - Initialization

static FGRemoteDataFetcher *sharedInstance = nil;

+ (BOOL)isSharedFetcherInitialized
{
	return !!sharedInstance;
}

+ (void)initializeSharedFetcherWithSessionProvider:(FGSessionProvider *)sessionProvider
{
	if (sharedInstance) {
		NSAssert(NO, @"Shared instance already initialized");
		
		return;
	}
	
	sharedInstance = [[self alloc] initWithSessionProvider:sessionProvider];
}

+ (instancetype)sharedFetcher
{
	return sharedInstance;
}

- (instancetype)initWithSessionProvider:(FGSessionProvider *)sessionProvider
{
	self = [super init];
	if (self) {
		self.sessionProvider = sessionProvider;
	}

	return self;
}

#pragma mark - Private methods
#pragma mark Accessors
#pragma mark - Public methods

- (NSURLSessionDataTask *)jsonDataTaskForURL:(NSURL *)url completion:(FGRemoteDataFetcherJSONCompletion)completion
{
	NSURLSessionDataTask *task = [self.sessionProvider.session
								   dataTaskWithURL:url
								   completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
									   NSInteger statusCode = 0;
									   
									   if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
										   statusCode = [(NSHTTPURLResponse *)response statusCode];
									   }
									   
									   DebugLog(@"Received reponse: %@\n\tDataLength=%@\n\tError: %@",
												@(statusCode), @(data.length), error);
									   
									   if (completion) {
										   if (!data) {
											   if (completion) {
												   completion(nil, statusCode, error);
											   }
										   } else {
											   [FGJSONConverter convertDataToJsonInBackground:data
																				   completion:^(id object, NSError *error) {
																					   if (completion) {
																						   completion(object, statusCode, error);
																					   }
																				   }];
										   }
									   }
								   }];
	[task resume];
	
	return task;
}

#pragma mark Accessors
#pragma mark Overrides
#pragma mark - User interaction handlers
#pragma mark - Notification handlers
#pragma mark - KVO
#pragma mark - <<#delegate#>>

@end
