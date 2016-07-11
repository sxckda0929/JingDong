//
//  CommodityTableViewCell.h
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommodityTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *commodityImg;
@property (strong, nonatomic) IBOutlet UILabel *commodityName;
@property (strong, nonatomic) IBOutlet UILabel *commodityPrice;
@property (strong, nonatomic) IBOutlet UIImageView *commodityZX;
@property (strong, nonatomic) IBOutlet UILabel *commodityPraise;

@end
