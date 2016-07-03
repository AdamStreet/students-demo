// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FGDepartment.h instead.

@import CoreData;

extern const struct FGDepartmentAttributes {
	__unsafe_unretained NSString *name;
} FGDepartmentAttributes;

extern const struct FGDepartmentRelationships {
	__unsafe_unretained NSString *teachers;
} FGDepartmentRelationships;

@class FGTeacher;

@interface FGDepartmentID : NSManagedObjectID {}
@end

@interface _FGDepartment : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FGDepartmentID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *teachers;

- (NSMutableSet*)teachersSet;

@end

@interface _FGDepartment (TeachersCoreDataGeneratedAccessors)
- (void)addTeachers:(NSSet*)value_;
- (void)removeTeachers:(NSSet*)value_;
- (void)addTeachersObject:(FGTeacher*)value_;
- (void)removeTeachersObject:(FGTeacher*)value_;

@end

@interface _FGDepartment (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveTeachers;
- (void)setPrimitiveTeachers:(NSMutableSet*)value;

@end
