//
//  FGCollectionViewController.m
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGCollectionViewController.h"

@interface FGCollectionViewController ()

@property (nonatomic) UICollectionViewLayout *collectionViewLayout;
@property (nonatomic) FGCollectionView *collectionView;

@end


@implementation FGCollectionViewController

#pragma mark - Initialization

- (instancetype)initWithCollectionFlowLayout
{
	UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
	self = [self initWithCollectionViewLayout:flowLayout];
//	if (self) {
//	}
	
	return self;
}

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
	self = [super initWithNibName:nil bundle:nil];
	if (self) {
		self.collectionViewLayout = layout;
	}
	
	return self;
}

#pragma mark - Private methods
#pragma mark Accessors
#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIView *contentView = self.view;
	
	FGCollectionView *collectionView = self.collectionView;
	collectionView.frame = contentView.bounds;
	collectionView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	[contentView addSubview:collectionView];
}

#pragma mark - Public methods
#pragma mark Accessors

- (FGCollectionView *)collectionView
{
	if (!_collectionView) {
		_collectionView = [[FGCollectionView alloc] initWithFrame:CGRectZero
											 collectionViewLayout:self.collectionViewLayout];
		_collectionView.dataSource = self;
		_collectionView.delegate = self;
	}
	
	return _collectionView;
}

#pragma mark Overrides
#pragma mark - User interaction handlers
#pragma mark - Notification handlers
#pragma mark - KVO
#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	return nil;
}

#pragma mark - <UICollectionViewDelegate>

@end
