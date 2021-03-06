//
//  FGSessionProvider.h
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FGSessionProvider : NSObject

@property (nonatomic, readonly) NSURLSession *session;

+ (void)initializeSharedProviderWithURLSession:(NSURLSession *)session;
+ (instancetype)sharedProvider;

/**
 @brief Initializes a session provider, a wrapper for NSURLSession.
 @param session If this parameter is nil, the +[NSURLSession sharedSession] is used.
 */
- (instancetype)initWithURLSession:(NSURLSession *)session;

@end
