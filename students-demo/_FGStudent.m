// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FGStudent.m instead.

#import "_FGStudent.h"

const struct FGStudentAttributes FGStudentAttributes = {
	.averageGrade = @"averageGrade",
};

const struct FGStudentRelationships FGStudentRelationships = {
	.teachers = @"teachers",
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

	if ([key isEqualToString:@"averageGradeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"averageGrade"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic averageGrade;

- (float)averageGradeValue {
	NSNumber *result = [self averageGrade];
	return [result floatValue];
}

- (void)setAverageGradeValue:(float)value_ {
	[self setAverageGrade:@(value_)];
}

- (float)primitiveAverageGradeValue {
	NSNumber *result = [self primitiveAverageGrade];
	return [result floatValue];
}

- (void)setPrimitiveAverageGradeValue:(float)value_ {
	[self setPrimitiveAverageGrade:@(value_)];
}

@dynamic teachers;

- (NSMutableSet*)teachersSet {
	[self willAccessValueForKey:@"teachers"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"teachers"];

	[self didAccessValueForKey:@"teachers"];
	return result;
}

@end

