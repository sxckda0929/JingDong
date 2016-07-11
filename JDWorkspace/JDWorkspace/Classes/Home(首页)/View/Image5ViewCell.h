//
//  Image5ViewCell.h
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface Image5ViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *ImageView;
/// 根据数据模型来显示内容
- (void)showInfo:(Model *)model;

@end
