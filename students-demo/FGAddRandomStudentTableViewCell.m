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
		self.topSeparator.hidden = YES;
		
		[self updateLabel];
	}
	
	return self;
}

#pragma mark - Private methods

- (void)updateLabel
{
	switch (self.buttonState) {
  case FGAddRandomStudentTableViewCellButtonStateInitial:
			[self.button setTitle:FGLocalizedString(@"Get Random Student", @"Random user fetch button title")
						 forState:UIControlStateNormal];
			break;
		case FGAddRandomStudentTableViewCellButtonStateLoading:
			[self.button setTitle:FGLocalizedString(@"Loading Random Student...", @"Random user fetch button title")
						 forState:UIControlStateNormal];
			break;
		case FGAddRandomStudentTableViewCellButtonStateLoaded:
			[self.button setTitle:FGLocalizedString(@"Get New Random Student", @"Random user fetch button title")
						 forState:UIControlStateNormal];
			break;
			
  default:
			break;
	}
}

#pragma mark - Public methods

#pragma mark Accessors

- (void)setButtonState:(FGAddRandomStudentTableViewCellButtonState)buttonState
{
	_buttonState = buttonState;
	
	[self updateLabel];
}

@end
