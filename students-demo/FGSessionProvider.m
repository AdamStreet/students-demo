//
//  FGSessionProvider.m
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGSessionProvider.h"

@interface FGSessionProvider ()

@property (nonatomic) NSURLSession *session;

@end


@implementation FGSessionProvider

static FGSessionProvider *sharedInstance = nil;

+ (BOOL)isSharedProviderInitialized
{
	return !!sharedInstance;
}

+ (void)initializeSharedProvider
{
	if (sharedInstance) {
		NSAssert(NO, @"Shared instance already initialized");
		
		return;
	}
	
	sharedInstance = [[self alloc] init];
}

+ (instancetype)sharedProvider
{
	if (![self isSharedProviderInitialized]) {
		[self initializeSharedProvider];
	}
	
	return sharedInstance;
}

- (instancetype)init
{
	self = [super init];
	if (self) {
		self.session = [NSURLSession sharedSession];	// Do custom configuration here - if needed
	}

	return self;
}

@end
