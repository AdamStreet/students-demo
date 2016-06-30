//
//  FGImageFetcher.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGImageFetcher.h"

#import "FGRemoteDataFetcher.h"

@implementation FGImageFetcher

+ (FGRemoteDataFetcher *)remoteDataFetcher
{
	return [FGRemoteDataFetcher sharedFetcher];
}

+ (NSURLSessionDataTask *)imageDataTaskForURL:(NSURL *)url completion:(FGRemoteDataFetcherImageCompletion)completion
{
	return [[self remoteDataFetcher] dataTaskForURL:url
										 completion:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSInteger statusCode, NSError * _Nullable error) {
											 if (completion) {
												 UIImage *image = nil;
												 if (data) {
													 image = [UIImage imageWithData:data];
												 }
												 
												 if (completion) {
													 completion(image, statusCode, error);
												 }
											 }
										 }];
}

@end
