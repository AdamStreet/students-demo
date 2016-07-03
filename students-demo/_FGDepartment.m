// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FGDepartment.m instead.

#import "_FGDepartment.h"

const struct FGDepartmentAttributes FGDepartmentAttributes = {
	.name = @"name",
};

const struct FGDepartmentRelationships FGDepartmentRelationships = {
	.teachers = @"teachers",
};

@implementation FGDepartmentID
@end

@implementation _FGDepartment

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Department" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Department";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Department" inManagedObjectContext:moc_];
}

- (FGDepartmentID*)objectID {
	return (FGDepartmentID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic name;

@dynamic teachers;

- (NSMutableSet*)teachersSet {
	[self willAccessValueForKey:@"teachers"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"teachers"];

	[self didAccessValueForKey:@"teachers"];
	return result;
}

@end

