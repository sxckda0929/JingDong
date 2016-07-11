//
//  BaseDao.m
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "BaseDao.h"
#import "JDPrefixHeader.pch"
@implementation BaseDao

- (void)createTable:(NSString *)sql
{
    FMDatabase *db = [[Database sharedInstance] openDatabase];
    if (![db executeUpdate:sql]) {
        DLog(@"Create table failed");
    }
    [db close];
}

@end
