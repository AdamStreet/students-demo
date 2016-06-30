//
//  FGMainMenuTableViewDataSource.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGMainMenuTableViewDataSource.h"

#import "FGMainMenuTableViewCell.h"
#import "FGMenuItem.h"
#import "FGMenuItemProvider.h"

@interface FGMainMenuTableViewDataSource ()

@property (nonatomic) NSArray<FGMenuItem *> *menuItems;

@property (nonatomic, getter=isMainMenuTableViewCellClassRegistered) BOOL mainMenuTableViewCellClassRegistered;

@end


@implementation FGMainMenuTableViewDataSource

#pragma mark - Initilzation

- (instancetype)init
{
	self = [super init];
	if (self) {
		self.menuItems = [FGMenuItemProvider loadMenuItems];
	}
	
	return self;
}

#pragma mark - Private methods

#pragma mark - Public methods

- (FGMenuItem *)menuItemAtIndexPath:(NSIndexPath *)indexPath
{
	return self.menuItems[indexPath.row];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (!self.isMainMenuTableViewCellClassRegistered) {
		[tableView registerClass:[FGMainMenuTableViewCell class]
		  forCellReuseIdentifier:FGMainMenuTableViewCellIdentifier];
		
		self.mainMenuTableViewCellClassRegistered = YES;
	}
	
	FGMainMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FGMainMenuTableViewCellIdentifier
																	forIndexPath:indexPath];
	cell.menuItem = [self menuItemAtIndexPath:indexPath];
	
	return cell;
}

@end
