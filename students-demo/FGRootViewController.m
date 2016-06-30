//
//  FGRootViewController.m
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGRootViewController.h"

#import "FGNavigationController.h"
#import "FGStudentListTableViewController.h"

@interface FGRootViewController ()

@property (nonatomic) FGNavigationController *navigationController;
@property (nonatomic) FGStudentListTableViewController *studentListViewController;

@end

@implementation FGRootViewController

#pragma mark - Initialization
#pragma mark - Private methods
#pragma mark Accessors
#pragma mark - View lifecycle

- (void)viewDidLoad
{
	UIView *contentView = self.view;
	
	// Add student list view controller as child view controller
	
	UIViewController *studentListViewController = self.navigationController;
	
	[studentListViewController willMoveToParentViewController:self];
	
	[self addChildViewController:studentListViewController];
	
	UIView *studentListViewControllerView = studentListViewController.view;
	studentListViewControllerView.frame = contentView.bounds;
	studentListViewControllerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	[contentView addSubview:studentListViewControllerView];
	
	[studentListViewController didMoveToParentViewController:self];
}

#pragma mark - Public methods
#pragma mark Accessors

- (FGNavigationController *)navigationController
{
	if (!_navigationController) {
		_navigationController = [[FGNavigationController alloc] initWithRootViewController:self.studentListViewController];
	}
	
	return _navigationController;
}

- (FGStudentListTableViewController *)studentListViewController
{
	if (!_studentListViewController) {
		_studentListViewController = [[FGStudentListTableViewController alloc] initWithStudents];
	}
	
	return _studentListViewController;
}

#pragma mark Overrides
#pragma mark - User interaction handlers
#pragma mark - Notification handlers
#pragma mark - KVO
#pragma mark - <<#delegate#>>

@end
