// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FGTeacher.m instead.

#import "_FGTeacher.h"

const struct FGTeacherRelationships FGTeacherRelationships = {
	.department = @"department",
	.students = @"students",
};

@implementation FGTeacherID
@end

@implementation _FGTeacher

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Teacher" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Teacher";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Teacher" inManagedObjectContext:moc_];
}

- (FGTeacherID*)objectID {
	return (FGTeacherID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic department;

- (NSMutableSet*)departmentSet {
	[self willAccessValueForKey:@"department"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"department"];

	[self didAccessValueForKey:@"department"];
	return result;
}

@dynamic students;

- (NSMutableSet*)studentsSet {
	[self willAccessValueForKey:@"students"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"students"];

	[self didAccessValueForKey:@"students"];
	return result;
}

@end

