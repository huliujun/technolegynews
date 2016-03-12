//
//  NewsViewController.m
//  HLJ_Project
//
//  Created by HLJ on 16/3/11.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NewsViewController.h"
#import "ListCell.h"
#import "DetailViewController.h"

@interface NewsViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic) ListViewModel *listVM;
@property (nonatomic) UITableView *tableView;
@end

@implementation NewsViewController
#pragma mark - UITableView Data Source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.iconIV setImageWithURL:[self.listVM iconURLForRow:indexPath.row]];
    return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *vc = [[DetailViewController alloc] initWithMinId:[self.listVM minIdForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Lazy Load

- (ListViewModel *)listVM {
	if(_listVM == nil) {
		_listVM = [[ListViewModel alloc] initWithType:self.newsType];
	}
	return _listVM;
}

- (UITableView *)tableView {
	if(_tableView == nil) {
		_tableView = [[UITableView alloc] init];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 300;
        [_tableView registerClass:[ListCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        WK(weakSelf);
        [_tableView addHeaderRefresh:^{
            [weakSelf.listVM getDataWithRequestMode:Refresh completionHandler:^(NSError *error) {
                if (!error) {
                    [weakSelf.tableView reloadData];
                }
                [weakSelf.tableView endHeaderRefresh];
            }];
        }];
        [_tableView addAutoFooterRefresh:^{
            [weakSelf.listVM getDataWithRequestMode:More completionHandler:^(NSError *error) {
                if (!error) {
                    [weakSelf.tableView reloadData];
                }
                [weakSelf.tableView endFooterRefresh];
            }];
        }];
	}
	return _tableView;
}

@end
