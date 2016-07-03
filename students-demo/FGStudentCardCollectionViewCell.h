//
//  FGStudentCardCollectionViewCell.h
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGBaseStudentCollectionViewCell.h"

#import "FGStudentCardDetailView.h"

extern NSString * const FGStudentCardCollectionViewCellIdentifier;

extern const CGSize FGStudentCardCollectionViewCellSuggestedSize;

@interface FGStudentCardCollectionViewCell : FGBaseStudentCollectionViewCell

@property (nonatomic, readonly) FGStudentCardDetailView *studentCardDetailView;

@property (nonatomic, readonly, getter=isFlipped) BOOL flipped;

- (void)flipCard:(BOOL)animated;

@end
