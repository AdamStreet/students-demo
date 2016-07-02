#import "FGImageFile.h"

@interface FGImageFile ()

// Private interface goes here.

@end

@implementation FGImageFile

- (UIImage *)image
{
	return [UIImage imageWithContentsOfFile:self.relativePath];
}

+ (NSURL *)persistImage:(UIImage *)image
				  onURL:(NSURL *)url
			   filename:(NSString *)filename
{
	NSParameterAssert(image);
	NSParameterAssert(url);
	NSParameterAssert(filename);
	
	NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
	NSURL *fullURL = [url URLByAppendingPathComponent:filename];
	
	[imageData writeToFile:[fullURL path]
				atomically:NO];
	
	return fullURL;
}

@end
