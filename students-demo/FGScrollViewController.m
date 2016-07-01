//
//  FGScrollViewController.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGScrollViewController.h"

@interface FGScrollViewController ()

@end

@implementation FGScrollViewController

@synthesize scrollView = _scrollView;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	UIView *contentView = self.view;
	
	UIView *scrollView = self.scrollView;
	scrollView.frame = contentView.bounds;
	scrollView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	[contentView addSubview:scrollView];
}

#pragma mark - Public methods

#pragma mark Accessors

- (FGScrollView *)scrollView
{
	if (!_scrollView) {
		_scrollView = [[FGScrollView alloc] initWithFrame:CGRectZero];
	}
	
	return _scrollView;
}

@end
