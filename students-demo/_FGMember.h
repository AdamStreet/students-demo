// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FGMember.h instead.

@import CoreData;

extern const struct FGMemberAttributes {
	__unsafe_unretained NSString *avatarImageURLString;
	__unsafe_unretained NSString *cell;
	__unsafe_unretained NSString *email;
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *lastName;
	__unsafe_unretained NSString *phone;
} FGMemberAttributes;

extern const struct FGMemberRelationships {
	__unsafe_unretained NSString *avatarImageFile;
} FGMemberRelationships;

@class FGAvatarImageFile;

@interface FGMemberID : NSManagedObjectID {}
@end

@interface _FGMember : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FGMemberID* objectID;

@property (nonatomic, strong) NSString* avatarImageURLString;

//- (BOOL)validateAvatarImageURLString:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* cell;

//- (BOOL)validateCell:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* email;

//- (BOOL)validateEmail:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* firstName;

//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lastName;

//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* phone;

//- (BOOL)validatePhone:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) FGAvatarImageFile *avatarImageFile;

//- (BOOL)validateAvatarImageFile:(id*)value_ error:(NSError**)error_;

@end

@interface _FGMember (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAvatarImageURLString;
- (void)setPrimitiveAvatarImageURLString:(NSString*)value;

- (NSString*)primitiveCell;
- (void)setPrimitiveCell:(NSString*)value;

- (NSString*)primitiveEmail;
- (void)setPrimitiveEmail:(NSString*)value;

- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;

- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;

- (NSString*)primitivePhone;
- (void)setPrimitivePhone:(NSString*)value;

- (FGAvatarImageFile*)primitiveAvatarImageFile;
- (void)setPrimitiveAvatarImageFile:(FGAvatarImageFile*)value;

@end
