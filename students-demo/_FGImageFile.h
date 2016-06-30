// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FGImageFile.h instead.

@import CoreData;

extern const struct FGImageFileAttributes {
	__unsafe_unretained NSString *path;
} FGImageFileAttributes;

extern const struct FGImageFileRelationships {
	__unsafe_unretained NSString *student;
} FGImageFileRelationships;

@class FGStudent;

@interface FGImageFileID : NSManagedObjectID {}
@end

@interface _FGImageFile : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FGImageFileID* objectID;

@property (nonatomic, strong) NSString* path;

//- (BOOL)validatePath:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FGStudent *student;

//- (BOOL)validateStudent:(id*)value_ error:(NSError**)error_;

@end

@interface _FGImageFile (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitivePath;
- (void)setPrimitivePath:(NSString*)value;

- (FGStudent*)primitiveStudent;
- (void)setPrimitiveStudent:(FGStudent*)value;

@end
