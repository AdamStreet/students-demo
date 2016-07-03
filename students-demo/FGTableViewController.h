//
//  FGTableViewController.h
//  students-demo
//
//  Created by Adam Szabo on 29/06/2016.
//  Copyright © 2016 Adam Szabo. All rights reserved.
//

#import "FGViewController.h"

#import "FGTableView.h"

@interface FGTableViewController : FGViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, readonly) UITableViewStyle tableViewStyle;
@property (nonatomic, readonly) FGTableView *tableView;

/**
 YES by default.
 */
@property (nonatomic) BOOL deselectTableViewRowOnDidAppear;
/**
 YES by default.
 */
@property (nonatomic) BOOL resizeTableViewOnKeyboardAppear;

- (instancetype)initWithStyle:(UITableViewStyle)tableViewStyle;

@end
