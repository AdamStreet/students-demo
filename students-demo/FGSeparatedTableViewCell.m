//
//  FGSeparatedTableViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGSeparatedTableViewCell.h"

#import "UIColor+CustomColors.h"

@interface FGSeparatedTableViewCell ()

@property (nonatomic) UIView *topSeparator;
@property (nonatomic) UIView *bottomSeparator;

@end

static const CGFloat kDefaultSeparatorHeight = 0.5;

@implementation FGSeparatedTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		UIView *topSeparator = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0,
																		self.frame.size.width, kDefaultSeparatorHeight)];
		topSeparator.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin);
		topSeparator.backgroundColor = [UIColor separatorColor];
		[self addSubview:topSeparator];
		self.topSeparator = topSeparator;
		
		UIView *bottomSeparator = [[UIView alloc] initWithFrame:CGRectMake(0.0, self.frame.size.height - kDefaultSeparatorHeight,
																		   self.frame.size.width, kDefaultSeparatorHeight)];
		bottomSeparator.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin);
		bottomSeparator.backgroundColor = [UIColor separatorColor];
		[self addSubview:bottomSeparator];
		self.bottomSeparator = bottomSeparator;
	}
	return self;
}

@end
