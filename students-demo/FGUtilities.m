//
//  FGUtilities.m
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGUtilities.h"

@implementation FGUtilities

@end

inline NSURL* FGUtilitiesApplicationDocumentsDirectoryURL()
{
	// The directory the application uses to store the Core Data store file. This code uses a directory named "adam.szabo.students_demo" in the application's documents directory.
	return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}
