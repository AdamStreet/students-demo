//
//  FGMenuItem.m
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGMenuItem.h"

@interface FGMenuItem ()

@property (nonatomic, copy) NSString *identifer;
@property (nonatomic, copy) NSString *title;

@property (nonatomic) UIImage *image;

@end


@implementation FGMenuItem

- (instancetype)initWithIdentifier:(NSString *)identifier
							 title:(NSString *)title
							 image:(UIImage *)image
{
	NSParameterAssert(identifier);
	
	self = [super init];
	if (self) {
		self.identifer = identifier;
		self.title = title;
		self.image = image;
	}
	
	return self;
}

@end
