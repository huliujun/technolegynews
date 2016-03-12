//
//  DetailViewModel.h
//  HLJ_Project
//
//  Created by HLJ on 16/3/11.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetManager.h"

@interface DetailViewModel : NSObject
@property (nonatomic) NSInteger minId;
- (NSURL *)iconURL;
- (NSString *)title;
- (NSString *)upDateTime;
- (NSString *)viewCount;
- (NSString *)desc;
- (NSString *)editor;
- (NSString *)content;

@property (nonatomic) ListModel *model;
@property (nonatomic) NSArray *arr;

- (instancetype)initWithMinId:(NSInteger)minId;
@end
