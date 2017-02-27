//
//  ViewController.m
//  TestFD
//
//  Created by colawh on 16/12/16.
//  Copyright © 2016年 colawh. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import <UITableView+FDTemplateLayoutCell.h>
#import "TestHeightModel.h"
#import "TestDeveloViewController.h"
#import "MasterViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic)UITableView *tableView;
@property(nonatomic)NSMutableArray *dataSOurce;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
//    [self.tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier:@"CustomTableViewCell"];
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"CustomTableViewCell"];
    self.tableView.rowHeight = 44.0;
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)initUI
{
    [self.view addSubview:self.tableView];
    for (NSInteger i = 0; i < 10; i++) {
        TestHeightModel *model = [TestHeightModel new];
        model.text = @"在东方世界里，挑选小公牛到竞技场角斗有一定的程序。每一头被带进场地的公牛都要向手持长矛刺它的斗牛士发起进攻。其勇敢程度是根据它不顾矛刃的刺痛向斗牛士进攻的次数来认真评定的";
        [self.dataSOurce addObject:model];
        NSLog(@"self.dataSOurce)%@",self.dataSOurce);
    }
}
#pragma mark UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell" forIndexPath:indexPath];
    [self setupModelOfCell:cell AtIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MasterViewController *testDevelop = [[MasterViewController alloc]init];
    [self.navigationController pushViewController:testDevelop animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSOurce.count;
}

#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:@"CustomTableViewCell" cacheByIndexPath:indexPath configuration:^(id cell) {
        [self setupModelOfCell:cell AtIndexPath:indexPath];
    }];
}

#warning 重点(自适应高度必须实现)
//预加载Cell内容
- (void)setupModelOfCell:(CustomTableViewCell *)cell AtIndexPath:(NSIndexPath *)indexPath{
    cell.model = [self.dataSOurce objectAtIndex:indexPath.row];
    NSLog(@"cell.model%@",cell.model);
        NSLog(@"dataSOurcecell.model%@",self.dataSOurce);
}


- (UITableView *)tableView
{
    if (_tableView) {
        return _tableView;
    }
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.fd_debugLogEnabled = YES;
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSMutableArray *)dataSOurce
{
    if (!_dataSOurce) {
        self.dataSOurce = [NSMutableArray arrayWithCapacity:10];
        
    }
    return _dataSOurce;
}

@end
