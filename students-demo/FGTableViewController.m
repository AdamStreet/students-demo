//
//  FGTableViewController.m
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGTableViewController.h"

@interface FGTableViewController ()

@property (nonatomic) NSLayoutConstraint *tableViewHeightConstraint;

@end


@implementation FGTableViewController

@synthesize tableView = _tableView;

#pragma mark - Initialization

- (instancetype)initWithStyle:(UITableViewStyle)tableViewStyle
{
	self = [super initWithNibName:nil bundle:nil];
	if (self) {
		_tableViewStyle = tableViewStyle;
		
		self.deselectTableViewRowOnDidAppear = YES;
		self.resizeTableViewOnKeyboardAppear = YES;
		
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(handleKeyboardWillShowNotification:)
													 name:UIKeyboardWillShowNotification
												   object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(handleKeyboardWillHideNotification:)
													 name:UIKeyboardWillHideNotification
												   object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(handleKeyboardWillChangeFrameNotification:)
													 name:UIKeyboardWillChangeFrameNotification
												   object:nil];
	}
	
	return self;
}

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Private methods

- (void)updateTableViewSize:(CGRect)keyboardRectOnWindow
		  animationDuration:(NSTimeInterval)animationDuration
{
	if (!self.resizeTableViewOnKeyboardAppear)
		return;
	
	const CGRect keyboardNetRect = [self.view.window convertRect:keyboardRectOnWindow
														  toView:self.tableView];
	
	CGFloat coveredBottomFrameHeight = (keyboardNetRect.origin.y - self.view.frame.size.height);
	const BOOL isKeyboardOutOfCurrentView = (0.0 < coveredBottomFrameHeight);
	if (isKeyboardOutOfCurrentView) {
		coveredBottomFrameHeight = 0.0;
	}
	
	[UIView animateWithDuration:animationDuration
					 animations:^{
						 self.tableViewHeightConstraint.constant = -coveredBottomFrameHeight;
					 }];
}

#pragma mark Accessors
#pragma mark - View lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	UIView *contentView = self.view;
	
	UIView *tableView = self.tableView;
	[contentView addSubview:tableView];
	
	// Autolayout
	
	tableView.translatesAutoresizingMaskIntoConstraints = NO;
	
	NSDictionary *subviews = NSDictionaryOfVariableBindings(tableView);
	
	[contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|"
																		options:kNilOptions
																		metrics:nil
																		  views:subviews]];
	[contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]"
																		options:kNilOptions
																		metrics:nil
																		  views:subviews]];
	NSLayoutConstraint *tableViewHeightConstraint =
	[NSLayoutConstraint constraintWithItem:tableView
								 attribute:NSLayoutAttributeHeight
								 relatedBy:NSLayoutRelationEqual
									toItem:contentView
								 attribute:NSLayoutAttributeHeight
								multiplier:1.0
								  constant:0.0];
	[contentView addConstraint:tableViewHeightConstraint];
	self.tableViewHeightConstraint = tableViewHeightConstraint;
	
	[contentView layoutIfNeeded];	// Avoid invalid cell sizes
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

- (void)handleKeyboardWillShowNotification:(NSNotification *)notification
{
	const CGRect keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
	const NSTimeInterval animationDuration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
	
	[self updateTableViewSize:keyboardRect animationDuration:animationDuration];
}

- (void)handleKeyboardWillHideNotification:(NSNotification *)notification
{
	const CGRect keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
	const NSTimeInterval animationDuration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
	
	[self updateTableViewSize:keyboardRect animationDuration:animationDuration];
}

- (void)handleKeyboardWillChangeFrameNotification:(NSNotification *)notification
{
	const CGRect keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
	const NSTimeInterval animationDuration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
	
	[self updateTableViewSize:keyboardRect animationDuration:animationDuration];
}

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
