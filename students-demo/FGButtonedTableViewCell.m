//
//  FGButtonStyleTableViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGButtonedTableViewCell.h"

#import "FGButton.h"

@interface FGButtonedTableViewCell ()

@property (nonatomic) FGButton *button;

@end

@implementation FGButtonedTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		UIView *contentView = [self contentView];
		FGButton *button = [[FGButton alloc] initWithFrame:contentView.bounds];
		button.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
		[contentView addSubview:button];
		self.button = button;
	}
	
	return self;
}

@end
