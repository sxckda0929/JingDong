//
//  CommodityPraiseCell.m
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "CommodityPraiseCell.h"

@implementation CommodityPraiseCell

#pragma mark - 显示数据
- (void)showInfo:(DetailsMode *)model
{
    
    self.praiseLabel.text = model.detailsPraise;
    self.personLabel.text = model.detailsPerson;
    [self layoutSubviews];
}

@end
