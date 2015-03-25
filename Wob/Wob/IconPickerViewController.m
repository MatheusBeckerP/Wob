//
//  IconPickerViewController.m
//  Checklist 2
//
//  Created by Matheus Becker on 10/03/15.
//  Copyright (c) 2015 Matheus Becker. All rights reserved.
//

#import "IconPickerViewController.h"

@interface IconPickerViewController ()

@end

@implementation IconPickerViewController
{
    NSArray *_icons;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Choose Icon", nil);

    
    _icons = @[@"Default", @"Snack", @"Basketball", @"Study",@"List", @"Meeting", @"Professional activity", @"City", @"Academic activity", @"Cooking", @"Delivery", @"Dog", @"Bodybuilder", @"Competition", @"Football", @"Drink", @"Cat", @"Head", @"House", @"Mail", @"Make", @"Shopping", @"Money" , @"Bike", @"Running", @"Presentation", @"Program", @"Women shopping", @"Market", @"Soccer", @"Women's shoe", @"Coffee", @"Tie", @"Trekking", @"Volleyball", @"List"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Collection View Methds
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_icons count];
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    UIImageView *imagem = (UIImageView *)[cell viewWithTag:100];
    NSString *icon = _icons [indexPath.row];
   // iconString = [_icons objectAtIndex:indexPath.row];
   // imagem = iconString;
    
    [cell.layer setBorderWidth:2.0f];
    [cell.layer setBorderColor:[UIColor orangeColor].CGColor];
    [cell.layer setCornerRadius:50.0f];
    
    
    
    //NSString *icon = _icons[indexPath.row];
    //cell.textLabel.text = icon;
    imagem.image = [UIImage imageNamed:icon];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *iconName = _icons[indexPath.row];
    [self.delegate iconPicker:self didPickIcon:iconName];
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSString *iconName = _icons[indexPath.row];
//    [self.delegate iconPicker:self didPickIcon:iconName];
//}

@end
