//
//  FGDatabaseTests.m
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "FGDatabaseManager.h"
#import "FGStudent.h"
#import "FGAvatarImageFile.h"
#import "FGLocalPaths.h"
#import "FGTestResourceProvider.h"

@interface FGDatabaseTests : XCTestCase

@property (nonatomic) FGDatabaseManager *databaseManager;

@end

static NSString * const kTestStudentLastName = @"williams";
static NSString * const kTestStudentFirstName = @"alexander";
static NSString * const kTestStudentAvatarURLString = @"https://randomuser.me/api/portraits/men/0.jpg";
static NSString * const kTestStudentEmail = @"email@address.ca";
static NSString * const kTestStudentCell = @"213 4213 32132";
static NSString * const kTestStudentPhone = @"0649 213 4322";

@implementation FGDatabaseTests

- (NSArray<FGStudent *> *)students
{
	return [self.databaseManager fetchResultsOfRequest:[NSFetchRequest
														fetchRequestWithEntityName:[FGStudent entityName]]];
}

#pragma mark - Overrides

- (void)setUp
{
    [super setUp];
	
	self.databaseManager = [[FGDatabaseManager alloc] initWithName:@"test"];
}

- (void)tearDown
{
	self.databaseManager = nil;
	
    [super tearDown];
}

- (void)testStudentHandling
{
	const NSInteger initialNumberOfStudents = [[self students] count];
	
	FGStudent *insertedStudent = [self.databaseManager insertEntity:[FGStudent entityName]];
	insertedStudent.lastName = kTestStudentLastName;
	insertedStudent.firstName = kTestStudentFirstName;
	insertedStudent.avatarImageURLString = kTestStudentAvatarURLString;
	insertedStudent.email = kTestStudentEmail;
	insertedStudent.cell = kTestStudentCell;
	insertedStudent.phone = kTestStudentPhone;
	
	[self.databaseManager saveContext];
	
	XCTAssertNotNil(insertedStudent);
	XCTAssertEqual(insertedStudent.lastName, kTestStudentLastName);
	XCTAssertEqual(insertedStudent.firstName, kTestStudentFirstName);
	XCTAssertEqual(insertedStudent.avatarImageURLString, kTestStudentAvatarURLString);
	XCTAssertEqual(insertedStudent.email, kTestStudentEmail);
	XCTAssertEqual(insertedStudent.cell, kTestStudentCell);
	XCTAssertEqual(insertedStudent.phone, kTestStudentPhone);
	
	XCTAssertNotNil([insertedStudent avatarImageURL]);
	
	XCTAssertEqual(initialNumberOfStudents + 1, [[self students] count]);
	
	[self.databaseManager deleteEntity:insertedStudent];
	
	XCTAssertEqual(initialNumberOfStudents, [[self students] count]);
	XCTAssertTrue([insertedStudent isDeleted]);
}

- (void)testFileHandling
{
	FGStudent *insertedStudent = [self.databaseManager insertEntity:[FGStudent entityName]];
	insertedStudent.lastName = kTestStudentLastName;
	insertedStudent.firstName = kTestStudentFirstName;
	
	// Set up example file
	NSString *localImageRelativePath = @"avatar_image.jpg";
	
	// Create file entity
	FGAvatarImageFile *avatarFile = [self.databaseManager insertEntity:[FGAvatarImageFile entityName]];
	avatarFile.relativePath = localImageRelativePath;
	insertedStudent.avatarImageFile = avatarFile;
	
	// Create local image copy
	NSString *localFilePath = [[avatarFile fileURL] path];
	
	NSData *imageData = UIImageJPEGRepresentation([FGTestResourceProvider testAvatarImage], 1.0);
	XCTAssertNotNil(imageData);
	const BOOL success = [imageData writeToFile:localFilePath atomically:YES];
	XCTAssertTrue(success);
	
	[self.databaseManager saveContext];
	
	XCTAssertNotNil(avatarFile);
	XCTAssertNotNil([insertedStudent avatarImageURL]);
	
	[self.databaseManager deleteEntity:insertedStudent];
	
	XCTestExpectation* expectation = [self expectationWithDescription:@"Cascade relation between Student & AvatarImageFile"];
	
	// Give some time for the database to be updated > check in the next loop
	[self.databaseManager performBlock:^{
		XCTAssertTrue([insertedStudent isDeleted]);
		XCTAssertTrue([avatarFile isDeleted]);
		
		// Check image copy
		const BOOL fileStillExisting = [[NSFileManager defaultManager] fileExistsAtPath:localFilePath];
		XCTAssertFalse(fileStillExisting);
		
		[expectation fulfill];
	}];
	
	[self waitForExpectationsWithTimeout:1.0
								 handler:nil];
}

@end
