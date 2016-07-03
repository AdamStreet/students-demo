//
//  FGRootViewController.h
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGViewController.h"

@class FGNavigationController;
@class FGStudentCardsCollectionViewController;

@interface FGRootViewController : FGViewController

@property (nonatomic, readonly) FGNavigationController *navigationController;
@property (nonatomic, readonly) FGStudentCardsCollectionViewController *studentListViewController;

@end
