// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FGFile.m instead.

#import "_FGFile.h"

const struct FGFileAttributes FGFileAttributes = {
	.path = @"path",
};

@implementation FGFileID
@end

@implementation _FGFile

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"File" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"File";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"File" inManagedObjectContext:moc_];
}

- (FGFileID*)objectID {
	return (FGFileID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic path;

@end

