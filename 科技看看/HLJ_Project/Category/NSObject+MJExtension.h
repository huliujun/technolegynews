//
//  NSObject+MJExtension.h
//  HLJ_Project
//
//  Created by HLJ on 16/2/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MJExtension)

+ (id)hlj_parse:(id)responseObj;

+(NSDictionary *)hlj_objClassInArray;

+ (NSString *)hlj_replacedKeyFromPropertyName:(NSString *)propertyName;

@end
