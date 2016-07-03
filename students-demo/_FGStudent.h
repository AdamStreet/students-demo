// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to FGStudent.h instead.

@import CoreData;
#import "FGMember.h"

extern const struct FGStudentAttributes {
	__unsafe_unretained NSString *averageGrade;
} FGStudentAttributes;

extern const struct FGStudentRelationships {
	__unsafe_unretained NSString *teachers;
} FGStudentRelationships;

@class FGTeacher;

@interface FGStudentID : FGMemberID {}
@end

@interface _FGStudent : FGMember {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) FGStudentID* objectID;

@property (nonatomic, strong) NSNumber* averageGrade;

@property (atomic) float averageGradeValue;
- (float)averageGradeValue;
- (void)setAverageGradeValue:(float)value_;

//- (BOOL)validateAverageGrade:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *teachers;

- (NSMutableSet*)teachersSet;

@end

@interface _FGStudent (TeachersCoreDataGeneratedAccessors)
- (void)addTeachers:(NSSet*)value_;
- (void)removeTeachers:(NSSet*)value_;
- (void)addTeachersObject:(FGTeacher*)value_;
- (void)removeTeachersObject:(FGTeacher*)value_;

@end

@interface _FGStudent (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveAverageGrade;
- (void)setPrimitiveAverageGrade:(NSNumber*)value;

- (float)primitiveAverageGradeValue;
- (void)setPrimitiveAverageGradeValue:(float)value_;

- (NSMutableSet*)primitiveTeachers;
- (void)setPrimitiveTeachers:(NSMutableSet*)value;

@end
