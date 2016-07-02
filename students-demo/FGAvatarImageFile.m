#import "FGAvatarImageFile.h"

@interface FGAvatarImageFile ()

// Private interface goes here.

@end

static NSString * const kAvatarImageContainerName = @"avatars";

@implementation FGAvatarImageFile

+ (NSURL *)avatarImageFilesContainerURL
{
	NSURL *fileBaseURL = [[FGFile fileContainerURL]
						  URLByAppendingPathComponent:kAvatarImageContainerName];
	
	NSError *error = nil;
	if (![[NSFileManager defaultManager] createDirectoryAtURL:fileBaseURL
								  withIntermediateDirectories:YES
												   attributes:nil
														error:&error]) {
		NSAssert(NO, @"Error while creating base file container on URL: %@", fileBaseURL);
		
		fileBaseURL = nil;
		
	}
	
	return fileBaseURL;
}

@end
