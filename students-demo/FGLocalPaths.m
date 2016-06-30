//
//  FGLocalPaths.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGLocalPaths.h"

@implementation FGLocalPaths

+ (NSURL *)applicationDocumentsDirectoryURL
{
	return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
												   inDomains:NSUserDomainMask] lastObject];
}

+ (NSURL *)cacheDirectoryURL
{
	return [[[NSFileManager defaultManager] URLsForDirectory:NSCachesDirectory
												   inDomains:NSUserDomainMask] lastObject];
}

@end
