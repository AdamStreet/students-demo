// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FGImageFile.m instead.

#import "_FGImageFile.h"

@implementation FGImageFileID
@end

@implementation _FGImageFile

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ImageFile" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ImageFile";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ImageFile" inManagedObjectContext:moc_];
}

- (FGImageFileID*)objectID {
	return (FGImageFileID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@end

