//
//  PageNewsViewController.m
//  HLJ_Project
//
//  Created by HLJ on 16/3/11.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "PageNewsViewController.h"
#import "NewsViewController.h"

@interface PageNewsViewController ()

@end

@implementation PageNewsViewController

- (NSArray<NSString *> *)titles {
    return @[@"最新",@"硬件",@"软件",@"手机",@"科技"];
}
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titles.count;
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    NewsViewController *newsVC = [NewsViewController new];
    newsVC.newsType = index;
    return newsVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"left" style:UIBarButtonItemStylePlain handler:^(id sender) {
        [self.sideMenuViewController presentLeftMenuViewController];
    }];
}

@end
