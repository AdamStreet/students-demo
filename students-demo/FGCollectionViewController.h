//
//  FGCollectionViewController.h
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGViewController.h"

#import "FGCollectionView.h"

@interface FGCollectionViewController : FGViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, readonly) UICollectionViewLayout *collectionViewLayout;
@property (nonatomic, readonly) FGCollectionView *collectionView;

- (instancetype)initWithCollectionFlowLayout;

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout;

@end
