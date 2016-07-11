//
//  CommodityAddressCell.h
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsMode.h"

@interface CommodityAddressCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *addressLatel;

- (void)showInfo:(DetailsMode *)model;
@end
