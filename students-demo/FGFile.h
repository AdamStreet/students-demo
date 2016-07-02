#import "_FGFile.h"

@interface FGFile : _FGFile {}

+ (NSString *)uniqueFileName;

+ (NSURL *)fileContainerURL;

- (NSURL *)fileURL;

@end
