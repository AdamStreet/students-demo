//
//  FGStudentListViewController.m
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGStudentCardsCollectionViewController.h"

#import "FGLocalization.h"
#import "FGDatabaseManager.h"
#import "FGStudentCardCollectionViewCell.h"
#import "FGStudent.h"
#import "FGStudentDetailTableViewController.h"

@interface FGStudentCardsCollectionViewController ()

@property (nonatomic) NSIndexPath *flippedCellIndexPath;

@end

static const CGFloat kGapAroundElements = 5.0;

@implementation FGStudentCardsCollectionViewController

@synthesize collectionView = _collectionView;
@synthesize fetchedResultsController = _fetchedResultsController;

#pragma mark - Initialization

- (instancetype)initWithStudents
{
	self = [super initWithCollectionFlowLayout:self.fetchedResultsController];
	if (self) {
		self.title = FGLocalizedString(@"Students", @"Student list title");
	}
	
	return self;
}

#pragma mark - Private methods

- (FGDatabaseManager *)databaseManager
{
	return [FGDatabaseManager mainDatabaseManager];
}

- (FGStudent *)studentAtIndexPath:(NSIndexPath *)indexPath
{
	return [self.fetchedResultsController objectAtIndexPath:indexPath];
}

- (void)showStudentDetails:(FGStudent *)student
{
	FGStudentDetailTableViewController *detailViewController = [[FGStudentDetailTableViewController alloc] initWithStudent:student];
	
	[self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark Accessors
#pragma mark - View lifecycle

#pragma mark - Public methods
#pragma mark Accessors
#pragma mark Overrides

- (FGCollectionView *)collectionView
{
	if (!_collectionView) {
		_collectionView = [super collectionView];
		
		[_collectionView registerClass:[FGStudentCardCollectionViewCell class]
			forCellWithReuseIdentifier:FGStudentCardCollectionViewCellIdentifier];
	}
	
	return _collectionView;
}

- (NSFetchedResultsController *)fetchedResultsController
{
	if (!_fetchedResultsController) {
		NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:[FGStudent entityName]];
		request.sortDescriptors = [FGStudent sortDescriptorsByName];
		
		_fetchedResultsController = [[self databaseManager] fetchedResultsControllerForFetchRequest:request
																				 sectionNameKeyPath:nil
																						  cacheName:nil];
	}
	
	return _fetchedResultsController;
}

- (__kindof UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	__kindof FGStudentCardCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:FGStudentCardCollectionViewCellIdentifier
																				  forIndexPath:indexPath];
	[self updateCell:cell atIndexPath:indexPath];
	
	return cell;
}

- (void)updateCell:(__kindof UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
	if ([cell isKindOfClass:[FGStudentCardCollectionViewCell class]]){
		FGStudentCardCollectionViewCell *castedCell = (FGStudentCardCollectionViewCell *)cell;
		castedCell.student = [self studentAtIndexPath:indexPath];
		
		if ([indexPath isEqual:self.flippedCellIndexPath] && !castedCell.isFlipped) {
			[cell flipCard:NO];
		} else if (![indexPath isEqual:self.flippedCellIndexPath] && castedCell.isFlipped) {
			[cell flipCard:NO];
		}
	} else {
		NSAssert1(NO, @"Unknown cell: %@", cell);
	}
}

#pragma mark - User interaction handlers
#pragma mark - Notification handlers
#pragma mark - KVO

#pragma mark - <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView
				  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
	const CGFloat totalWidth = collectionView.frame.size.width;
	const CGFloat availableWidthForCards = (totalWidth - (kGapAroundElements * 2));
	
	const CGFloat cardRatio = (FGStudentCardCollectionViewCellSuggestedSize.height /
							   FGStudentCardCollectionViewCellSuggestedSize.width);
	
	return CGSizeMake(availableWidthForCards,
					  availableWidthForCards * cardRatio);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
						layout:(UICollectionViewLayout*)collectionViewLayout
		insetForSectionAtIndex:(NSInteger)section
{
	return UIEdgeInsetsMake(kGapAroundElements, kGapAroundElements,
							kGapAroundElements, kGapAroundElements);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
				   layout:(UICollectionViewLayout*)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
	return kGapAroundElements;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
				   layout:(UICollectionViewLayout*)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
	return kGapAroundElements;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	FGStudentCardCollectionViewCell *cell = (FGStudentCardCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
	
	if ([self.flippedCellIndexPath isEqual:indexPath]) {
		self.flippedCellIndexPath = nil;
	} else {
		if (self.flippedCellIndexPath &&
			[collectionView.indexPathsForVisibleItems containsObject:self.flippedCellIndexPath]) {
			FGStudentCardCollectionViewCell *oldFlippedCell = (FGStudentCardCollectionViewCell *)[collectionView cellForItemAtIndexPath:self.flippedCellIndexPath];
			if (oldFlippedCell.isFlipped) {
				[oldFlippedCell flipCard:YES];
			}
		}
		
		self.flippedCellIndexPath = indexPath;
	}
	
	[cell flipCard:YES];
}

@end
