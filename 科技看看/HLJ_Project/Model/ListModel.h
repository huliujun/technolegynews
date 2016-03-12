//
//  ListModel.h
//  HLJ_Project
//
//  Created by HLJ on 16/3/10.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseModel.h"

@interface ListModel : baseModel

@property (nonatomic, copy) NSString *editor;
@property (nonatomic, copy) NSString *ispass;
@property (nonatomic, copy) NSString *postdate;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) NSInteger reviewcount;
@property (nonatomic, copy) NSString *stress;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *isdel;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *icon;

@end
