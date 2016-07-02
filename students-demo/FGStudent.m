#import "FGStudent.h"

#import "FGAvatarImageFile.h"

@interface FGStudent ()

// Private interface goes here.

@end

@implementation FGStudent

- (NSString *)fullName
{
	return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (NSURL *)avatarImageURL
{
	NSURL *fileURL = [self.avatarImageFile fileURL];
	if (fileURL)
		return fileURL;
	
	NSString *avatarImageURLString = self.avatarImageURLString;
	if (avatarImageURLString)
		return [NSURL URLWithString:avatarImageURLString];
	
	return nil;
}

+ (NSArray<NSSortDescriptor *> *)sortDescriptorsByName
{
	return @[[NSSortDescriptor sortDescriptorWithKey:FGStudentAttributes.firstName
										   ascending:YES],
			 [NSSortDescriptor sortDescriptorWithKey:FGStudentAttributes.lastName
										   ascending:YES]];
}

@end
