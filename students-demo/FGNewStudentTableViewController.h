//
//  FGNewStudentTableViewController.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGBaseStudentTableViewController.h"

@class FGStudent;

typedef void(^FGNewStudentTableViewControllerCompletion)(FGStudent *student);

@interface FGNewStudentTableViewController : FGBaseStudentTableViewController

@property (nonatomic, copy) FGNewStudentTableViewControllerCompletion completionHandler;

- (instancetype)initWithStudent:(FGStudent *)student;

- (id)initWithNewStudent;	// Calls initWithStudent: with nil parameter

@end
