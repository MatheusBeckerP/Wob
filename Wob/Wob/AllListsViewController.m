//
//  AllListsViewController.m
//  Checklist
//
//  Created by Matheus Becker on 15/02/15.
//  Copyright (c) 2015 Matheus Becker. All rights reserved.
//

#import "AllListsViewController.h"
#import "Checklist.h"
#import "ChecklistViewController.h"
#import "ChecklistItem.h"
#import "DataModel.h"

@interface AllListsViewController ()

@end

@implementation AllListsViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

//    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:10];
//    
 //   UILocalNotification *localNotification = [[UILocalNotification alloc] init];
//    
//    localNotification.fireDate = date;
//    localNotification.timeZone = [NSTimeZone defaultTimeZone];
//    localNotification.alertBody = @"I am a local notification!";
//    localNotification.soundName = UILocalNotificationDefaultSoundName;
//    
//    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    

    //imagem Top Bar
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    imgView.image = [UIImage imageNamed:@"Wob"];
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.navigationItem.titleView = imgView;
    
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}





#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataModel.lists count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    Checklist *checklist = self.dataModel.lists[indexPath.row];
    cell.textLabel.text = checklist.name;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    
    int count = [checklist countUncheckdItems];
    if ([checklist.items count]==0) {
        cell.detailTextLabel.text = NSLocalizedString(@"(No Items)", nil);
    } else if(count == 0) {
        cell.detailTextLabel.text = NSLocalizedString(@"All Done!", nil);
    }else{
        
        cell.detailTextLabel.text = [NSString stringWithFormat:
                                     NSLocalizedString(@"%d Remaining", nil), count];
        
        [[NSBundle mainBundle] preferredLocalizations] ;
        NSString *language = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
        NSLog(@"%@", language);
        if ([language  isEqual: @"pt"] && count == 1) {
            cell.detailTextLabel.text = [NSString stringWithFormat:
                                         NSLocalizedString(@"%d Item a Fazer", nil), count];
        }else if ([language  isEqual: @"pt"] && count > 1){
            cell.detailTextLabel.text = [NSString stringWithFormat:
                                         NSLocalizedString(@"%d Itens a Fazer", nil), count];
        }
    }
    
    [[UITableViewCell appearance] setTintColor:[UIColor orangeColor]];
    
    cell.imageView.image = [UIImage imageNamed:checklist.iconName];
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Checklist *checklist = self.dataModel.lists[indexPath.row];
    
    [self performSegueWithIdentifier:@"ShowChecklist" sender:checklist];
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.dataModel.lists removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowChecklist"]) {
        ChecklistViewController *controller = segue.destinationViewController;
        controller.checklist = sender;
    } else if ([segue.identifier isEqualToString:@"AddChecklist"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        ListDetailViewController *controller = (ListDetailViewController *)navigationController.topViewController;
        controller.delegate = self;
        controller.checklistToEdit = nil;
    }
}



- (void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)listDetailViewController:(ListDetailViewController *)controller didFinishAddingChecklist:(Checklist *)checklist
{
    [self.dataModel.lists addObject:checklist];
    [self.dataModel sortChecklists];
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)listDetailViewController:(ListDetailViewController *)controller didFinishEditingChecklist:(Checklist *)checklist
{
    [self.dataModel sortChecklists];
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"ListNavigationController"];
    ListDetailViewController *controller = (ListDetailViewController *)navigationController.topViewController;
    controller.delegate = self;
    Checklist *checklist = self.dataModel.lists[indexPath.row];
    controller.checklistToEdit = checklist;
    [self presentViewController:navigationController animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

@end
