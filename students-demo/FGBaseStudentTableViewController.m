//
//  FGBaseStudentTableViewController.m
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGBaseStudentTableViewController.h"

@interface FGBaseStudentTableViewController ()

@end

@implementation FGBaseStudentTableViewController

@synthesize tableView = _tableView;

#pragma mark - Public methods

#pragma mark Accessors

- (FGTableView *)tableView
{
	if (!_tableView) {
		_tableView = [super tableView];
		
		_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
		
		_tableView.allowsSelection = NO;
	}
	
	return _tableView;
}

@end
