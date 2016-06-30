#import "FGImageFile.h"

@interface FGImageFile ()

// Private interface goes here.

@end

@implementation FGImageFile

- (UIImage *)image
{
	return [UIImage imageWithContentsOfFile:self.path];
}

@end
