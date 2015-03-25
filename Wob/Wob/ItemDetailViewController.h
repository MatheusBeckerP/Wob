//
//  AddItemViewController.h
//  Checklist
//
//  Created by Matheus Becker on 07/02/15.
//  Copyright (c) 2015 Matheus Becker. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemDetailViewController;
@class ChecklistItem;

@protocol ItemDetailViewControllerDelegate <NSObject>

- (void)itemDetailViewControllerDidCancel:(ItemDetailViewController *)controller;

- (void)itemDetailViewController:(ItemDetailViewController *)controller didFinishAddingItem:(ChecklistItem *)item;

- (void)itemDetailViewController:(ItemDetailViewController *)controller didFinishEditingItem:(ChecklistItem *)item;

@end

@interface ItemDetailViewController : UITableViewController<UITextFieldDelegate>

-(IBAction)cancel;
-(IBAction)done;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

@property (weak, nonatomic) id <ItemDetailViewControllerDelegate> delegate;
@property (nonatomic) ChecklistItem *itemToEdit;

@property (nonatomic, weak) IBOutlet UISwitch *switchControl;
@property (nonatomic, weak) IBOutlet UILabel *dueDateLabel;


@end
