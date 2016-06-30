//
//  FGJSONObjectFetcher.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGJSONObjectFetcher.h"

#import "FGRemoteDataFetcher.h"
#import "FGJSONConverter.h"

@implementation FGJSONObjectFetcher

+ (FGRemoteDataFetcher *)remoteDataFetcher
{
	return [FGRemoteDataFetcher sharedFetcher];
}

+ (NSURLSessionDataTask *)jsonDataTaskForURL:(NSURL *)url completion:(FGRemoteDataFetcherJSONCompletion)completion
{
	return [[self remoteDataFetcher] dataTaskForURL:url
										 completion:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSInteger statusCode, NSError * _Nullable error) {
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
}

@end
