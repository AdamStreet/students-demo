//
//  FGImageLoader.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGImageLoader.h"

#import "FGImageFetcher.h"
#import "FGImageCache.h"

@implementation FGImageLoader

#pragma mark - Initialization

static FGImageLoader *sharedInstance = nil;

+ (BOOL)isSharedLoaderInitialized
{
	return !!sharedInstance;
}

+ (void)initializeSharedLoader
{
	if (sharedInstance) {
		NSAssert(NO, @"Shared instance already initialized");
		
		return;
	}
	
	sharedInstance = [[self alloc] init];
}

+ (instancetype)sharedLoader
{
	if (![self isSharedLoaderInitialized]) {
//		NSAssert(NO, @"Shared instance has not been initialized");
		
		[self initializeSharedLoader];
	}
	
	return sharedInstance;
}

//- (instancetype)init
//{
//	self = [super init];
//	if (self) {
//	}
//
//	return self;
//}

#pragma mark - Private methods

- (FGImageCache *)imageCache
{
	return [FGImageCache sharedCache];
}

#pragma mark - Public methods

- (NSURLSessionDataTask *)loadImageOnURL:(NSURL *)url
							  completion:(FGImageLoaderCompletion)completion
{
	NSParameterAssert(url);
	
	// Load from cache
	UIImage *image = [[self imageCache] cachedImage:url];
	if (image) {
		if (completion) {
			completion(image, YES, nil);
		}
		
		return nil;
	}
	
	// Fetch from internet
	return [FGImageFetcher imageDataTaskForURL:url
									completion:^(UIImage *image, NSInteger statusCode, NSError *error) {
										// Cache
										if (image) {
											[[self imageCache] cacheImage:image reference:url];
										}
										
										if (completion) {
											completion(image, NO, error);
										}
									}];
}

@end
