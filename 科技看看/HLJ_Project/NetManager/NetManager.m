//
//  NetManager.m
//  HLJ_Project
//
//  Created by HLJ on 16/3/10.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager
+ (id)getListWithNewType:(NewsType)newType minId:(NSInteger)MinId completionHandler:(completionHandlerBlock)completionHandler {
    
    NSString *path = @"http://m.mydrivers.com/app/newslist.aspx";
    NSMutableDictionary *param = [NSMutableDictionary new];
    [param setObject:@"2.2" forKey:@"ver"];
    [param setObject:@(MinId) forKey:@"minId"];
    [param setObject:@"0" forKey:@"maxId"];
    switch (newType) {
        case lastType:{
            [param setObject:@"0" forKey:@"tid"];
            break;
        }
        case DriveType:{
            [param setObject:@"1" forKey:@"tid"];
            break;
        }
        case SoftType:{
            [param setObject:@"2" forKey:@"tid"];
            break;
        }
        case PhoneType:{
            [param setObject:@"3" forKey:@"tid"];
            break;
        }
        case TechType:{
            [param setObject:@"4" forKey:@"tid"];
            break;
        }
        default:
            break;
    }
    return [self GET:path parameters:param progresss:nil completionHandler:^(id model, NSError *error) {
        completionHandler([ListModel hlj_parse:model], error);
    }];
}

+ (id)getDetailWithminId:(NSInteger)MinId completionHandler:(completionHandlerBlock)completionHandler {
    NSString *path = @"http://m.mydrivers.com/app/newsdetail.aspx";
    NSString *da = [NSString stringWithFormat:@"http://m.mydrivers.com/app/newsdetail.aspx?id=%ld", MinId];
    NSMutableArray *param = [NSMutableArray new];
    [param setValue:@(MinId) forKey:@"id"];
    return [self GET:da parameters:nil progresss:nil completionHandler:^(id model, NSError *error) {
        completionHandler([ListModel hlj_parse:model], error);
    }];
}


















@end
