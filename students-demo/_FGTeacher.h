// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FGTeacher.h instead.

@import CoreData;
#import "FGMember.h"

extern const struct FGTeacherRelationships {
	__unsafe_unretained NSString *department;
	__unsafe_unretained NSString *students;
} FGTeacherRelationships;

@class FGDepartment;
@class FGStudent;

@interface FGTeacherID : FGMemberID {}
@end

@interface _FGTeacher : FGMember {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FGTeacherID* objectID;

@property (nonatomic, strong) NSSet *department;

- (NSMutableSet*)departmentSet;

@property (nonatomic, strong) NSSet *students;

- (NSMutableSet*)studentsSet;

@end

@interface _FGTeacher (DepartmentCoreDataGeneratedAccessors)
- (void)addDepartment:(NSSet*)value_;
- (void)removeDepartment:(NSSet*)value_;
- (void)addDepartmentObject:(FGDepartment*)value_;
- (void)removeDepartmentObject:(FGDepartment*)value_;

@end

@interface _FGTeacher (StudentsCoreDataGeneratedAccessors)
- (void)addStudents:(NSSet*)value_;
- (void)removeStudents:(NSSet*)value_;
- (void)addStudentsObject:(FGStudent*)value_;
- (void)removeStudentsObject:(FGStudent*)value_;

@end

@interface _FGTeacher (CoreDataGeneratedPrimitiveAccessors)

- (NSMutableSet*)primitiveDepartment;
- (void)setPrimitiveDepartment:(NSMutableSet*)value;

- (NSMutableSet*)primitiveStudents;
- (void)setPrimitiveStudents:(NSMutableSet*)value;

@end
