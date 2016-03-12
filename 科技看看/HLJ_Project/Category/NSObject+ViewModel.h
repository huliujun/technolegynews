//
//  NSObject+ViewModel.h
//  HLJ_Project
//
//  Created by HLJ on 16/2/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, RequestMode) {
    Refresh ,
    More ,
};

@interface NSObject (ViewModel)
- (void)getDataWithRequestMode:(RequestMode)requestMode completionHandler:(void(^)(NSError *error))completionHandler;
/** 用于保存当前网络请求任务 */
@property (nonatomic) NSURLSessionDataTask *dataTask;
- (void)cancelTask; //取消任务
- (void)suspendTask; //暂停任务
- (void)resumeTask; //继续任务
@end
