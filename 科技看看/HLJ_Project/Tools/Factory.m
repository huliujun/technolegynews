//
//  Factory.m
//  TRProject
//
//  Created by jiyingxin on 16/2/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "Factory.h"
#import <CommonCrypto/CommonDigest.h>
@implementation Factory
+ (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+ (void)addBarItemToVC:(UIViewController *)vc isLeft:(BOOL)Left name:(NSString *)name handler:(void (^)())handler{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    btn.frame = CGRectMake(0, 0, 48, 28);
    UIImage *image = [UIImage imageNamed:name];
    [btn setImage:image forState:UIControlStateNormal];
    
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -15;


    if (Left) {
        vc.navigationItem.leftBarButtonItems = @[spaceItem,backItem];
        if (!image) {
            [btn setTitle:name forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor lightGrayColor];
            //把视图的边角变为圆形, cornerRadius圆角半径
            btn.layer.cornerRadius = 4;
        }
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
        [btn bk_addEventHandler:^(id sender) {
            handler();
        } forControlEvents:UIControlEventTouchUpInside];
    }else {
        vc.navigationItem.rightBarButtonItems = @[spaceItem,backItem];
        if (!image) {
            [btn setTitle:name forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor lightGrayColor];
            //把视图的边角变为圆形, cornerRadius圆角半径
            btn.layer.cornerRadius = 4;
        }
       [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -30)];
        [btn bk_addEventHandler:^(id sender) {
            handler();
            
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    

}
@end
