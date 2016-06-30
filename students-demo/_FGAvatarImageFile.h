// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FGAvatarImageFile.h instead.

@import CoreData;
#import "FGImageFile.h"

extern const struct FGAvatarImageFileRelationships {
	__unsafe_unretained NSString *student;
} FGAvatarImageFileRelationships;

@class FGStudent;

@interface FGAvatarImageFileID : FGImageFileID {}
@end

@interface _FGAvatarImageFile : FGImageFile {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FGAvatarImageFileID* objectID;

@property (nonatomic, strong) FGStudent *student;

//- (BOOL)validateStudent:(id*)value_ error:(NSError**)error_;

@end

@interface _FGAvatarImageFile (CoreDataGeneratedPrimitiveAccessors)

- (FGStudent*)primitiveStudent;
- (void)setPrimitiveStudent:(FGStudent*)value;

@end
