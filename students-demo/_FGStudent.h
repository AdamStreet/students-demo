// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FGStudent.h instead.

@import CoreData;

extern const struct FGStudentAttributes {
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *lastName;
} FGStudentAttributes;

extern const struct FGStudentRelationships {
	__unsafe_unretained NSString *avatarImageFile;
} FGStudentRelationships;

@class FGImageFile;

@interface FGStudentID : NSManagedObjectID {}
@end

@interface _FGStudent : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FGStudentID* objectID;

@property (nonatomic, strong) NSString* firstName;

//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lastName;

//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FGImageFile *avatarImageFile;

//- (BOOL)validateAvatarImageFile:(id*)value_ error:(NSError**)error_;

@end

@interface _FGStudent (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;

- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;

- (FGImageFile*)primitiveAvatarImageFile;
- (void)setPrimitiveAvatarImageFile:(FGImageFile*)value;

@end
