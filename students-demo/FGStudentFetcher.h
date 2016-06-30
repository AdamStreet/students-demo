//
//  FGStudentFetcher.h
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FGStudent.h"

typedef void(^FGStudentFetcherCompletion)(FGStudent *student, NSError *error);

/**
 @brief FGStudentFetcher uses +[CGRemoteDataFetcher sharedFetcher] to fetch metadata
 & +[FGDatabaseManager mainDatabaseManager] to store the created objects.
 
 */
@interface FGStudentFetcher : NSObject

+ (NSURLSessionDataTask *)fetchRandomStudent:(FGStudentFetcherCompletion)completion;

@end
