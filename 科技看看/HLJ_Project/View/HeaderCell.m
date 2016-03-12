//
//  HeaderCell.m
//  HLJ_Project
//
//  Created by HLJ on 16/3/11.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HeaderCell.h"

@implementation HeaderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.time];
        [self.contentView addSubview:self.editor];
       
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(16);
        }];
        [_time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(self.title.mas_bottom).equalTo(5);
        }];
        [_editor mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(-8);
        }];
        
        
    }
    return self;
}




- (UILabel *)title {
    if(_title == nil) {
        _title = [[UILabel alloc] init];
        _title.textAlignment = NSTextAlignmentCenter;
        _title.font = [UIFont systemFontOfSize:20];
        
    }
    return _title;
}

- (UILabel *)time {
    if(_time == nil) {
        _time = [[UILabel alloc] init];
    }
    return _time;
}



- (UILabel *)editor {
    if(_editor == nil) {
        _editor = [[UILabel alloc] init];
         _editor.font = [UIFont systemFontOfSize:14];
    }
    return _editor;
}















- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
