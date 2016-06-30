//
//  FGMenuItem.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FGMenuItem : NSObject

@property (nonatomic, readonly, copy) NSString *identifer;
@property (nonatomic, readonly, copy) NSString *title;

@property (nonatomic, readonly) UIImage *image;

- (instancetype)initWithIdentifier:(NSString *)identifier
							 title:(NSString *)title
							 image:(UIImage *)image;

@end
