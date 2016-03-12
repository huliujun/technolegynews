//
//  NSObject+AFNetworking.m
//  HLJ_Project
//
//  Created by HLJ on 16/2/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NSObject+AFNetworking.h"
#import "AppDelegate.h"

@implementation NSObject (AFNetworking)

+ (id)GET:(NSString *)path parameters:(id)parameters progresss:(void (^)(NSProgress *))downloadProgress completionHandler:(completionHandlerBlock)block {

//    if (kAppdelegate.isHasNet == NO) {
//        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kAppdelegate.window animated:YES];
//        /**
//         * Progress is shown using an UIActivityIndicatorView. This is the default.
//         MBProgressHUDModeIndeterminate,小圆圈
//         * Progress is shown using a round, pie-chart like, progress view.
//         MBProgressHUDModeDeterminate,白色小圆圈
//         * Progress is shown using a horizontal progress bar
//         MBProgressHUDModeDeterminateHorizontalBar,长方形圆圈
//         * Progress is shown using a ring-shaped progress view.
//         MBProgressHUDModeAnnularDeterminate,
//         * Shows a custom view
//         MBProgressHUDModeCustomView,
//         * Shows only labels
//         MBProgressHUDModeText
//         */
//        hud.mode = 4;
//        
//        hud.labelText = @"没有网哦";
//        [hud hide:YES afterDelay:2];
//        
//        NSError *err = [NSError errorWithDomain:path code:1234 userInfo:@{NSLocalizedDescriptionKey:@"无网络"}];
//        block(nil, err);
//        return nil;
//    }
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/html", @"text/plain", @"text/json", @"text/javascript", @"application/json"]];
    manager.requestSerializer.timeoutInterval = 30;
    return [manager GET:path parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil, error);
        NSLog(@"URLSessionDataTaskerror:%@", error);
    }];
}
+ (id)POST:(NSString *)path parameters:(id)parameters progresss:(void (^)(NSProgress *))downloadProgress completionHandler:(completionHandlerBlock)block {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/html", @"text/plain", @"text/json", @"text/javascript", @"application/json"]];
    manager.requestSerializer.timeoutInterval = 30;
    return [manager GET:path parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil, error);
        NSLog(@"URLSessionDataTaskerror:%@", error);
    }];
}

@end
