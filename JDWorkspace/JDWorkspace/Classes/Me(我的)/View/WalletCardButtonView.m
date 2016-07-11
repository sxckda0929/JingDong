//
//  WalletCardButtonView.m
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "WalletCardButtonView.h"

@implementation WalletCardButtonView


- (void)walletCardWith:(NSString*)number Title:(NSString*)title Width:(CGFloat)width height:(CGFloat)height{
    
    UILabel * _number=[[UILabel alloc]initWithFrame:CGRectMake(0, 15, width, 25)];
    _number.textAlignment = NSTextAlignmentCenter;
    _number.textColor=[UIColor blackColor];
    _number.font = [UIFont systemFontOfSize:15];
    _number.text=number;
    [self addSubview:_number];
    
    UILabel * _title=[[UILabel alloc]initWithFrame:CGRectMake(0, 35, width, 25)];
    _title.textAlignment = NSTextAlignmentCenter;
    _title.textColor=[UIColor grayColor];
    _title.font = [UIFont systemFontOfSize:14];
    _title.text=title;
    [self addSubview:_title];
    
}


- (void)walletCardWith1:(NSString*)number Title:(NSString*)title Width:(CGFloat)width height:(CGFloat)height{
    UILabel * _number=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 25)];
    _number.textAlignment = NSTextAlignmentCenter;
    _number.textColor=[UIColor whiteColor];
    _number.font = [UIFont systemFontOfSize:15];
    _number.text=number;
    [self addSubview:_number];
    
    UILabel * _title=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, width, 25)];
    _title.textAlignment = NSTextAlignmentCenter;
    _title.textColor=[UIColor whiteColor];
    _title.font = [UIFont systemFontOfSize:14];
    _title.text=title;
    [self addSubview:_title];
}

@end
