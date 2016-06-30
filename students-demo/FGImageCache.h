//
//  FGImageCache.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FGImageCache : NSObject

+ (instancetype)sharedCache;

- (void)cacheImage:(UIImage *)image
		 reference:(id)reference;
- (UIImage *)cachedImage:(id)reference;

@end
