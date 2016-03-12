//
//  ListViewModel.h
//  HLJ_Project
//
//  Created by HLJ on 16/3/11.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetManager.h"

@interface ListViewModel : NSObject
@property (nonatomic) NSInteger rowNumber;
@property (nonatomic) NSMutableArray *listArr;
@property (nonatomic) NewsType newsType;
@property (nonatomic) NSInteger minId;
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)timeForRow:(NSInteger )row;
- (NSString *)viewCountForRow:(NSInteger)row;
- (NSString *)descForRow:(NSInteger)row;
- (NSString *)editorForRow:(NSInteger)row;
- (NSInteger)minIdForRow:(NSInteger)row;
- (instancetype)initWithType:(NewsType)newsType;
@end
