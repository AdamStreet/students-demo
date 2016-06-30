//
//  FGStudentListViewController.m
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGStudentListTableViewController.h"

#import "FGLocalization.h"

@implementation FGStudentListTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)tableViewStyle
{
	self = [super initWithStyle:tableViewStyle];
	if (self) {
		self.title = FGLocalizedString(@"Students", @"Student list title");
	}
	
	return self;
}

@end
