//
//  UserDao.h
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseDao.h"
#import "UserModel.h"

@interface UserDao : BaseDao

- (BOOL)insertUser:(UserModel *)entity;

- (UserModel*)selectLogin:(NSString*)phone :(NSString*)pwd;

- (UserModel*)selectAdd:(NSString*)userId ;

@end
