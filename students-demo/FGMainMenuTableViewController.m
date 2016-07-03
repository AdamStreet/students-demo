//
//  FGMainMenuViewController.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGMainMenuTableViewController.h"

#import "FGLocalization.h"
#import "FGMainMenuTableViewDataSource.h"
#import "FGMenuItemProvider.h"
#import "FGNavigationController.h"
#import "FGStudentListTableViewController.h"
#import "FGNewStudentTableViewController.h"

@interface FGMainMenuTableViewController ()

@property (nonatomic) FGMainMenuTableViewDataSource *dataSource;

@end


@implementation FGMainMenuTableViewController

@synthesize tableView = _tableView;

#pragma mark - Initialization

- (instancetype)initWithMainOptions
{
	self = [super initWithStyle:UITableViewStyleGrouped];
	if (self) {
		self.title = FGLocalizedString(@"Student App", @"Main menu title");
	}
	
	return self;
}

#pragma mark - Private methods

- (FGMenuItem *)menuItemAtIndexPath:(NSIndexPath *)indexPath
{
	return [self.dataSource menuItemAtIndexPath:indexPath];
}

- (void)showStudentListViewController
{
	FGViewController *viewController = [[FGStudentListTableViewController alloc] initWithStudents];
	
	[self.navigationController pushViewController:viewController
										 animated:YES];
}

- (void)showAddStudentViewController
{
	FGNewStudentTableViewController *newStudentTableViewController = [[FGNewStudentTableViewController alloc] initWithNewStudent];
	newStudentTableViewController.cancellationHandler = ^(__kindof UIViewController *presentingViewController){
		[presentingViewController dismissViewControllerAnimated:YES
													 completion:nil];
	};
	__weak FGNewStudentTableViewController *weakNewStudentTableViewController = newStudentTableViewController;
	newStudentTableViewController.completionHandler = ^(FGStudent *student) {
		[weakNewStudentTableViewController.presentingViewController dismissViewControllerAnimated:YES
																					   completion:nil];
	};
	
	// Wrap in NavigationController
	FGNavigationController *navigationController = [[FGNavigationController alloc] initWithRootViewController:newStudentTableViewController];
	navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
	
	[self presentViewController:navigationController
					   animated:YES
					 completion:nil];
}

#pragma mark Accessors
#pragma mark - View lifecycle
#pragma mark - Public methods
#pragma mark Accessors

- (FGMainMenuTableViewDataSource *)dataSource
{
	if (!_dataSource) {
		_dataSource = [[FGMainMenuTableViewDataSource alloc] init];
	}
	
	return _dataSource;
}

#pragma mark Overrides

- (FGTableView *)tableView
{
	if (!_tableView) {
		_tableView = [super tableView];
		_tableView.dataSource = self.dataSource;
	}
	
	return _tableView;
}

#pragma mark - User interaction handlers
#pragma mark - Notification handlers
#pragma mark - KVO

#pragma mark - <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	FGMenuItem *menuItem = [self menuItemAtIndexPath:indexPath];
	
	if ([menuItem.identifer isEqualToString:FGMenuItemIdentifierListOfStudents]) {
		[self showStudentListViewController];
	} else if ([menuItem.identifer isEqualToString:FGMenuItemIdentifierAddStudent]) {
		[self showAddStudentViewController];
	} else {
		NSAssert1(NO, @"Unhandled menu item: %@", menuItem);
	}
}

@end
