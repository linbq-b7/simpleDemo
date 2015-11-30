//
//  OneDetail.h
//  simpleDemo
//
//  Created by lbq on 15/11/29.
//  Copyright © 2015年 linbq-b7. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneDetail : UIViewController
@property(strong,nonatomic) NSString *detailId;
@property(strong,nonatomic) NSString *appkey;
@property (weak, nonatomic) IBOutlet UILabel *label_title;
@property (weak, nonatomic) IBOutlet UITextView *textV_tags;
@property (weak, nonatomic) IBOutlet UIImageView *image_albums;
@end
