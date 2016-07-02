//
//  FGStudentAvatarTableViewCell.h
//  students-demo
//
//  Created by Adam Szabo on 01/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGAvatarTableViewCell.h"

#import "FGStudent.h"

extern NSString * const FGStudentAvatarTableViewCellIdentifier;

@interface FGStudentAvatarTableViewCell : FGAvatarTableViewCell

@property (nonatomic) FGStudent *student;

@end
