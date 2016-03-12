//
//  LIstCell.m
//  HLJ_Project
//
//  Created by HLJ on 16/3/11.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ListCell.h"

@implementation ListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.baseView];
        [_baseView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return self;
}

- (UIView *)baseView {
    if(_baseView == nil) {
        _baseView = [[UIView alloc] init];
        [_baseView addSubview:self.iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
    }
    return _baseView;
}

- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
    }
    return _iconIV;
}

- (UILabel *)title {
    if(_title == nil) {
        _title = [[UILabel alloc] init];
    }
    return _title;
}

- (UILabel *)time {
    if(_time == nil) {
        _time = [[UILabel alloc] init];
    }
    return _time;
}

- (UILabel *)desc {
    if(_desc == nil) {
        _desc = [[UILabel alloc] init];
    }
    return _desc;
}

- (UILabel *)editor {
    if(_editor == nil) {
        _editor = [[UILabel alloc] init];
    }
    return _editor;
}









- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
