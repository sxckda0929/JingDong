//
//  CommoditySelectCell.m
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "CommoditySelectCell.h"

@implementation CommoditySelectCell

#pragma mark - 显示数据
- (void)showInfo:(DetailsMode *)model
{
    
    self.selectLatel.text = model.detailsSelect;
    [self layoutSubviews];
}

@end
