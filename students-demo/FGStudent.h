#import "_FGStudent.h"

@interface FGStudent : _FGStudent {}

- (NSString *)fullName;

+ (NSArray<NSSortDescriptor *> *)sortDescriptorsByName;

@end
