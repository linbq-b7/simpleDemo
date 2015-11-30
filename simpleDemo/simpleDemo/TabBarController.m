//
//  TabBarController.m
//  simpleDemo
//
//  Created by lbq on 15/11/23.
//  Copyright © 2015年 linbq-b7. All rights reserved.
//

#import "TabBarController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAllChildViewController];
    
}

// 添加所有的子控制器
-(void)setAllChildViewController{
    OneViewController *oneVc = [[OneViewController alloc]init];
    [self setChildViewController:oneVc setTitle:@"首页" setImage:@"tab_home_icon" setViewBackgroundColor:[UIColor orangeColor]];
    TwoViewController *twoVC = [[TwoViewController alloc]init];
    [self setChildViewController:twoVC setTitle:@"技术" setImage:@"tab_js_icon" setViewBackgroundColor:[UIColor blueColor]];
    ThreeViewController *threeVC = [[ThreeViewController alloc]init];
    [self setChildViewController:threeVC setTitle:@"文摘" setImage:@"tab_wz_icon" setViewBackgroundColor:[UIColor redColor]];
    
    // 由storyboard初始化视图控制器
    //FourViewController *fourVC = [[FourViewController alloc]init];
    UIStoryboard *fourSB = [UIStoryboard storyboardWithName:@"FourViewController" bundle:nil];
    FourViewController *fourVC = [fourSB instantiateInitialViewController];
    
    [self setChildViewController:fourVC setTitle:@"设置" setImage:@"tab_user_icon" setViewBackgroundColor:[UIColor colorWithRed:0.186 green:1.000 blue:0.215 alpha:1.000]];
    
    
    
}



/**
 *  添加子控制器
 *
 *  @param viewController <#viewController description#>
 *  @param title          <#title description#>
 *  @param imageName      <#imageName description#>
 *  @param color          <#color description#>
 */
-(void)setChildViewController:(UIViewController *)viewController setTitle:(NSString *)title setImage:(NSString *)imageName setViewBackgroundColor:(UIColor *)color{
    viewController.navigationItem.title = title;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    nav.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:imageName];
    //nav.view.backgroundColor = color;
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"commentary_num_bg"] forBarMetrics:UIBarMetricsDefault];
    [self addChildViewController:nav];
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

@end
