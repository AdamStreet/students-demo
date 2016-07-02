#import "FGFile.h"

#import "FGLocalPaths.h"

@interface FGFile ()

// Private interface goes here.

@end

static NSString *kFileContainerName = @"saved_files";

@implementation FGFile

#pragma mark - Private methods

- (void)deleteFileOnPath
{
	[[NSFileManager defaultManager] removeItemAtPath:self.relativePath
											   error:nil];
}

#pragma mark Class methods

+ (NSURL *)basePath
{
	return [FGLocalPaths applicationDocumentsDirectoryURL];
}

#pragma mark - Public methods

- (NSURL *)fileURL
{
	if (!self.relativePath)
		return nil;
	
	return [NSURL URLWithString:self.relativePath
				  relativeToURL:[FGFile basePath]];
}

#pragma mark Class methods

+ (NSString *)uniqueFileName
{
	return [[NSUUID UUID] UUIDString];
}

+ (NSURL *)fileContainerURL
{
	NSURL *fileBaseURL = [NSURL URLWithString:kFileContainerName
								relativeToURL:[self basePath]];
	
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

#pragma mark Overrides 

- (void)prepareForDeletion
{
	[super prepareForDeletion];
	
	[self deleteFileOnPath];
}

@end
