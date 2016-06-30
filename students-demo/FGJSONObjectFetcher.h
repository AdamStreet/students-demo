//
//  FGJSONObjectFetcher.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FGRemoteDataFetcherJSONCompletion)(id responseObject, NSInteger statusCode, NSError *error);

@interface FGJSONObjectFetcher : NSObject

+ (NSURLSessionDataTask *)jsonDataTaskForURL:(NSURL *)url completion:(FGRemoteDataFetcherJSONCompletion)completion;

@end
