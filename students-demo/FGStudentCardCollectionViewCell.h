//
//  FGStudentCardCollectionViewCell.h
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGBaseStudentCollectionViewCell.h"

#import "FGStudentCardDetailView.h"
#import "FGStudentCardBackgroundView.h"

extern NSString * const FGStudentCardCollectionViewCellIdentifier;

extern const CGSize FGStudentCardCollectionViewCellSuggestedSize;

typedef void(^FGStudentCardCollectionViewCellButtonTapHandler)();

@interface FGStudentCardCollectionViewCell : FGBaseStudentCollectionViewCell

//@property (nonatomic, readonly) FGStudentCardDetailView *studentCardDetailView;
//@property (nonatomic, readonly) FGStudentCardBackgroundView *studentCardBackgroundView;

@property (nonatomic, copy) FGStudentCardCollectionViewCellButtonTapHandler trashButtonTapHandler;
@property (nonatomic, copy) FGStudentCardCollectionViewCellButtonTapHandler editButtonTapHandler;

@property (nonatomic, readonly, getter=isFlipped) BOOL flipped;

- (void)flipCard:(BOOL)animated;

@end
