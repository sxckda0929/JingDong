//
//  CommodityPraiseCell.h
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsMode.h"
@interface CommodityPraiseCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *praiseLabel;
@property (strong, nonatomic) IBOutlet UILabel *personLabel;
- (void)showInfo:(DetailsMode *)model;
@end
