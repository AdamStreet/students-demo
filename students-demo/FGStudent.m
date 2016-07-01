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
	NSString *path = (self.avatarImageFile.path?: self.avatarImageURLString);
	
	return [NSURL URLWithString:path];
}

+ (NSArray<NSSortDescriptor *> *)sortDescriptorsByName
{
	return @[[NSSortDescriptor sortDescriptorWithKey:FGStudentAttributes.firstName
										   ascending:YES],
			 [NSSortDescriptor sortDescriptorWithKey:FGStudentAttributes.lastName
										   ascending:YES]];
}

@end
