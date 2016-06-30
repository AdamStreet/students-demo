//
//  FGImageLoader.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FGImageLoaderCompletion)(UIImage *image, BOOL cached, NSError *error);

@interface FGImageLoader : NSObject

+ (instancetype)sharedLoader;

- (NSURLSessionDataTask *)loadImageOnURL:(NSURL *)url
							  completion:(FGImageLoaderCompletion)completion;

@end
