//
//  FGNewStudentTableViewController.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGTableViewController.h"

@class FGStudent;

typedef void(^FGNewStudentTableViewControllerCompletion)(FGStudent *student);

@interface FGNewStudentTableViewController : FGTableViewController

@property (nonatomic, copy) FGNewStudentTableViewControllerCompletion completionHandler;
- (id)initWithNewStudent;

@end
