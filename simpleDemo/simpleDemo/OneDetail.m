//
//  OneDetail.m
//  simpleDemo
//
//  Created by lbq on 15/11/29.
//  Copyright © 2015年 linbq-b7. All rights reserved.
//

#import "OneDetail.h"
#import "OneDetailModel.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import <MJRefresh.h>
#import <UIImageView+WebCache.h>
@interface OneDetail ()

@end

@implementation OneDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDetail];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadDetail{
    NSString * OneRequestUrl = @"http://apis.haoservice.com/lifeservice/cook/queryid?";
    
    // 请求参数（根据接口文档编写）
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"id"] = self.detailId;
    params[@"key"] = self.appkey;
    
    // 在AFN的block内使用，防止造成循环引用
    __weak typeof(self) weakSelf = self;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];//设置相应内容类型
    
    [manager POST:OneRequestUrl parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"请求成功");
        // 利用MJExtension框架进行字典转模型
  
        OneDetailModel *detail = [OneDetailModel mj_objectWithKeyValues:responseObject[@"result"]];

        weakSelf.label_title.text = detail.title;
        weakSelf.textV_tags.text  = [NSString stringWithFormat:@"%@ \n\n %@", detail.tags, detail.intro ];
        
//        weakSelf.textV_tags.frame = [self contentSizeOfTextView:weakSelf.textV_tags];
//           weakSelf.textV_tags.contentSize = [self contentSizeOfTextView:weakSelf.textV_tags];
        
        
        
        [weakSelf.image_albums sd_setImageWithURL:[NSURL URLWithString:detail.albums]];
        //[self setDetail:detail];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败 原因：%@",error);
        
    }];
}

- (CGSize)contentSizeOfTextView:(UITextView *)textView
{
    CGSize textViewSize = [textView sizeThatFits:CGSizeMake(textView.frame.size.width, FLT_MAX)];
    
    
    return textViewSize;
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
