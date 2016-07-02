//
//  FGButtonStyleTableViewCell.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGTransparentTableViewCell.h"

#import "FGButton.h"

@interface FGButtonedTableViewCell : FGTransparentTableViewCell

@property (nonatomic, readonly) FGButton *button;

@end
