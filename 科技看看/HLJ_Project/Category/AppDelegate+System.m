//
//  AppDelegate+System.m
//  HLJ_Project
//
//  Created by HLJ on 16/2/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AppDelegate+System.h"

@implementation AppDelegate (System)
- (void)setupGlobalConfig {
    
    
    [UINavigationBar appearance].translucent = YES;
    
    //菊花
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    //网络状态监测
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            case AFNetworkReachabilityStatusNotReachable: {
                self.hasNet = NO;
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi: {
                self.hasNet = YES;
                break;
            }
        }
    }];
    //要手动开启监听 Monitoring:监视, 监听
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}
@end
