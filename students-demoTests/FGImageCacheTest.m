//
//  FGImageCacheTest.m
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "FGImageCache.h"
#import "FGTestResourceProvider.h"

@interface FGImageCacheTest : XCTestCase

@property (nonatomic) FGImageCache *imageCache;

@end

@implementation FGImageCacheTest

#pragma mark - Private methods

- (NSData *)dataOfImage:(UIImage *)image
{
	return UIImagePNGRepresentation(image);
}

- (UIImage *)image:(UIImage *)image
		   quality:(CGFloat)quality
{
	return [UIImage imageWithData:UIImageJPEGRepresentation(image, quality)];
}

#pragma mark - Overrides

- (void)setUp {
    [super setUp];
	
	self.imageCache = [[FGImageCache alloc] init];
}

- (void)tearDown {
	self.imageCache = nil;
	
    [super tearDown];
}

#pragma mark - Tests

- (void)testImageCache
{
	id imageReference = [NSURL URLWithString:@"image.reference"];
	UIImage *image = [FGTestResourceProvider testAvatarImage];
	[self.imageCache cacheImage:image
					  reference:imageReference];
	
	id hqImageReference = [NSURL URLWithString:@"hq.image.reference"];
	UIImage *hqImage = [self image:image quality:1.0];
	[self.imageCache cacheImage:hqImage
					  reference:hqImageReference];
	
	id lqImageReference = [NSURL URLWithString:@"lq.image.reference"];
	UIImage *lqImage = [self image:image quality:5.0];
	[self.imageCache cacheImage:lqImage
					  reference:lqImageReference];
	
	// Note: UIImage isEqual: is not officially supported > Use data represenatation
	
	UIImage *cachedImage = [self.imageCache cachedImage:imageReference];
	XCTAssertTrue([[self dataOfImage:image] isEqualToData:[self dataOfImage:cachedImage]]);
	
	UIImage *cachedLqImage = [self.imageCache cachedImage:lqImageReference];
	XCTAssertTrue([[self dataOfImage:lqImage] isEqualToData:[self dataOfImage:cachedLqImage]]);
	XCTAssertFalse([[self dataOfImage:cachedLqImage] isEqualToData:[self dataOfImage:cachedImage]]);
	
	UIImage *cachedHqImage = [self.imageCache cachedImage:hqImageReference];
	XCTAssertTrue([[self dataOfImage:hqImage] isEqualToData:[self dataOfImage:cachedHqImage]]);
	XCTAssertFalse([[self dataOfImage:cachedHqImage] isEqualToData:[self dataOfImage:cachedImage]]);
	
	id uncachedItem = [self.imageCache cachedImage:@"something"];
	XCTAssertNil(uncachedItem);
}

@end
