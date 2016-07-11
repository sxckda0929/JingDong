//
//  CartTableViewCell.h
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cartRedio;

@property (weak, nonatomic) IBOutlet UIImageView *cartImg;
@property (weak, nonatomic) IBOutlet UILabel *cartTitle;
@property (weak, nonatomic) IBOutlet UILabel *cartPrice;

@property (weak, nonatomic) IBOutlet UIButton *cartAdd;
@property (weak, nonatomic) IBOutlet UITextField *cartNumber;
@property (weak, nonatomic) IBOutlet UIButton *cartSub;

@property (weak, nonatomic) IBOutlet UIButton *cartActivity;

/**
 *  文本框内容改变后的回调
 */
@property (nonatomic, copy) void (^callBack) (int currentNum);

@end
