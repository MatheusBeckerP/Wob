//
//  Checklist.h
//  Checklist
//
//  Created by Matheus Becker on 15/02/15.
//  Copyright (c) 2015 Matheus Becker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject <NSCoding>

@property(nonatomic, copy) NSString *name;
@property(nonatomic) NSMutableArray *items;

@property (nonatomic, copy) NSString *iconName;

-(int)countUncheckdItems;


@end
