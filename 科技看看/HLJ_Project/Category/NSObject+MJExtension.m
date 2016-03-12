//
//  NSObject+MJExtension.m
//  HLJ_Project
//
//  Created by HLJ on 16/2/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NSObject+MJExtension.h"

@implementation NSObject (MJExtension)

+ (id)hlj_parse:(id)responseObj {
    if ([responseObj isKindOfClass:[NSArray class]]) {
        return [self mj_objectArrayWithKeyValuesArray:responseObj];
    }
    if ([responseObj isKindOfClass:[NSDictionary class]]) {
        return [self mj_objectWithKeyValues:responseObj];
    }
    return responseObj;
}

+(NSDictionary *)mj_objectClassInArray {
    return [self hlj_objClassInArray];
}

+ (NSDictionary *)hlj_objClassInArray {
    return nil;
}

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [self hlj_replacedKeyFromPropertyName:propertyName];
}

+ (NSString *)hlj_replacedKeyFromPropertyName:(NSString *)propertyName{
    return propertyName;
}

@end
