//
//  FGJSONConverter.m
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGJSONConverter.h"

#import "FGLogger.h"

@implementation FGJSONConverter

+ (id)convertDataToJson:(NSData *)data error:(NSError * __autoreleasing *)error
{
	NSError *internalError = nil;
	id object = [NSJSONSerialization JSONObjectWithData:data
												options:0
												  error:&internalError];
	if (internalError) {
		DebugLog(@"JSON error while converting: %@", error);
		
		if (error) {
			*error = [internalError copy];
		}
	}
	
	return object;
}

+ (void)convertDataToJsonInBackground:(NSData *)data completion:(FGJSONConverterCompletion)completion
{
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
		NSError *error = nil;
		id object = [self convertDataToJson:data error:&error];
		
		dispatch_async(dispatch_get_main_queue(), ^{
			if (completion) {
				completion(object, error);
			}
		});
	});
}

@end
