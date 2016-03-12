//
//  NSObject+AFNetworking.h
//  HLJ_Project
//
//  Created by HLJ on 16/2/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义一个block类型
typedef void(^completionHandlerBlock)(id model, NSError *error);

@interface NSObject (AFNetworking)
+ (id)GET:(NSString *)path parameters:(id)parameters progresss:(void(^)(NSProgress *downloadProgress))downloadProgress completionHandler:(completionHandlerBlock)block;
+ (id)POST:(NSString *)path parameters:(id)parameters progresss:(void(^)(NSProgress *downloadProgress))downloadProgress completionHandler:(completionHandlerBlock)block;

@end
