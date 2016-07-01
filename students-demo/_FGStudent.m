// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FGStudent.m instead.

#import "_FGStudent.h"

const struct FGStudentAttributes FGStudentAttributes = {
	.avatarImageURLString = @"avatarImageURLString",
	.firstName = @"firstName",
	.lastName = @"lastName",
};

const struct FGStudentRelationships FGStudentRelationships = {
	.avatarImageFile = @"avatarImageFile",
};

@implementation FGStudentID
@end

@implementation _FGStudent

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Student";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Student" inManagedObjectContext:moc_];
}

- (FGStudentID*)objectID {
	return (FGStudentID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic avatarImageURLString;

@dynamic firstName;

@dynamic lastName;

@dynamic avatarImageFile;

@end

