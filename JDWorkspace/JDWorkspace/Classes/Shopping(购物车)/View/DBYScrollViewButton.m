//
//  DBYScrollViewButton.m
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "DBYScrollViewButton.h"
#import "UIFont+Extend.h"
#import "JDPrefixHeader.pch"
#import "MBProgressHUD.h"
#import "UIView+Extension.h"
@implementation DBYScrollViewButton

- (void)scrollViewButtonWith:(NSString*)price Title:(NSString*)title Image:(UIImage*)image{
    
    UIImageView * imageView=[[UIImageView alloc] initWithFrame:CGRectMake(12.5, 0 , 100, 90)];
    imageView.image =image;
    imageView.layer.borderWidth=0.5f;
    imageView.layer.borderColor=[UIColor grayColor].CGColor;
    imageView.layer.cornerRadius=4.0f;
    [self addSubview:imageView];
    
    
    UILabel * titleLel = [[UILabel alloc]initWithFrame:CGRectMake(12.5,imageView.size.height , 100, 50)];
    titleLel.text=title;
    titleLel.numberOfLines =2;
    titleLel.textColor=JDColor(100, 100, 100);
    titleLel.font=[UIFont systemFontOfSize:14];
    [self addSubview:titleLel];
    
    UILabel * priceLel = [[UILabel alloc]initWithFrame:CGRectMake(12.5,imageView.size.height+40 , 100, 25)];
    priceLel.text=price;
    priceLel.contentMode=NSTextAlignmentCenter;
    priceLel.textColor=JDColor(0, 0, 0);
    priceLel.font=[UIFont systemFontOfSize:15];
    [self addSubview:priceLel];
 
}

@end
