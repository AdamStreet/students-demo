//
//  FGAddRandomStudentTableViewCell.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGButtonedTableViewCell.h"

extern NSString * const FGAddRandomStudentTableViewCellIdentifier;

typedef NS_ENUM(NSInteger, FGAddRandomStudentTableViewCellButtonState) {
FGAddRandomStudentTableViewCellButtonStateInitial = 0,
	FGAddRandomStudentTableViewCellButtonStateLoading,
	FGAddRandomStudentTableViewCellButtonStateLoaded
};

@interface FGAddRandomStudentTableViewCell : FGButtonedTableViewCell

@property (nonatomic) FGAddRandomStudentTableViewCellButtonState buttonState;

@end
