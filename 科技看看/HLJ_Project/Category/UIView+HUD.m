//
//  UIView+HUD.m
//  HLJ_Project
//
//  Created by HLJ on 16/2/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UIView+HUD.h"
//超时
#define kTimeOut  30
//弹出提示时长
#define kDuration  1

@implementation UIView (HUD)

//忙提示
- (void)showBusyHUD {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    [hud hide:YES afterDelay:kTimeOut];
}
//文字提示
- (void)showWarning:(NSString *)warning {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = warning;
    [hud hide:YES afterDelay:kDuration];
}
//隐藏提示
- (void)hideBusyHUD {
    [MBProgressHUD hideHUDForView:self animated:YES];
}
@end
