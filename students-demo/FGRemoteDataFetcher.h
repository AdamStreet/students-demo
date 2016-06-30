//
//  FGRemoteDataFetcher.h
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FGSessionProvider;

typedef void(^FGRemoteDataFetcherJSONCompletion)(id responseObject, NSInteger statusCode, NSError *error);

@interface FGRemoteDataFetcher : NSObject

+ (void)initializeSharedFetcherWithSessionProvider:(FGSessionProvider *)sessionProvider;
+ (instancetype)sharedFetcher;

- (instancetype)initWithSessionProvider:(FGSessionProvider *)sessionProvider;

- (NSURLSessionDataTask *)jsonDataTaskForURL:(NSURL *)url completion:(FGRemoteDataFetcherJSONCompletion)completion;

@end
