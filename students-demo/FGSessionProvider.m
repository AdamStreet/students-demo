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

+ (void)initializeSharedProviderWithURLSession:(NSURLSession *)session
{
	if (sharedInstance) {
		NSAssert(NO, @"Shared instance already initialized");
		
		return;
	}
	
	sharedInstance = [[self alloc] initWithURLSession:session];
}

+ (instancetype)sharedProvider
{
	if (![self isSharedProviderInitialized]) {
		NSAssert(NO, @"Shared instance is not initialized");
	}
	
	return sharedInstance;
}

- (instancetype)initWithURLSession:(NSURLSession *)session
{
	self = [super init];
	if (self) {
		if (!session) {
			session = [NSURLSession sharedSession];
		}
		self.session = session;
	}

	return self;
}

@end
