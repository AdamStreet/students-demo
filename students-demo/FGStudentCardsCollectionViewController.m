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
#import "FGAlertView.h"
#import "FGBarButtonItem.h"
#import "FGNewStudentTableViewController.h"
#import "FGNavigationController.h"
#import "FGNewStudentActionSheet.h"
#import "FGStudentFetcher.h"
#import "FGStatusBarNotification.h"

@interface FGStudentCardsCollectionViewController ()

@property (nonatomic) FGBarButtonItem *addButtonItem;

@property (nonatomic) NSIndexPath *flippedCellIndexPath;

@property (nonatomic) FGAlertView *deletionConfirmationAlertView;

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

- (void)deleteStudent:(FGStudent *)student
{
	[[self databaseManager] deleteEntity:student];
	[[self databaseManager] saveContext];
}

- (void)showDeleteConfirmationAlert:(FGStudent *)student
{
	NSAssert(!self.deletionConfirmationAlertView, @"Should exist deletionConfirmationAlertView");
	
	self.deletionConfirmationAlertView =
	[[FGAlertView alloc] initWithTitle:FGLocalizedString(@"Are you sure?", @"Student deletion confirmation alert title")
							   message:FGLocalizedString(@"This action cannot be undone.", @"Student deletion confirmation alert message")
					 cancelButtonTitle:FGLocalizedString(@"Cancel", @"Cancel button title")
					 otherButtonTitles:@[FGLocalizedString(@"Delete", @"Delete button title")]
							completion:^(NSInteger tappedButtonIndex, NSInteger cancelButtonIndex) {
								self.deletionConfirmationAlertView = nil;
								
								if (tappedButtonIndex == cancelButtonIndex)
									return;
								
								[self deleteStudent:student];
							}];
	
	[self.deletionConfirmationAlertView show];
}

- (void)scrollToStudent:(FGStudent *)student
{
	if (!student)
		return;
	
	[self.collectionView scrollToItemAtIndexPath:[self.fetchedResultsController indexPathForObject:student]
								atScrollPosition:UICollectionViewScrollPositionCenteredVertically
										animated:YES];
}

- (void)showAddStudentViewController
{
	FGNewStudentTableViewController *newStudentTableViewController = [[FGNewStudentTableViewController alloc] initWithNewStudent];
	
	// Wrap in NavigationController
	FGNavigationController *navigationController = [[FGNavigationController alloc] initWithRootViewController:newStudentTableViewController];
	navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
	
	newStudentTableViewController.cancellationHandler = ^(__kindof UIViewController *presentingViewController){
		[navigationController.presentingViewController dismissViewControllerAnimated:YES
																		  completion:nil];
	};
	newStudentTableViewController.completionHandler = ^(FGStudent *student) {
		[navigationController.presentingViewController dismissViewControllerAnimated:YES
																		  completion:nil];
		
		[self scrollToStudent:student];
	};
	
	[self presentViewController:navigationController
					   animated:YES
					 completion:nil];
}

- (void)addRandomStudent
{
	[FGStatusBarNotification showWithTitle:FGLocalizedString(@"Loading Random Student...", @"StatusBar label title")];
	__block FGButtonTapHandler tapHandler = nil;
	
	[FGStudentFetcher fetchAndInsertRandomStudent:^(FGStudent *student, NSError *error) {
		NSString *statusTitle = nil;
		if (error) {
			statusTitle = [error localizedDescription];
		} else {
			statusTitle = [NSString stringWithFormat:@"%@ %@",
						   FGLocalizedString(@"Added Random Student:", @"Student added status bar title prefix"),
						   [student fullName]];
			tapHandler = ^{
				[self scrollToStudent:student];
			};
		}
		
		[FGStatusBarNotification setTitle:statusTitle
		 tapHandler:tapHandler];
		
		[FGStatusBarNotification dismissAfterDelay:3.5];
	}];
}

#pragma mark Accessors

- (FGBarButtonItem *)addButtonItem
{
	if (!_addButtonItem) {
		_addButtonItem = [[FGBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
																	   target:self
																	   action:@selector(addBarButtonTapped:)];
	}
	
	return _addButtonItem;
}

#pragma mark - View lifecycle

- (UINavigationItem *)navigationItem
{
	UINavigationItem *navigationItem = [super navigationItem];
	
	navigationItem.rightBarButtonItem = self.addButtonItem;
	
	return navigationItem;
}

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
		FGStudent *student = [self studentAtIndexPath:indexPath];
		
		FGStudentCardCollectionViewCell *castedCell = (FGStudentCardCollectionViewCell *)cell;
		castedCell.student = student;
		__weak FGStudentCardsCollectionViewController *weakSelf = self;
		castedCell.trashButtonTapHandler = ^{
			[weakSelf showDeleteConfirmationAlert:student];
		};
		
		const BOOL invalidState = ( ([indexPath isEqual:self.flippedCellIndexPath] && !castedCell.isFlipped) ||
								   (![indexPath isEqual:self.flippedCellIndexPath] && castedCell.isFlipped));
		if (invalidState) {
			[cell flipCard:NO];
		}
	} else {
		NSAssert1(NO, @"Unknown cell: %@", cell);
	}
}

#pragma mark - User interaction handlers

- (void)addBarButtonTapped:(id)sender
{
	UIAlertController *actionSheet =
	[FGNewStudentActionSheet newStudentActionSheetAlertController:^(FGNewStudentActionSheetAction action) {
		if (action == FGNewStudentActionSheetActionCancel)
			return;
		
		if (action == FGNewStudentActionSheetActionAddCustomStudent) {
			[self showAddStudentViewController];
			
			return;
		}
		
		if (action == FGNewStudentActionSheetActionAddRandomStudent) {
			[self addRandomStudent];
			
			return;
		}
	}];
	[self presentViewController:actionSheet
					   animated:YES
					 completion:nil];
}

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
	
	const BOOL isJustAFlipBack = [self.flippedCellIndexPath isEqual:indexPath];
	if (isJustAFlipBack) {
		self.flippedCellIndexPath = nil;
	} else {
		const BOOL isPreviouslyFlippedCellVisible = (self.flippedCellIndexPath &&
													 [collectionView.indexPathsForVisibleItems containsObject:self.flippedCellIndexPath]);
		if (isPreviouslyFlippedCellVisible) {
			FGStudentCardCollectionViewCell *currentlyFlippedCell = (FGStudentCardCollectionViewCell *)[collectionView cellForItemAtIndexPath:self.flippedCellIndexPath];
			if (currentlyFlippedCell.isFlipped) {
				[currentlyFlippedCell flipCard:YES];
			}
		}
		
		self.flippedCellIndexPath = indexPath;
	}
	
	[cell flipCard:YES];
}

@end
