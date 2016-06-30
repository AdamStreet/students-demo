//
//  FGMainMenuTableViewCell.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGTableViewCell.h"

@class FGMenuItem;

extern NSString * const FGMainMenuTableViewCellIdentifier;

@interface FGMainMenuTableViewCell : FGTableViewCell

@property (nonatomic) FGMenuItem *menuItem;

@end
