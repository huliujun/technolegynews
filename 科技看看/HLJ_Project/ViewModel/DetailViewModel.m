//
//  DetailViewModel.m
//  HLJ_Project
//
//  Created by HLJ on 16/3/11.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "DetailViewModel.h"

@implementation DetailViewModel
- (instancetype)initWithMinId:(NSInteger)minId {
    if (self = [super init]) {
        self.minId = minId;
    }
    return self;
}

- (ListModel *)modelFor {
    return self.arr.firstObject;
}
- (NSString *)content {
    return [self modelFor].content;
}

- (NSURL *)iconURL {
    return [NSURL URLWithString:[self modelFor].icon];
}
- (NSString *)title {
    return [self modelFor].title ;
}
- (NSString *)upDateTime {
    return [self modelFor].postdate;
}
- (NSString *)viewCount {
    return [NSString stringWithFormat:@"%ld", [self modelFor].reviewcount];
}
- (NSString *)desc {
    return [self modelFor].desc;
}
- (NSString *)editor {
    return [self modelFor].editor;
}


- (void)getDataWithRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    [NetManager getDetailWithminId:self.minId completionHandler:^(NSArray* model, NSError *error) {
        self.arr = model;
        completionHandler(error);
    }];
}

@end
