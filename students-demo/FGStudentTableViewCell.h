//
//  FGStudentTableViewCell.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGTableViewCell.h"

@class FGStudent;

extern NSString * const FGStudentTableViewCellIdentifier;

@interface FGStudentTableViewCell : FGTableViewCell

@property (nonatomic) FGStudent *student;

@end
