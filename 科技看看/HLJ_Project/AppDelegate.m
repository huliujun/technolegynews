//
//  AppDelegate.m
//  HLJ_Project
//
//  Created by HLJ on 16/2/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+System.h"
#import "NetManager.h"
#import "HomeViewController.h"
#import "LeftMenuViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
- (UIWindow *)window {
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.backgroundColor = [UIColor whiteColor];
        [_window makeKeyAndVisible];
    }
    return _window;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
//    [NetManager getDetailWithminId:473472 completionHandler:^(id model, NSError *error) {
//        
//    }];
    
    
    
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:[HomeViewController new]];
    LeftMenuViewController *leftMenu = [LeftMenuViewController new];
    RESideMenu *sideMenuVC = [[RESideMenu alloc] initWithContentViewController:navi leftMenuViewController:leftMenu rightMenuViewController:nil];
    sideMenuVC.animationDuration = .1;
    sideMenuVC.backgroundImage = [UIImage imageNamed:@"Stars"];
    sideMenuVC.menuPreferredStatusBarStyle = 1;
    sideMenuVC.delegate = self;
    sideMenuVC.contentViewShadowColor = [UIColor blackColor];
    sideMenuVC.contentViewShadowOffset = CGSizeMake(0, 0);
    sideMenuVC.contentViewShadowRadius = 1;
    sideMenuVC.contentViewShadowEnabled = YES;
    self.window.rootViewController = sideMenuVC;
    
    
    
    //全局默认配置
    [self setupGlobalConfig];
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    return YES;
}



@end
