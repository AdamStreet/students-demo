//
//  FGImageFetcher.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FGRemoteDataFetcherImageCompletion)(UIImage *image, NSInteger statusCode, NSError *error);

@interface FGImageFetcher : NSObject

+ (NSURLSessionDataTask *)imageDataTaskForURL:(NSURL *)url
								   completion:(FGRemoteDataFetcherImageCompletion)completion;

@end
