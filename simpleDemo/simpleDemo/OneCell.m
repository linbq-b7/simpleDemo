//
//  OneCell.m
//  simpleDemo
//
//  Created by lbq on 15/11/28.
//  Copyright © 2015年 linbq-b7. All rights reserved.
//

#import "OneCell.h"
#import "OneMenu.h"
#import <UIImageView+WebCache.h>

@implementation OneCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(void)setMenu:(OneMenu *)menu{
    _menu = menu;
    
    // 利用SDWebImage框架加载图片资源
    [self.image_albums sd_setImageWithURL:[NSURL URLWithString:menu.albums]];
    // 设置标题
    self.label_title.text = menu.title;
    // 设置材料数据
    self.label_ingredients.text = menu.ingredients;
    
    
}


@end
