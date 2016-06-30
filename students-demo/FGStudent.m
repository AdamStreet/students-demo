#import "FGStudent.h"

@interface FGStudent ()

// Private interface goes here.

@end

@implementation FGStudent

- (NSString *)fullName
{
	return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

+ (NSArray<NSSortDescriptor *> *)sortDescriptorsByName
{
	return @[[NSSortDescriptor sortDescriptorWithKey:FGStudentAttributes.firstName
										   ascending:YES],
			 [NSSortDescriptor sortDescriptorWithKey:FGStudentAttributes.lastName
										   ascending:YES]];
}

@end
