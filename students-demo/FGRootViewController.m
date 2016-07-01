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

@property (nonatomic) FGNavigationController *mainNavigationController;
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
	
	UIViewController *mainViewController = self.mainNavigationController;
	
	[mainViewController willMoveToParentViewController:self];
	
	[self addChildViewController:mainViewController];
	
	UIView *mainViewControllerView = mainViewController.view;
	mainViewControllerView.frame = contentView.bounds;
	mainViewControllerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	[contentView addSubview:mainViewControllerView];
	
	[mainViewController didMoveToParentViewController:self];
}

#pragma mark - Public methods
#pragma mark Accessors

- (FGNavigationController *)mainNavigationController
{
	if (!_mainNavigationController) {
		_mainNavigationController = [[FGNavigationController alloc] initWithRootViewController:self.mainViewController];
	}
	
	return _mainNavigationController;
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
