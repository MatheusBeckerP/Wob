//
//  ChecklistItem.h
//  Checklist
//
//  Created by Matheus Becker on 07/02/15.
//  Copyright (c) 2015 Matheus Becker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChecklistItem : NSObject <NSCoding>

@property(nonatomic, copy) NSString *text;
@property(nonatomic, assign) BOOL checked;
///
@property (nonatomic, copy) NSDate *dueDate;
@property (nonatomic, assign) BOOL shouldRemind;
@property (nonatomic, assign) NSInteger itemId;

-(void)scheduleNotification;
-(void)toggleChecked;

@end
