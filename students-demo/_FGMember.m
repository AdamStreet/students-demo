// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FGMember.m instead.

#import "_FGMember.h"

const struct FGMemberAttributes FGMemberAttributes = {
	.avatarImageURLString = @"avatarImageURLString",
	.cell = @"cell",
	.email = @"email",
	.firstName = @"firstName",
	.lastName = @"lastName",
	.phone = @"phone",
};

const struct FGMemberRelationships FGMemberRelationships = {
	.avatarImageFile = @"avatarImageFile",
};

@implementation FGMemberID
@end

@implementation _FGMember

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Member" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Member";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Member" inManagedObjectContext:moc_];
}

- (FGMemberID*)objectID {
	return (FGMemberID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic avatarImageURLString;

@dynamic cell;

@dynamic email;

@dynamic firstName;

@dynamic lastName;

@dynamic phone;

@dynamic avatarImageFile;

@end

