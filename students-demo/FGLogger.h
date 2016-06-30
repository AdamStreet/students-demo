//
//  FGLogger.h
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FGLogger : NSObject

@end

#define LOGGING_LEVEL 2
#define FORCE_CONSOLE_LOGGING_IN_DEBUG_MODE 1

#if (0 == LOGGING_LEVEL)
#define DebugLog(...)
#elif (LOGGING_LEVEL == 1 || (DEBUG && FORCE_CONSOLE_LOGGING_IN_DEBUG_MODE))
#define DebugLog(fmt,...) NSLog((@"%s:%d " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#import "FGCrashReporter.h"
//	#define DebugLog(str,...) CLS_LOG(str, ##__VA_ARGS__)	// Log with crashlytics's persistent logger
#endif
