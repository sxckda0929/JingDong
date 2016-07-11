//
//  CartScrollModel.h
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface CartScrollModel : NSObject

@property(nonatomic,copy)NSString * title;
@property(nonatomic,copy)NSString * price;
@property(nonatomic,copy)NSString * image;

#pragma mark 带参数的构造函数
-(CartScrollModel *)initWithFirstTitle:(NSString *)titleName andPriceName:(NSString *)priceName andImageNumber:(NSString *)image;



#pragma mark 带参数的静态对象初始化方法
+(CartScrollModel *)initWithFirstTitle:(NSString *)titleName andPriceName:(NSString *)priceName andImageNumber:(NSString *)image;
@end
