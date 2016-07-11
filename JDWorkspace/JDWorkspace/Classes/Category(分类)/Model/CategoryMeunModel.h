//
//  CategoryMeunModel.h
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryMeunModel : NSObject


#pragma mark - 属性

@property(assign,nonatomic) int Id;//菜单ID
@property(copy,nonatomic) NSString * menuName;//菜单名
@property(copy,nonatomic) NSString * urlName;//菜单图片名


/**
 *  下一级菜单
 */
@property(strong,nonatomic) NSArray * nextArray;

/**
 *  菜单层数
 */
@property(assign,nonatomic) NSInteger meunNumber;

@property(assign,nonatomic) float offsetScorller;

#pragma mark - 方法
#pragma mark 根据字典初始化对象
-(CategoryMeunModel *)initWithDictionary:(NSDictionary *)dic;

#pragma mark 初始化对象（静态方法）
+(CategoryMeunModel *)statusWithDictionary:(NSDictionary *)dic;

@end
