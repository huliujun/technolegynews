//
//  DetailViewController.h
//  HLJ_Project
//
//  Created by HLJ on 16/3/11.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (nonatomic) NSInteger minId;
- (instancetype)initWithMinId:(NSInteger)minId;
@end
