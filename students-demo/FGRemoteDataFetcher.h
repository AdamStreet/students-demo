//
//  FGRemoteDataFetcher.h
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class FGSessionProvider;

typedef void(^FGRemoteDataFetcherDataTaskCompletion)(NSData *data, NSURLResponse *response, NSInteger statusCode, NSError *error);

extern const NSInteger kStatusCodeUnknown;

@interface FGRemoteDataFetcher : NSObject

@property (nonatomic, readonly) FGSessionProvider *sessionProvider;

+ (void)initializeSharedFetcherWithSessionProvider:(FGSessionProvider *)sessionProvider;
+ (instancetype)sharedFetcher;

- (instancetype)initWithSessionProvider:(FGSessionProvider *)sessionProvider;

- (NSURLSessionDataTask *)dataTaskForURL:(NSURL *)url
							  completion:(FGRemoteDataFetcherDataTaskCompletion)completion;

@end
