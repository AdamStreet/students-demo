//
//  FGStudentListViewController.m
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGStudentListTableViewController.h"

#import "FGLocalization.h"
#import "FGDatabaseManager.h"
#import "FGStudentTableViewCell.h"
#import "FGStudent.h"
#import "FGStudentDetailTableViewController.h"

@implementation FGStudentListTableViewController

@synthesize fetchedResultsController = _fetchedResultsController;

#pragma mark - Initialization

- (instancetype)initWithStudents
{
	self = [super initWithStyle:UITableViewStyleGrouped
		fetchedResultController:self.fetchedResultsController];
	if (self) {
		self.title = FGLocalizedString(@"Students", @"Student list title");
	}
	
	return self;
}

#pragma mark - Private methods

- (FGDatabaseManager *)databaseManager
{
	return [FGDatabaseManager mainDatabaseManager];
}

- (FGStudent *)studentAtIndexPath:(NSIndexPath *)indexPath
{
	return [self.fetchedResultsController objectAtIndexPath:indexPath];
}

- (void)showStudentDetails:(FGStudent *)student
{
	FGStudentDetailTableViewController *detailViewController = [[FGStudentDetailTableViewController alloc] initWithStudent:student];
	
	[self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark Accessors
#pragma mark - View lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	// Register cells
	[self.tableView registerClass:[FGStudentTableViewCell class]
		   forCellReuseIdentifier:FGStudentTableViewCellIdentifier];
}

#pragma mark - Public methods
#pragma mark Accessors
#pragma mark Overrides

- (NSFetchedResultsController *)fetchedResultsController
{
	if (!_fetchedResultsController) {
		NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:[FGStudent entityName]];
		request.sortDescriptors = [FGStudent sortDescriptorsByName];
		
		_fetchedResultsController = [[self databaseManager] fetchedResultsControllerForFetchRequest:request
																				 sectionNameKeyPath:nil
																						  cacheName:nil];
	}
	
	return _fetchedResultsController;
}

- (__kindof UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	FGStudentTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:FGStudentTableViewCellIdentifier
																		forIndexPath:indexPath];
	[self updateCell:cell atIndexPath:indexPath];
	
	return cell;
}

- (void)updateCell:(__kindof UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
	if ([cell isKindOfClass:[FGStudentTableViewCell class]]){
		((FGStudentTableViewCell *)cell).student = [self studentAtIndexPath:indexPath];
	} else {
		NSAssert1(NO, @"Unknown cell: %@", cell);
	}
}

#pragma mark - User interaction handlers
#pragma mark - Notification handlers
#pragma mark - KVO

#pragma mark - <UITableViewDataSource>

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
	return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	FGStudent *student = [self.fetchedResultsController objectAtIndexPath:indexPath];
	
	[[self databaseManager] deleteEntity:student];
	
	[[self databaseManager] saveContext];
}

#pragma mark - <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self showStudentDetails:[self studentAtIndexPath:indexPath]];
}

@end
