//
//  CommoditySelectCell.h
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsMode.h"
@interface CommoditySelectCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *selectLatel;

/// 根据数据模型来显示内容
- (void)showInfo:(DetailsMode *)model;
@end
