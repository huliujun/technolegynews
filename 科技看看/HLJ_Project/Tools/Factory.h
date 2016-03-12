//
//  Factory.h
//  TRProject
//
//  Created by jiyingxin on 16/2/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory : NSObject
+ (void)addBarItemToVC:(UIViewController *)vc isLeft:(BOOL)Left name:(NSString *)name handler:(void(^)())handler;
+ (NSString *)md5:(NSString *)str ;
@end
