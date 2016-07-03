// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FGAvatarImageFile.h instead.

@import CoreData;
#import "FGImageFile.h"

extern const struct FGAvatarImageFileRelationships {
	__unsafe_unretained NSString *member;
} FGAvatarImageFileRelationships;

@class FGMember;

@interface FGAvatarImageFileID : FGImageFileID {}
@end

@interface _FGAvatarImageFile : FGImageFile {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FGAvatarImageFileID* objectID;

@property (nonatomic, strong) FGMember *member;

//- (BOOL)validateMember:(id*)value_ error:(NSError**)error_;

@end

@interface _FGAvatarImageFile (CoreDataGeneratedPrimitiveAccessors)

- (FGMember*)primitiveMember;
- (void)setPrimitiveMember:(FGMember*)value;

@end
