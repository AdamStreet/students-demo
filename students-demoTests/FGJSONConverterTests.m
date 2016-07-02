//
//  FGJSONConverterTests.m
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "FGJSONConverter.h"

@interface FGJSONConverterTests : XCTestCase

@end

static NSString * const kJSONExampleString =
@"{\"results\": [{\"gender\": \"male\",\"name\": {\"title\": \"monsieur\",\"first\": \"mathias\",\"last\": \"picard\"}}]}";

static NSString * const kBadJSONExampleString =
@"{\"results\": [{\"gender\": \"male\",\"name\": {\"title\": \"monsieur\",\"first\": \"mathias\",\"last\": \"picard\"}}]";

@implementation FGJSONConverterTests

#pragma mark - Private methods

- (NSData *)exampleJSONData
{
	return [kJSONExampleString dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSData *)exampleBadJSONData
{
	return [kBadJSONExampleString dataUsingEncoding:NSUTF8StringEncoding];
}

#pragma mark - Overrides

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Tests

- (void)testJSONConverter
{
	NSError *error = nil;
	
	id result = [FGJSONConverter convertDataToJson:[self exampleJSONData]
								 error:&error];
	
	XCTAssertNotNil(result);
	XCTAssertNil(error);
}

- (void)testBadJSONConverter
{
	NSError *error = nil;
	
	id result = [FGJSONConverter convertDataToJson:[self exampleBadJSONData]
											 error:&error];
	
	XCTAssertNotNil(error);
	XCTAssertNil(result);
}

- (void)testBackgroundJSONConverter
{
	XCTestExpectation* expectation = [self expectationWithDescription:@"Good JSON converter"];
	
	[FGJSONConverter convertDataToJsonInBackground:[self exampleJSONData]
										completion:^(id object, NSError *error) {
											XCTAssertNotNil(object);
											XCTAssertNil(error);
											
											[expectation fulfill];
										}];
	
	[self waitForExpectationsWithTimeout:5.0
								 handler:nil];
}

- (void)testBackgroundBadJSONConverter
{
	XCTestExpectation* expectation = [self expectationWithDescription:@"Bad JSON converter"];
	
	[FGJSONConverter convertDataToJsonInBackground:[self exampleBadJSONData]
										completion:^(id object, NSError *error) {
											XCTAssertNotNil(error);
											XCTAssertNil(object);
											
											[expectation fulfill];
										}];
	
	[self waitForExpectationsWithTimeout:5.0
								 handler:nil];
}

@end
