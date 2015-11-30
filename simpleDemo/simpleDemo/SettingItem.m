//
//  SettingItem.m
//  simpleDemo2
//
//  Created by lbq on 15/11/24.
//  Copyright © 2015年 linbq-b7. All rights reserved.
//

#import "SettingItem.h"
@implementation SettingItem

+(instancetype)itemWithTitle:(NSString *)title{
    SettingItem *item = [[SettingItem alloc]init];
    item.title = title;
    return item;
}
@end
