//
//  CommoditySectionCell.m
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "CommoditySectionCell.h"

@implementation CommoditySectionCell

- (void)layoutSubviews
{
    _serviceBtn.layer.borderWidth=0.5;
    _serviceBtn.layer.cornerRadius=5;
    _serviceBtn.layer.borderColor=[UIColor lightGrayColor].CGColor;
    _shopBtn.layer.borderWidth=0.5;
    _shopBtn.layer.cornerRadius=5;
    _shopBtn.layer.borderColor=[UIColor lightGrayColor].CGColor;
}
@end
