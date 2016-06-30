// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FGFile.h instead.

@import CoreData;

extern const struct FGFileAttributes {
	__unsafe_unretained NSString *path;
} FGFileAttributes;

@interface FGFileID : NSManagedObjectID {}
@end

@interface _FGFile : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FGFileID* objectID;

@property (nonatomic, strong) NSString* path;

//- (BOOL)validatePath:(id*)value_ error:(NSError**)error_;

@end

@interface _FGFile (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitivePath;
- (void)setPrimitivePath:(NSString*)value;

@end
