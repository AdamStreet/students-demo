#import "FGImageFile.h"

@interface FGImageFile ()

// Private interface goes here.

@end

@implementation FGImageFile

- (UIImage *)image
{
	return [UIImage imageWithContentsOfFile:self.path];
}

+ (NSString *)persistImage:(UIImage *)image
					onPath:(NSString *)path
				  filename:(NSString *)filename
{
	NSParameterAssert(image);
	NSParameterAssert(path);
	NSParameterAssert(filename);
	
	NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
	NSString *fullPath = [path stringByAppendingPathComponent:filename];
	
	[imageData writeToFile:fullPath atomically:NO];
	
	return fullPath;
}

@end
