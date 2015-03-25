//
//  AllListsViewController.h
//  Checklist
//
//  Created by Matheus Becker on 15/02/15.
//  Copyright (c) 2015 Matheus Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDetailViewController.h"

@class DataModel;

@interface AllListsViewController : UITableViewController <ListDetailViewControllerDelegate>

@property (nonatomic, strong) DataModel *dataModel;

@end
