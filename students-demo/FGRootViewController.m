//
//  FGRootViewController.m
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGRootViewController.h"

#import "FGNavigationController.h"
#import "FGMainMenuTableViewController.h"

@interface FGRootViewController ()

@property (nonatomic) FGNavigationController *navigationController;
@property (nonatomic) UIViewController *mainViewController;

@end

@implementation FGRootViewController

#pragma mark - Initialization
#pragma mark - Private methods
#pragma mark Accessors
#pragma mark - View lifecycle

- (void)viewDidLoad
{
	UIView *contentView = self.view;
	
	UIViewController *mainViewController = self.navigationController;
	
	[mainViewController willMoveToParentViewController:self];
	
	[self addChildViewController:mainViewController];
	
	UIView *studentListViewControllerView = mainViewController.view;
	studentListViewControllerView.frame = contentView.bounds;
	studentListViewControllerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	[contentView addSubview:studentListViewControllerView];
	
	[mainViewController didMoveToParentViewController:self];
}

#pragma mark - Public methods
#pragma mark Accessors

- (FGNavigationController *)navigationController
{
	if (!_navigationController) {
		_navigationController = [[FGNavigationController alloc] initWithRootViewController:self.mainViewController];
	}
	
	return _navigationController;
}

- (UIViewController *)mainViewController
{
	if (!_mainViewController) {
		_mainViewController = [[FGMainMenuTableViewController alloc] initWithMainOptions];
	}
	
	return _mainViewController;
}

#pragma mark Overrides
#pragma mark - User interaction handlers
#pragma mark - Notification handlers
#pragma mark - KVO
#pragma mark - <<#delegate#>>

@end
