//
//  FGLocalPaths.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FGLocalPaths : NSObject

+ (NSURL *)applicationDocumentsDirectoryURL;
+ (NSURL *)cacheDirectoryURL;

@end
