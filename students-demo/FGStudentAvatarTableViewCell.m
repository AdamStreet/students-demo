//
//  FGStudentAvatarTableViewCell.m
//  students-demo
//
//  Created by Adam Szabo on 01/07/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGStudentAvatarTableViewCell.h"

#import "FGAvatarImageFile.h"
#import "FGAvatarImageView.h"

NSString * const FGStudentAvatarTableViewCellIdentifier = @"FGStudentAvatarTableViewCell";

@implementation FGStudentAvatarTableViewCell

#pragma mark - Initialization

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
	}
	
	return self;
}

#pragma mark - Private methods

- (void)updateAvatarImage
{
	NSURL *imageURL = [self.student avatarImageURL];
	if ([imageURL isFileURL]) {
		self.avatarImageView.imageView.image = [UIImage imageWithContentsOfFile:[imageURL path]];
	} else {
		[self.avatarImageView setImageURL:self.student.avatarImageURL
							   completion:^(NSError *error) {
								   if (error) {
									   // TODO Show error image
								   }
							   }];
	}
}

#pragma mark - Public methods

#pragma mark Accessors

- (void)setStudent:(FGStudent *)student
{
	_student = student;
	
	[self updateAvatarImage];
}

@end
