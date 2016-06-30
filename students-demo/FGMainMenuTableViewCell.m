//
//  FGMainMenuTableViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGMainMenuTableViewCell.h"

#import "FGMenuItem.h"

NSString * const FGMainMenuTableViewCellIdentifier = @"FGMainMenuTableViewCell";

@implementation FGMainMenuTableViewCell

#pragma mark - Initialization
#pragma mark - Private methods

- (void)updateVisuals
{
	self.textLabel.text = self.menuItem.title;
	self.imageView.image = self.menuItem.image;
}

#pragma mark Accessors
#pragma mark - View lifecycle
#pragma mark - Public methods
#pragma mark Accessors

- (void)setMenuItem:(FGMenuItem *)menuItem
{
	_menuItem = menuItem;
	
	[self updateVisuals];
}

#pragma mark Overrides
#pragma mark - User interaction handlers
#pragma mark - Notification handlers
#pragma mark - KVO
#pragma mark - <>

@end
