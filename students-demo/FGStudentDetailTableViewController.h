//
//  FGStudentDetailTableViewController.h
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGBaseStudentTableViewController.h"

@class FGStudent;

@interface FGStudentDetailTableViewController : FGBaseStudentTableViewController

@property (nonatomic, readonly) FGStudent *student;

- (id)initWithStudent:(FGStudent *)student;

@end
