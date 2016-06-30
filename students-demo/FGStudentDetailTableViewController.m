//
//  FGStudentDetailTableViewController.m
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGStudentDetailTableViewController.h"

#import "FGStudentFetcher.h"

@interface FGStudentDetailTableViewController ()

@property (nonatomic) FGStudent *student;

@end

@implementation FGStudentDetailTableViewController

- (id)initWithStudent:(FGStudent *)student
{
	self = [super initWithStyle:UITableViewStylePlain];
	if (self) {
		self.student = student;
	}
	
	return self;
}

- (id)initWithNewStudent
{
	self = [super initWithStyle:UITableViewStylePlain];
	if (self) {
	}
	
	return self;
}

//- (void)viewDidLoad
//{
//	[super viewDidLoad];
//}

@end
