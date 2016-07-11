//
//  UserModel.h
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property(nonatomic,strong)NSString * userId;
@property(nonatomic,strong)NSString * userPhone;
@property(nonatomic,strong)NSString * userPwd;
@property(nonatomic,strong)NSString * time;
@property(nonatomic,strong)NSString * userName;
@property(nonatomic,strong)NSNumber * commodity;
@property(nonatomic,strong)NSNumber * shop;
@property(nonatomic,strong)NSNumber * record;

@end
