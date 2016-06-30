//
//  FGMainMenuTableViewDataSource.h
//  students-demo
//
//  Created by Adam Szabo on 30/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FGMenuItem.h"

@interface FGMainMenuTableViewDataSource : NSObject <UITableViewDataSource>

- (FGMenuItem *)menuItemAtIndexPath:(NSIndexPath *)indexPath;

@end
