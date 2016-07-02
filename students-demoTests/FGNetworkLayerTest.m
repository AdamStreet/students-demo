//
//  FGNetworkTest.m
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "FGSessionProvider.h"
#import "FGRemoteDataFetcher.h"

#import "FGJSONObjectFetcher.h"
#import "FGImageFetcher.h"

@interface FGNetworkLayerTest : XCTestCase

@property (nonatomic) FGSessionProvider *sessionProvider;
@property (nonatomic) FGRemoteDataFetcher *dataFetcher;

@end

static NSString * const kTestApiEndpointURLString = @"https://randomuser.me/api/";
static NSString * const kTestApiWrongEndpointURL = @"http://this_shouldnt_be_exising.wat";

@implementation FGNetworkLayerTest

#pragma mark - Private methods

- (NSURL *)testApiEndpointURL
{
	return [NSURL URLWithString:kTestApiEndpointURLString];
}

- (NSURL *)testApiWrongEndpointURL
{
	return [NSURL URLWithString:kTestApiWrongEndpointURL];
}

#pragma mark - Overrides

- (void)setUp
{
    [super setUp];
	
	self.sessionProvider = [[FGSessionProvider alloc] initWithURLSession:nil];
	
	self.dataFetcher = [[FGRemoteDataFetcher alloc] initWithSessionProvider:self.sessionProvider];
}

- (void)tearDown
{
    [super tearDown];
	
	self.dataFetcher = nil;
	self.sessionProvider = nil;
}

#pragma mark - Tests

- (void)testSessionProviderExistance
{
	XCTAssertNotNil(self.sessionProvider.session);
}

- (void)testRemoteDataFetcherExistance
{
	XCTAssertNotNil(self.dataFetcher.sessionProvider);
}

- (void)testHttpRequest
{
	XCTestExpectation* expectation = [self expectationWithDescription:@"Good HTTP request"];
	
	[[FGRemoteDataFetcher sharedFetcher] dataTaskForURL:[self testApiEndpointURL]
											 completion:^(NSData *data, NSURLResponse *response, NSInteger statusCode, NSError *error) {
												 XCTAssertEqual(statusCode, 200);
												 XCTAssertNotNil(response);
												 XCTAssertNotNil(data);
												 XCTAssertNil(error);
												 
												 [expectation fulfill];
											 }];
	[self waitForExpectationsWithTimeout:60.0
								 handler:nil];
}

- (void)testWrongHttpRequest
{
	XCTestExpectation* expectation = [self expectationWithDescription:@"Bad HTTP request"];
	
	[[FGRemoteDataFetcher sharedFetcher] dataTaskForURL:[self testApiWrongEndpointURL]
											 completion:^(NSData *data, NSURLResponse *response, NSInteger statusCode, NSError *error) {
												 XCTAssertNil(data);
												 XCTAssertNotNil(error);
												 
												 [expectation fulfill];
											 }];
	[self waitForExpectationsWithTimeout:60.0
								 handler:nil];
}

@end
