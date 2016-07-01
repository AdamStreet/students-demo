//
//  FGAddRandomStudentTableViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGAddRandomStudentTableViewCell.h"

#import "FGLocalization.h"

NSString * const FGAddRandomStudentTableViewCellIdentifier = @"FGAddRandomStudentTableViewCell";

@implementation FGAddRandomStudentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		self.textLabel.text = FGLocalizedString(@"Get Random Student", @"Random user fetch button title");
		
		self.topSeparator.hidden = YES;
	}
	
	return self;
}

@end
