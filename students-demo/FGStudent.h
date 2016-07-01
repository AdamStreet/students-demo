#import "_FGStudent.h"

@interface FGStudent : _FGStudent {}

- (NSString *)fullName;
- (NSURL *)avatarImageURL;

+ (NSArray<NSSortDescriptor *> *)sortDescriptorsByName;

@end
