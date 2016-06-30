//
//  ViewController.m
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGViewController.h"

#import "UIColor+CustomColors.h"

@interface FGViewController ()

@end


@implementation FGViewController

#pragma mark - Initialization

- (instancetype)initWithoutNib
{
	self = [super initWithNibName:nil bundle:nil];
	return self;
}

#pragma mark - View lifecycle 

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.view.backgroundColor = [UIColor generalBackgroundColor];
}

- (UINavigationItem *)navigationItem
{
	UINavigationItem *navigationItem = [super navigationItem];
	
	if (self.presentingViewController && self.cancellationHandler) {
		navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
																						 target:self
																						 action:@selector(cancelButtonTapped:)];
	}
	
	return navigationItem;
}

#pragma mark - User interaction handlers

- (void)cancelButtonTapped:(id)sender
{
	if (self.cancellationHandler) {
		self.cancellationHandler(self.presentingViewController);
	}
}

@end
