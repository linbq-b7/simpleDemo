//
//  OneViewController.m
//  simpleDemo
//
//  Created by lbq on 15/11/23.
//  Copyright © 2015年 linbq-b7. All rights reserved.
//

#import "OneViewController.h"
#import "OneMenu.h"
#import "OneCell.h"
#import "OneDetail.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import <MJRefresh.h>
@interface OneViewController ()
/** 存放数据模型的数组 */
@property (strong, nonatomic) NSMutableArray * menus;
@property (assign, nonatomic) NSInteger pn;
@end

@implementation OneViewController

#pragma mark - 全局常量
// 发送请求URL
static NSString * const OneRequestURL = @"http://apis.haoservice.com/lifeservice/cook/query?";
//static NSString * const Appkey = @"09af8ec592c14e70885af7e4cda0651c";
static NSString * const Appkey = @"ca2bd0f2b4f341ef9910dbb7453dff5d";
// 重用cell标识符
static NSString * const OneCellID = @"cell";





/**
 *  懒加载
 *
 *  @return menus
 */
-(NSMutableArray *)menus{
    if (!_menus) {
        _menus = [NSMutableArray array];
    }
    return _menus;
}

#pragma mark - life cycle 生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 100;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OneCell class]) bundle:nil] forCellReuseIdentifier:OneCellID];
    //self.view.backgroundColor = [UIColor colorWithRed:0.615 green:1.000 blue:0.160 alpha:1.000];
    
    //头部刷新
     self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadHeaderData)];

    
    //尾部刷新
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadFooterData)];
    
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - 请求接口数据
-(void)loadHeaderData{
    self.pn = 1;
    
    // 请求参数（根据接口文档编写）
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"menu"] = @"西红柿";
    params[@"pn"] = @(self.pn);
    params[@"rn"] = @"10";
    params[@"key"] = Appkey;
    
    // 在AFN的block内使用，防止造成循环引用
    __weak typeof(self) weakSelf = self;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];//设置相应内容类型
  
    [manager POST:OneRequestURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"请求成功");
        weakSelf.pn++;
        // 利用MJExtension框架进行字典转模型
        weakSelf.menus = [OneMenu mj_objectArrayWithKeyValuesArray:responseObject[@"result"]];
        
        // 刷新数据（若不刷新数据会显示不出）
        [weakSelf.tableView reloadData];
        
        [weakSelf.tableView.mj_header endRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"请求失败 原因：%@",error);
        
    }];
}

-(void)loadFooterData{
    // 请求参数（根据接口文档编写）
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"menu"] = @"西红柿";
    params[@"pn"] = @(self.pn);
    params[@"rn"] = @"5";
    params[@"key"] = Appkey;
    
    // 在AFN的block内使用，防止造成循环引用
    __weak typeof(self) weakSelf = self;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];//设置相应内容类型
    
    [manager POST:OneRequestURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"请求成功");
        weakSelf.pn++;
        // 利用MJExtension框架进行字典转模型
        NSArray *array = [OneMenu mj_objectArrayWithKeyValuesArray:responseObject[@"result"]];
        
        [weakSelf.menus addObjectsFromArray:array];
        
        // 刷新数据（若不刷新数据会显示不出）
        [weakSelf.tableView reloadData];
        
        [weakSelf.tableView.mj_footer endRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败 原因：%@",error);
        
    }];
}


#pragma mark - UITableviewDatasource 数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.menus.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    OneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.menu = self.menus[indexPath.row];
    
    return cell;
}

#pragma mark - UITableviewDelegate 代理方法

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
    OneMenu *menu =  self.menus[[indexPath row]];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    OneDetail *detail = [[OneDetail alloc] init];
    detail.detailId = menu.id;
    detail.appkey = Appkey;
    //newVC.view.backgroundColor = [UIColor greenColor];
    [self.navigationController pushViewController:detail animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
