//
//  FGStudentFetcher.m
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGStudentFetcher.h"

#import "FGJSONObjectFetcher.h"

#import "FGAvatarImageFile.h"
#import "FGDatabaseManager.h"
#import "FGAPIKeys.h"

static NSString * const kRandomStudentAPIEndPoint = @"https://randomuser.me/api";

@implementation FGStudentFetcher

#pragma mark - Private methods

+ (FGDatabaseManager *)databaseManager
{
	return [FGDatabaseManager mainDatabaseManager];
}

+ (NSDictionary *)studentMetadataFromResponse:(NSDictionary *)response
{
	NSArray *results = response[FGAPIKeysResultsKey];
	
	return [results firstObject];
}

+ (FGStudent *)insertNewStudentInDatabaseWithMetadata:(NSDictionary *)studentMetadata
{
	FGStudent *student = [[self databaseManager] insertEntity:[FGStudent entityName]];
	student.lastName = [studentMetadata valueForKeyPath:FGAPIKeysLastNameKeyPath];
	student.firstName = [studentMetadata valueForKeyPath:FGAPIKeysFirstNameKeyPath];
	student.avatarImagePath = [studentMetadata valueForKeyPath:FGAPIKeysLargeAvatarKeyPath];
	
	return student;
}

#pragma mark - Public methods

+ (NSURLSessionDataTask *)fetchRandomStudent:(FGStudentFetcherCompletion)completion
{
	return [FGJSONObjectFetcher jsonDataTaskForURL:[NSURL URLWithString:kRandomStudentAPIEndPoint]
										completion:^(id responseObject, NSInteger statusCode, NSError *error) {
											NSDictionary *studentMetadata = [self studentMetadataFromResponse:responseObject];
											FGStudent *student = nil;
											if (studentMetadata) {
												student = [self insertNewStudentInDatabaseWithMetadata:studentMetadata];
											}
											
											if (completion) {
												completion(student, error);
											}
										}];
}

@end
