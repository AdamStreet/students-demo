//
//  FGTableViewController.m
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGTableViewController.h"

@implementation FGTableViewController

@synthesize tableView = _tableView;

#pragma mark - Initialization

- (instancetype)initWithStyle:(UITableViewStyle)tableViewStyle
{
	self = [super initWithNibName:nil bundle:nil];
	if (self) {
		_tableViewStyle = tableViewStyle;
		
		self.deselectTableViewRowOnDidAppear = YES;
	}
	
	return self;
}

#pragma mark - Private methods
#pragma mark Accessors
#pragma mark - View lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	UIView *contentView = self.view;
	
	UIView *tableView = self.tableView;
	tableView.frame = contentView.bounds;
	tableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	[contentView addSubview:tableView];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	if (self.deselectTableViewRowOnDidAppear) {
		[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow]
									  animated:YES];
	}
}

#pragma mark - Public methods
#pragma mark Accessors

- (FGTableView *)tableView
{
	if (!_tableView) {
		_tableView = [[FGTableView alloc] initWithFrame:CGRectZero
												  style:self.tableViewStyle];
		_tableView.delegate = self;
		_tableView.dataSource = self;
	}
	
	return _tableView;
}

#pragma mark Overrides
#pragma mark - User interaction handlers
#pragma mark - Notification handlers
#pragma mark - KVO
#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return nil;
}

#pragma mark - <UITableViewDelegate>

@end
