//
//  DetailViewController.m
//  HLJ_Project
//
//  Created by HLJ on 16/3/11.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailViewModel.h"
#import "HeaderCell.h"

#define kWebViewHeight kScreenH - 20*2-68-64

@interface DetailViewController ()<UITableViewDelegate, UITableViewDataSource, UIWebViewDelegate>
@property (nonatomic) UITableView *tableView;
@property (nonatomic) UIWebView *webView;
@property (nonatomic) DetailViewModel *detailVM;
@end

@implementation DetailViewController

- (instancetype)initWithMinId:(NSInteger)minId {
    if (self = [super init]) {
        self.minId = minId;
    }
    return self;
}

#pragma mark - UITableView Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2 ;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1&& indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WebCell"];
        [cell.contentView addSubview:self.webView];

        [self.webView loadHTMLString:[self.detailVM content] baseURL:nil];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        return cell;
    }else {
        HeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeaderCell"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.title.text = [self.detailVM title];
        cell.editor.text = [self.detailVM editor];
        cell.time.text = [self.detailVM upDateTime];
        return cell;
    }
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @[@"header",@"detail"][section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0&&indexPath.section == 1) {
        return kWebViewHeight;
    }
    return 68;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}


#pragma mark - UIWebView Delegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
//    NSInteger height = [[_webView stringByEvaluatingJavaScriptFromString:
//                         @"document.body.scrollHeight"] integerValue];
//    NSLog(@"aaaa%ld", height);
    self.webView.frame = CGRectMake(self.webView.frame.origin.x, self.webView.frame.origin.y, kScreenW, kWebViewHeight);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView beginHeaderRefresh];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - Lazy Load 


- (UITableView *)tableView {
	if(_tableView == nil) {
		_tableView = [[UITableView alloc] init];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource =self;
        _tableView.separatorStyle = NO;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"WebCell"];
        [_tableView registerClass:[HeaderCell class] forCellReuseIdentifier:@"HeaderCell"];
        WK(weakSelf);
        [_tableView addHeaderRefresh:^{
            [weakSelf.detailVM getDataWithRequestMode:Refresh completionHandler:^(NSError *error) {
                if (!error) {
                    [weakSelf.tableView reloadData];
                }
                [weakSelf.tableView endHeaderRefresh];
            }];
        }];
        
	}
	return _tableView;
}

- (UIWebView *)webView {
	if(_webView == nil) {
		_webView = [[UIWebView alloc] init];
        _webView.delegate = self;
        _webView.scalesPageToFit = NO;
	}
	return _webView;
}

- (DetailViewModel *)detailVM {
	if(_detailVM == nil) {
		_detailVM = [[DetailViewModel alloc] initWithMinId:self.minId];
	}
	return _detailVM;
}

@end
