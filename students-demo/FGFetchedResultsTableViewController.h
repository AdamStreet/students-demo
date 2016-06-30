//
//  FGFetchedResultsTableViewController.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGTableViewController.h"
#import <CoreData/CoreData.h>

@interface FGFetchedResultsTableViewController : FGTableViewController

@property (nonatomic, readonly) NSFetchedResultsController *fetchedResultsController;

- (instancetype)initWithStyle:(UITableViewStyle)tableViewStyle
	  fetchedResultController:(NSFetchedResultsController *)fetchedResultController;

- (__kindof UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)updateCell:(__kindof UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end
