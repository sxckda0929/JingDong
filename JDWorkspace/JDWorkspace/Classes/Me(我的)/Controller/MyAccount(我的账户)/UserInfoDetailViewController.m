//
//  UserInfoDetailViewController.m
//  JDWorkspace
//
//  Created by 金亮齐 on 16/7/1.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "UserInfoDetailViewController.h"
#import "UserInfoView.h"

@interface UserInfoDetailViewController () <UIScrollViewDelegate>
/** 底部的scrollView */
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UserInfoView *userInfoView;

@end


@implementation UserInfoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"简介";
    self.view.backgroundColor = [UIColor whiteColor];
    //初始化scrollView
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.alwaysBounceVertical = YES;
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    //添加用户详情view到scrollView上
    self.userInfoView = [UserInfoView userInfoView];
    [self.scrollView addSubview:self.userInfoView];
    
    //设置scrollView的内容大小
    self.scrollView.contentSize = CGSizeMake(0, self.userInfoView.bounds.size.height);
    
    //添加title和back按钮这里可以用导航栏，可以自定义导航栏的标题
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, 34)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = @"简介";
    label.font = [UIFont systemFontOfSize:21];
    [self.view addSubview:label];
    
    //添加返回按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(10, 30, 30, 30);
    CGPoint point = backBtn.center;
    point.y = label.center.y;
    backBtn.center = point;
    [backBtn setImage:[UIImage imageNamed:@"back_bt_7"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClicl) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //将scrollView滚动的距离传给userInfoView让顶部的View自动计算反向力的距离
    [self.userInfoView userInfViewScrollOffsetY:scrollView.contentOffset.y];
}

- (void)backBtnClicl
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
