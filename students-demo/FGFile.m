#import "FGFile.h"

@interface FGFile ()

// Private interface goes here.

@end

@implementation FGFile

#pragma mark - Private methods

- (void)deleteFileOnPath
{
	[[NSFileManager defaultManager] removeItemAtPath:self.path
											   error:nil];
}

#pragma mark - Public methods

+ (NSString *)uniqueFileName
{
	return [[NSUUID UUID] UUIDString];
}

#pragma mark Overrides 

- (void)prepareForDeletion
{
	[super prepareForDeletion];
	
	[self deleteFileOnPath];
}

@end
