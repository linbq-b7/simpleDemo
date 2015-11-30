//
//  ThreeViewController.m
//  simpleDemo
//
//  Created by lbq on 15/11/23.
//  Copyright © 2015年 linbq-b7. All rights reserved.
//

#import "ThreeViewController.h"
#import "SettingItem.h"
#import "GroupItem.h"
#import "OneViewController.h"
@interface ThreeViewController ()
@property(strong,nonatomic) NSMutableArray *groups;
@end

@implementation ThreeViewController
/**
 *  groupArray 懒加载
 *
 *  @return groupArray
 */
-(NSMutableArray *)groupArray{
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}


- (void)setGroup1{
    // 创建组模型
    GroupItem *group = [[GroupItem alloc]init];
    // 创建行模型
    SettingItem *item = [SettingItem itemWithTitle:@"文摘1-1"];
    SettingItem *item1 = [SettingItem itemWithTitle:@"文摘1-2"];
    
    // 保存行模型数组
    group.items = @[item,item1];
    // 把组模型保存到groups数组
    [self.groupArray addObject:group];
}

- (void)setGroup2{
    
    GroupItem *group = [[GroupItem alloc]init];
    
    SettingItem *item = [SettingItem itemWithTitle:@"文摘2-1"];
    SettingItem *item1 = [SettingItem itemWithTitle:@"文摘2-2"];
    
    group.items = @[item,item1];
    
    [self.groupArray addObject:group];
}

- (void)setGroup3{
    
    GroupItem *group = [[GroupItem alloc]init];
    
    SettingItem *item = [SettingItem itemWithTitle:@"文摘3-1"];
    SettingItem *item1 = [SettingItem itemWithTitle:@"文摘3-2"];
    
    group.items = @[item,item1];
    
    [self.groupArray addObject:group];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加第1组模型
    [self setGroup1];
    //添加第2组模型
    [self setGroup2];
    //添加第3组模型
    [self setGroup3];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (instancetype)init{
    
    // 设置tableView的分组样式为Group样式
    return [self initWithStyle:UITableViewStyleGrouped];
}
#pragma mark - TableView的数据源代理方法实现
/**
 *  返回有多少组的代理方法
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groups.count;
}
/**
 *  返回每组有多少行的代理方法
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    GroupItem *group = self.groups[section];
    return group.items.count;
}

/**
 *  返回每一行Cell的代理方法
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1 初始化Cell
    // 1.1 设置Cell的重用标识
    static NSString *ID = @"cell";
    // 1.2 去缓存池中取Cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 1.3 若取不到便创建一个带重用标识的Cell
    if (cell == nil) {
        cell  = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    // 设置Cell右边的小箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // 2 设置数据
    // 2.1 取出组模型
    GroupItem *group = self.groups[indexPath.section];
    // 2.2 根据组模型取出行（Cell）模型
    SettingItem *item = group.items[indexPath.row];
    // 2.3 根据行模型的数据赋值
    cell.textLabel.text = item.title;
    return cell;
}
/**
 *  <#Description#>
 *
 *  @param tableView <#tableView description#>
 *  @param indexPath indexPath description
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //UIStoryboard *sb = [UIStoryboard storyboardWithName:@"ThreeViewController" bundle:nil];
    //UIViewController *vc = [sb instantiateInitialViewController];
    OneViewController *oneVc = [[OneViewController alloc]init];
    
    
    
    [self.navigationController pushViewController:oneVc animated:YES];
}
@end
