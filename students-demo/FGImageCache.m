//
//  FGImageCache.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGImageCache.h"

#import "FGLocalPaths.h"

@interface FGImageCache ()

@property (nonnull, nonatomic) NSCache *cache;

@end

static const NSUInteger kDefaultImageCost = 0;
static const NSUInteger kDefaultTotalCostLimit = 0;
static const NSUInteger kDefaultCountLimit = 50;

@implementation FGImageCache

static FGImageCache *sharedInstance = nil;

+ (BOOL)isSharedCacheInitialized
{
	return !!sharedInstance;
}

+ (void)initializeSharedCache
{
	if (sharedInstance) {
		NSAssert(NO, @"Shared instance already initialized");
		
		return;
	}
	
	sharedInstance = [[self alloc] init];
}

+ (instancetype)sharedCache
{
	if (![self isSharedCacheInitialized]) {
//		NSAssert(NO, @"Shared instance has not been initialized");
		
		[self initializeSharedCache];
	}
	
	return sharedInstance;
}

- (instancetype)init
{
	self = [super init];
	if (self) {
		NSCache *cache = [[NSCache alloc] init];
		cache.totalCostLimit = kDefaultTotalCostLimit;
		cache.countLimit = kDefaultCountLimit;
		cache.name = @"SharedImageCache";
		self.cache = cache;
	}

	return self;
}

#pragma mark - Public methods

- (void)cacheImage:(UIImage *)image reference:(id)reference
{
	[self.cache setObject:image
				   forKey:reference
					 cost:kDefaultImageCost];
	
	// TODO Save to disk (on background thread)
}

- (UIImage *)cachedImage:(id)reference
{
	UIImage *image = [self.cache objectForKey:reference];
	
	if (!image) {
		// TODO Recall from disk
	}
	
	return image;
}

@end
