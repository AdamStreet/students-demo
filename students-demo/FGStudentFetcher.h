//
//  FGStudentFetcher.h
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGRemoteDataFetcher.h"

#import "FGStudent.h"

typedef void(^FGStudentFetcherCompletion)(FGStudent *student, NSError *error);

@interface FGStudentFetcher : FGRemoteDataFetcher

+ (NSURLSessionDataTask *)fetchRandomStudent:(FGStudentFetcherCompletion)completion;

@end
