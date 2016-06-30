// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FGAvatarImageFile.m instead.

#import "_FGAvatarImageFile.h"

const struct FGAvatarImageFileRelationships FGAvatarImageFileRelationships = {
	.student = @"student",
};

@implementation FGAvatarImageFileID
@end

@implementation _FGAvatarImageFile

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"AvatarImageFile" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"AvatarImageFile";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"AvatarImageFile" inManagedObjectContext:moc_];
}

- (FGAvatarImageFileID*)objectID {
	return (FGAvatarImageFileID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic student;

@end

