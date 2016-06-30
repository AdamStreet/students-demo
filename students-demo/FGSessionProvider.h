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

+ (instancetype)sharedProvider;

@end
