//
//  FGFetchedResultsCollectionViewController.h
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGCollectionViewController.h"

#import <CoreData/CoreData.h>

@interface FGFetchedResultsCollectionViewController : FGCollectionViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, readonly) NSFetchedResultsController *fetchedResultsController;

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
					fetchedResultsController:(NSFetchedResultsController *)fetchedResultsController;

- (instancetype)initWithCollectionFlowLayout:(NSFetchedResultsController *)fetchedResultsController;

- (__kindof UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)updateCell:(__kindof UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end
