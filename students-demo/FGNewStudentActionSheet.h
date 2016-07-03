//
//  FGNewStudentActionSheet.h
//  students-demo
//
//  Created by Adam Szabo on 03/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FGNewStudentActionSheetAction)
{
	FGNewStudentActionSheetActionCancel = 0,
	FGNewStudentActionSheetActionAddCustomStudent,
	FGNewStudentActionSheetActionAddRandomStudent
};

typedef void(^FGNewStudentActionSheetActionHandler)(FGNewStudentActionSheetAction action);

@interface FGNewStudentActionSheet : NSObject

+ (UIAlertController *)newStudentActionSheetAlertController:(FGNewStudentActionSheetActionHandler)actionHandler;

@end
