//
//  IconPickerViewController.h
//  Checklist 2
//
//  Created by Matheus Becker on 10/03/15.
//  Copyright (c) 2015 Matheus Becker. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IconPickerViewController;

@protocol IconPickerViewControllerDelegate <NSObject>
- (void)iconPicker:(IconPickerViewController *)picker didPickIcon:(NSString *)iconName;
@end

@interface IconPickerViewController : UIViewController  <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) id <IconPickerViewControllerDelegate> delegate;

@end
