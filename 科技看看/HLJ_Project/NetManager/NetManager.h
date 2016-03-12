//
//  NetManager.h
//  HLJ_Project
//
//  Created by HLJ on 16/3/10.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListModel.h"

typedef NS_ENUM(NSUInteger, NewsType) {
    lastType ,
    DriveType ,
    SoftType ,
    PhoneType ,
    TechType
};


@interface NetManager : NSObject
+ (id)getListWithNewType:(NewsType)newType minId:(NSInteger)MinId completionHandler:(completionHandlerBlock)completionHandler;

+ (id)getDetailWithminId:(NSInteger)MinId completionHandler:(completionHandlerBlock)completionHandler;
@end
