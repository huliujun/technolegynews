//
//  baseModel.m
//  HLJ_Project
//
//  Created by HLJ on 16/3/10.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "baseModel.h"

@implementation baseModel
MJCodingImplementation
+ (NSString *)hlj_replacedKeyFromPropertyName:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"ID"]) propertyName = @"id";
    return [propertyName mj_underlineFromCamel];
}
@end
