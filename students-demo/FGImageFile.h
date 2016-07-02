#import <UIKit/UIKit.h>

#import "_FGImageFile.h"

@interface FGImageFile : _FGImageFile {}

- (UIImage *)image;

+ (NSURL *)persistImage:(UIImage *)image
				  onURL:(NSURL *)url
			   filename:(NSString *)filename;

@end
