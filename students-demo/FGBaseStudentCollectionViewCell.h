//
//  FGBaseStudentCollectionViewCell.h
//  students-demo
//
//  Created by Adam Szabo on 02/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGCollectionViewCell.h"

#import "FGStudent.h"

@interface FGBaseStudentCollectionViewCell : FGCollectionViewCell

@property (nonatomic) FGStudent *student;

@end
