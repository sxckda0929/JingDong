//
//  JDTabBarController.m
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "JDTabBarController.h"
#import "JDNavigationController.h"
#import "HomeViewController.h"
#import "CategoryViewController.h"
#import "FindViewController.h"
#import "CartViewController.h"
#import "MyViewController.h"
#import "JDPrefixHeader.pch"
@interface JDTabBarController ()

@property (nonatomic , assign)HomeViewController *homeViewController;
@property (nonatomic , assign)CategoryViewController *categoryViewController;
@property (nonatomic , assign)CartViewController *cartViewController;
@property (nonatomic , assign)MyViewController *myViewController;

@end

@implementation JDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addAllChildVcs];

}

- (void)addAllChildVcs
{
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    [self addOneChildVc:homeVC title:@"首页" imageName:@"tabBar_home_normal" selectedImageName:@"tabBar_home_press"];
    _homeViewController = homeVC;
    
    CategoryViewController *categoryVC = [[CategoryViewController alloc] init];
    [self addOneChildVc:categoryVC title:@"分类" imageName:@"tabBar_category_normal" selectedImageName:@"tabBar_category_press"];
    _categoryViewController= categoryVC;

    
    CartViewController *cartVC = [[CartViewController alloc] init];
    [self addOneChildVc:cartVC title:@"购物车" imageName:@"tabBar_cart_normal" selectedImageName:@"tabBar_cart_press"];
    _cartViewController= cartVC;
    
    MyViewController *myVC = [[MyViewController alloc] init];
    [self addOneChildVc:myVC title:@"我的" imageName:@"tabBar_myJD_normal" selectedImageName:@"tabBar_myJD_press"];
    _myViewController= myVC;
}

- (void)addOneChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    
    //设置标题
    childVc.title = title;
    //设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    //设置选中图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    if (iOS7) {
        //声明这张图用原图
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childVc.tabBarItem.selectedImage = selectedImage;
//    //设置背景
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabBar_bg"];
    //添加导航控制器
    JDNavigationController *nav = [[JDNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

+ (void)initialize
{
    //设置底部tabbar的主题样式
    UITabBarItem *appearance = [UITabBarItem appearance];
    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:JDCommonColor, NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
}

@end
