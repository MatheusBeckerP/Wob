//
//  ViewController.h
//  Checklist
//
//  Created by Matheus Becker on 06/02/15.
//  Copyright (c) 2015 Matheus Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"

@class Checklist;

@interface ChecklistViewController : UITableViewController<ItemDetailViewControllerDelegate>

@property (nonatomic) Checklist *checklist;

@end

