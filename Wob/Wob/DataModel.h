//
//  DataModel.h
//  Checklist
//
//  Created by Matheus Becker on 16/02/15.
//  Copyright (c) 2015 Matheus Becker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property(nonatomic) NSMutableArray *lists;

-(void)saveChecklist;

-(NSInteger)indexOfSelectedChecklist;
-(void)setIndexOfSelectedChecklist:(NSInteger)index;
-(void)sortChecklists;
////
+ (NSInteger)nextChecklistItemId;

@end
