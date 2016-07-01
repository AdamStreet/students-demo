//
//  FGTextFieldTableViewCell.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGSeparatedTableViewCell.h"

#import "FGLabel.h"
#import "FGTextField.h"

extern NSString * const FGTextFieldTableViewCellIdentifier;

@interface FGTextFieldTableViewCell : FGSeparatedTableViewCell

@property (nonatomic, readonly) FGLabel *prefixLabel;
@property (nonatomic, readonly) FGTextField *textField;

@end
