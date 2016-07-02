#import <UIKit/UIKit.h>

#import "_FGImageFile.h"

@interface FGImageFile : _FGImageFile {}

- (UIImage *)image;

+ (NSString *)persistImage:(UIImage *)image
					onPath:(NSString *)path
				  filename:(NSString *)filename;

@end
