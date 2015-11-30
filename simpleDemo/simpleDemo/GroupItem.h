//
//  GroupItem.h
//  simpleDemo2
//
//  Created by lbq on 15/11/24.
//  Copyright © 2015年 linbq-b7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupItem : NSObject
/**
 *  头部标题
 */
@property(strong,nonatomic) NSString *headTitle;
/**
 *  底部标题
 */
@property(strong,nonatomic) NSString *footTitle;
/**
 *  组中的行数组
 */
@property(strong,nonatomic) NSArray *items;
@end
