//
//  ListViewModel.m
//  HLJ_Project
//
//  Created by HLJ on 16/3/11.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ListViewModel.h"

@implementation ListViewModel

- (instancetype)initWithType:(NewsType)newsType {
    if (self = [super init]) {
        self.newsType = newsType;
    }
    return self;
}

- (NSInteger)rowNumber {
    return self.listArr.count;
}
- (NSMutableArray *)listArr {
    if (!_listArr) {
        _listArr = [NSMutableArray new];
    }
    return _listArr;
}
- (NSInteger)minId {
    ListModel *model = self.listArr.lastObject;
    return model.ID;
}


- (void)getDataWithRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    NSInteger tmpId = 0;
    
    switch (requestMode) {
        case Refresh:{
            tmpId = 0;
            break;
        }
        case More:{
            tmpId = _minId;
            break;
        }
            
        default:
            break;
    }
    [NetManager getListWithNewType:self.newsType minId:tmpId completionHandler:^(NSArray *model, NSError *error) {
        self.listArr = model.mutableCopy;
        completionHandler(error);
    }];
}
- (ListModel *)modelForRow:(NSInteger)row {
    return self.listArr[row];
}

- (NSURL *)iconURLForRow:(NSInteger)row {
    return [NSURL URLWithString:[self modelForRow:row].icon];
}
- (NSString *)titleForRow:(NSInteger)row {
    return [self modelForRow:row].title;
}
- (NSString *)timeForRow:(NSInteger )row {
    return [self modelForRow:row].postdate;
}
- (NSString *)viewCountForRow:(NSInteger)row {
    return [NSString stringWithFormat:@"%ld", [self modelForRow:row].reviewcount];
}
- (NSString *)descForRow:(NSInteger)row {
    return [self modelForRow:row].desc;
}
- (NSString *)editorForRow:(NSInteger)row {
    return [self modelForRow:row].editor;
}

- (NSInteger)minIdForRow:(NSInteger)row {
    return [self modelForRow:row].ID;
}


@end
