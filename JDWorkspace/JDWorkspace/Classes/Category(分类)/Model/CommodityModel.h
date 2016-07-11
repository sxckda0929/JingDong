//
//  CommodityModel.h
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommodityModel : NSObject

#pragma mark - 属性
@property (nonatomic,assign) long long Id;//商品id
@property (nonatomic,copy) NSString *commodityImageUrl;//图像
@property (nonatomic,copy) NSString *commodityName;//名字
@property (nonatomic,copy) NSString *commodityPrice;//价钱
@property (nonatomic,copy) NSString *commodityZX;//手机专享
@property (nonatomic,copy) NSString *commodityPraise;//评价
@property (nonatomic,copy) NSString *commodityPerson;//人数


#pragma mark 根据字典初始化微博对象
-(CommodityModel *)initWithDictionary:(NSDictionary *)dic;

#pragma mark 初始化微博对象（静态方法）
+(CommodityModel *)commodityWithDictionary:(NSDictionary *)dic;

-(NSString *)praise;

@end
