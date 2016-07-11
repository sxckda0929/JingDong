//
//  UserInfoView.h
//  JDWorkspace
//
//  Created by 金亮齐 on 16/7/1.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoView : UIView

//便利构造方法
+ (instancetype)userInfoView;

//传入userInfoViewY轴滚动的距离,内部计算顶部的头像位置
- (void)userInfViewScrollOffsetY:(CGFloat)offsetY;

@end
