//
//  FGTableViewController.h
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGViewController.h"

#import "FGTableView.h"

@interface FGTableViewController : FGViewController

@property (nonatomic, readonly) UITableViewStyle tableViewStyle;
@property (nonatomic, readonly) FGTableView *tableView;

- (instancetype)initWithStyle:(UITableViewStyle)tableViewStyle NS_DESIGNATED_INITIALIZER;

@end
