//
//  OneCell.h
//  simpleDemo
//
//  Created by lbq on 15/11/28.
//  Copyright © 2015年 linbq-b7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneMenu.h"

@interface OneCell : UITableViewCell
@property(strong,nonatomic) OneMenu *menu;
@property (weak, nonatomic) IBOutlet UILabel     *label_title;
@property (weak, nonatomic) IBOutlet UILabel     *label_ingredients;
@property (weak, nonatomic) IBOutlet UIImageView *image_albums;
@end
