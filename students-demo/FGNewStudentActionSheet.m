//
//  FGNewStudentActionSheet.m
//  students-demo
//
//  Created by Adam Szabo on 03/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGNewStudentActionSheet.h"

#import "FGLocalization.h"

@implementation FGNewStudentActionSheet

+ (UIAlertController *)newStudentActionSheetAlertController:(FGNewStudentActionSheetActionHandler)actionHandler
{
	
	UIAlertController *controller = [UIAlertController alertControllerWithTitle:FGLocalizedString(@"Add New Student", @"New student action sheet title")
																		message:nil
																 preferredStyle:UIAlertControllerStyleActionSheet];
	
	UIAlertAction *addCustomStudentAction = [UIAlertAction actionWithTitle:FGLocalizedString(@"Add Custom Student", @"Add student action sheet button title")
																	 style:UIAlertActionStyleDefault
																   handler:^(UIAlertAction * _Nonnull action) {
																	   if (actionHandler) {
																		   actionHandler(FGNewStudentActionSheetActionAddCustomStudent);
																	   }
																   }];
	[controller addAction:addCustomStudentAction];
	
	UIAlertAction *addRandomStudentAction = [UIAlertAction actionWithTitle:FGLocalizedString(@"Add Random Student", @"Add student action sheet button title")
																	 style:UIAlertActionStyleDefault
																   handler:^(UIAlertAction * _Nonnull action) {
																	   if (actionHandler) {
																		   actionHandler(FGNewStudentActionSheetActionAddRandomStudent);
																	   }
																   }];;
	[controller addAction:addRandomStudentAction];
	
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:FGLocalizedString(@"Cancel", @"Cancel action sheet title")
														   style:UIAlertActionStyleCancel
														 handler:^(UIAlertAction * _Nonnull action) {
															 if (actionHandler) {
																 actionHandler(FGNewStudentActionSheetActionCancel);
															 }
														 }];
	[controller addAction:cancelAction];
	
	return controller;
}

@end
