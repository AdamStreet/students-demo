//
//  FGTextFieldTableViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGTextFieldTableViewCell.h"

NSString * const FGTextFieldTableViewCellIdentifier = @"FGTextFieldTableViewCell";

@interface FGTextFieldTableViewCell ()

@property (nonatomic) FGLabel *prefixLabel;
@property (nonatomic) FGTextField *textField;

@end

static const CGFloat kPrefixLabelWidth = 50.0;

@implementation FGTextFieldTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		UIView *contentView = self.contentView;
		
		FGLabel *label = [[FGLabel alloc] initWithFrame:CGRectZero];
		[contentView addSubview:label];
		self.prefixLabel = label;
		
		FGTextField *textField = [[FGTextField alloc] initWithFrame:CGRectZero];
		[contentView addSubview:textField];
		self.textField = textField;
		
		label.translatesAutoresizingMaskIntoConstraints = NO;
		textField.translatesAutoresizingMaskIntoConstraints = NO;
		
		[self setNeedsUpdateConstraints];
	}
	
	return self;
}

- (void)setupInitialConstraints
{
	[super setupInitialConstraints];
	
	UIView *contentView = self.contentView;
	UIView *prefixLabel = self.prefixLabel;
	UIView *textField = self.textField;
	
	NSDictionary *subviews = NSDictionaryOfVariableBindings(prefixLabel, textField);
	
	[contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[prefixLabel(labelWidth)]-[textField]-|"
																		options:kNilOptions
																		metrics:@{@"labelWidth" : @(kPrefixLabelWidth)}
																		  views:subviews]];
	[contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[prefixLabel]|"
																		options:kNilOptions
																		metrics:nil
																		  views:subviews]];
	[contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[textField]|"
																		options:kNilOptions
																		metrics:nil
																		  views:subviews]];
}

@end
