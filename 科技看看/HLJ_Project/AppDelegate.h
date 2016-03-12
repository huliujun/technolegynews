//
//  AppDelegate.h
//  HLJ_Project
//
//  Created by HLJ on 16/2/21.
//  Copyright © 2016年 tarena. All rights reserved.
//
/**
 关于工程目录架构
 1.ViewController 视图控制器, 即继承于UIViewController的
 2.View 视图, 即继承于UIView的
 3.Model 数据模型, 放解析类等
 4.define 放.h头文件, 头文件用于存放宏定义
 5.Resource 图片, 音频, 视频等等资源
 6.ViewModel 视图模型文件
 7.NetManager 网络请求管理类
 8.Category 类别, 为其他类增加功能的类
 9.Vendor 第三方类库, 通常是Cocoapoda无法引入的那些, 如第三方分享登录, 百度地图, 及时通讯等
 10.Supporting Files 放info.plist, pch文件
 */

/**
 搭建流程
 1.创建工程
 2.使用Cocoapods引入第三方框架, 工程被改为workspace模式
 3.创建工程目录
 4.创建pch文件, 进行相关配置
 5.创建constants.h文件, 存放常用宏定义
 6.创建Category文件
 */

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, RESideMenuDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, getter=isHasNet) BOOL hasNet;
@property (nonatomic) AFNetworkReachabilityStatus *netReachStatus;

@end

