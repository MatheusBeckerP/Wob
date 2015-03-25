//
//  ListDetailViewController.m
//  Checklist
//
//  Created by Matheus Becker on 15/02/15.
//  Copyright (c) 2015 Matheus Becker. All rights reserved.
//

#import "ListDetailViewController.h"
#import "Checklist.h"

@interface ListDetailViewController ()

@end

@implementation ListDetailViewController
{
    NSString *_iconName;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        _iconName = @"No Icon";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.checklistToEdit != nil) {
        
        [[NSBundle mainBundle] preferredLocalizations] ;
        NSString *language = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
        NSLog(@"%@", language);
        if ([language  isEqual: @"pt"]) {
            self.title = @"Editar Lista";
        }else if ([language isEqual:@"es"]){
            self.title = @"Editar Lista";
        }else{
            self.title = @"Edit List";
        }
        self.textField.text = self.checklistToEdit.name;
        self.doneBarButton.enabled = YES;
        _iconName = self.checklistToEdit.iconName;
    }
    
    self.iconImageView.image = [UIImage imageNamed:_iconName];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel
{
    [self.delegate listDetailViewControllerDidCancel:self];
}

- (IBAction)done
{
    if (self.checklistToEdit == nil) {
        Checklist *checklist = [[Checklist alloc] init];
        checklist.name = self.textField.text;
        checklist.iconName = _iconName;
        
        [self.delegate listDetailViewController:self didFinishAddingChecklist:checklist];
        
    } else {
        self.checklistToEdit.name = self.textField.text;
        self.checklistToEdit.iconName = _iconName;
        
        [self.delegate listDetailViewController:self didFinishEditingChecklist:self.checklistToEdit];
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        return indexPath;
    } else {
        return nil;
    }
}

- (BOOL)textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newText = [theTextField.text stringByReplacingCharactersInRange:range withString:string];
    self.doneBarButton.enabled = ([newText length] > 0);
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PickIcon"]) {
        IconPickerViewController *controller = segue.destinationViewController;
        controller.delegate = self;
    }
}

- (void)iconPicker:(IconPickerViewController *)picker didPickIcon:(NSString *)theIconName
{
    _iconName = theIconName;
    self.iconImageView.image = [UIImage imageNamed:_iconName];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end