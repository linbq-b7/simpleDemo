//
//  SettingItem.h
//  simpleDemo2
//
//  Created by lbq on 15/11/24.
//  Copyright © 2015年 linbq-b7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingItem : NSObject
/**
 *  标题
 */
@property(strong,nonatomic) NSString *title;
/**
 *  设置标题类方法
 *
 *  @param title 标题
 *
 *  @return item
 */
+(instancetype) itemWithTitle:(NSString *)title;
@end
