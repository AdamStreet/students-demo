//
//  FGSeparatedTableViewCell.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGTableViewCell.h"

@interface FGSeparatedTableViewCell : FGTableViewCell

@property (nonatomic, readonly) UIView *topSeparator;	// 0.5dp on the top
@property (nonatomic, readonly) UIView *bottomSeparator;

@end
