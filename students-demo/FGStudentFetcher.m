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
#import "FGStudentAPIKeys.h"

static NSString * const kRandomStudentAPIEndPoint = @"https://randomuser.me/api";

@implementation FGStudentFetcher

#pragma mark - Private methods

+ (FGDatabaseManager *)databaseManager
{
	return [FGDatabaseManager mainDatabaseManager];
}

+ (NSDictionary *)studentMetadataFromResponse:(NSDictionary *)response
{
	NSArray *results = response[FGStudentAPIKeysResultsKey];
	
	return [results firstObject];
}

+ (FGStudent *)insertNewStudentInDatabaseWithMetadata:(NSDictionary *)studentMetadata
{
	FGStudent *student = [[self databaseManager] insertEntity:[FGStudent entityName]];
	student.lastName = [studentMetadata valueForKeyPath:FGStudentAPIKeysLastNameKeyPath];
	student.firstName = [studentMetadata valueForKeyPath:FGStudentAPIKeysFirstNameKeyPath];
	student.avatarImageURLString = [studentMetadata valueForKeyPath:FGStudentAPIKeysLargeAvatarKeyPath];
	
	return student;
}

#pragma mark - Public methods

+ (NSURLSessionDataTask *)fetchRandomStudentMetadata:(FGStudentFetcherMetadataCompletion)completion
{
	return [FGJSONObjectFetcher jsonDataTaskForURL:[NSURL URLWithString:kRandomStudentAPIEndPoint]
										completion:^(id responseObject, NSInteger statusCode, NSError *error) {
											if (completion) {
												NSDictionary *studentMetadata = [self studentMetadataFromResponse:responseObject];
												
												completion(studentMetadata, error);
											}
										}];
}

+ (NSURLSessionDataTask *)fetchAndInsertRandomStudent:(FGStudentFetcherStudentCompletion)completion
{
	return [self fetchRandomStudentMetadata:^(NSDictionary *metadata, NSError *error) {
		FGStudent *student = nil;
		if (metadata) {
			student = [self insertNewStudentInDatabaseWithMetadata:metadata];
		}
		
		if (completion) {
			completion(student, error);
		}
	}];
}

@end
