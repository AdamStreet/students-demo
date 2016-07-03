//
//  FGFetchedResultsCollectionViewController.m
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGFetchedResultsCollectionViewController.h"

@interface FGFetchedResultsCollectionViewController () <NSFetchedResultsControllerDelegate>

@property (nonatomic) NSFetchedResultsController *fetchedResultsController;

@end


@implementation FGFetchedResultsCollectionViewController

#pragma mark - Initialization

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
					fetchedResultsController:(NSFetchedResultsController *)fetchedResultsController
{
	self = [super initWithCollectionViewLayout:layout];
	if (self) {
		self.fetchedResultsController = fetchedResultsController;
		fetchedResultsController.delegate = self;
	}
	
	return self;
}

- (instancetype)initWithCollectionFlowLayout:(NSFetchedResultsController *)fetchedResultsController
{
	self = [super initWithCollectionFlowLayout];
	if (self) {
		self.fetchedResultsController = fetchedResultsController;
		fetchedResultsController.delegate = self;
	}
	
	return self;
}

#pragma mark - Public methods

- (__kindof UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	return nil;
}

- (void)updateCell:(__kindof UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{}

#pragma mark - <NSFetchedResultsControllerDelegate>

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{}


- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
	   atIndexPath:(NSIndexPath *)indexPath
	 forChangeType:(NSFetchedResultsChangeType)type
	  newIndexPath:(NSIndexPath *)newIndexPath
{
	FGCollectionView *collectionView = self.collectionView;
	
	switch (type) {
		case NSFetchedResultsChangeInsert: {
			[collectionView insertItemsAtIndexPaths:@[newIndexPath]];
			
			break;
		}
			
		case NSFetchedResultsChangeDelete: {
			[collectionView deleteItemsAtIndexPaths:@[indexPath]];
			
			break;
		}
			
		case NSFetchedResultsChangeUpdate: {
			[collectionView reloadItemsAtIndexPaths:@[indexPath]];
			
			break;
		}
			
		case NSFetchedResultsChangeMove: {
			[collectionView moveItemAtIndexPath:indexPath toIndexPath:newIndexPath];
			
			break;
		}
			
		default:
			break;
	}
}


- (void)controller:(NSFetchedResultsController *)controller
  didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo
		   atIndex:(NSUInteger)sectionIndex
	 forChangeType:(NSFetchedResultsChangeType)type
{
	FGCollectionView *collectionView = self.collectionView;
	
	switch (type) {
		case NSFetchedResultsChangeInsert: {
			[collectionView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]];
		
			break;
		}
			
		case NSFetchedResultsChangeDelete: {
			[collectionView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]];
			
			break;
		}
			
		case NSFetchedResultsChangeUpdate: {
			[collectionView reloadSections:[NSIndexSet indexSetWithIndex:sectionIndex]];
			
			break;
		}
			
		default:
			break;
	}
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [[self.fetchedResultsController sections] count];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView
	 numberOfItemsInSection:(NSInteger)section
{
	id<NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
	
	return [sectionInfo numberOfObjects];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
				  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	return [self cellForItemAtIndexPath:indexPath];
}

#pragma mark - <UICollectionViewDelegate>

@end
