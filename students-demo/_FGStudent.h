// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FGStudent.h instead.

@import CoreData;

extern const struct FGStudentAttributes {
	__unsafe_unretained NSString *avatarImageURLString;
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *lastName;
} FGStudentAttributes;

extern const struct FGStudentRelationships {
	__unsafe_unretained NSString *avatarImageFile;
} FGStudentRelationships;

@class FGAvatarImageFile;

@interface FGStudentID : NSManagedObjectID {}
@end

@interface _FGStudent : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FGStudentID* objectID;

@property (nonatomic, strong) NSString* avatarImageURLString;

//- (BOOL)validateAvatarImageURLString:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* firstName;

//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lastName;

//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FGAvatarImageFile *avatarImageFile;

//- (BOOL)validateAvatarImageFile:(id*)value_ error:(NSError**)error_;

@end

@interface _FGStudent (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAvatarImageURLString;
- (void)setPrimitiveAvatarImageURLString:(NSString*)value;

- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;

- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;

- (FGAvatarImageFile*)primitiveAvatarImageFile;
- (void)setPrimitiveAvatarImageFile:(FGAvatarImageFile*)value;

@end
