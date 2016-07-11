//
//  AboutViewController.m
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "AboutViewController.h"
#import "JDPrefixHeader.pch"
#import "UIBarButtonItem+Extension.h"
#import "UnLoginView.h"
@interface AboutViewController ()

@property(nonatomic,strong) UIWebView *webview;


@end


@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self aboutWebView];
    self.view.backgroundColor=JDColor(240, 243, 245);

    [self setupNavigationItem];
}

-(void)aboutWebView{
    _webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.jianshu.com/users/ef13bae228f6/latest_articles"]];
    
    [self.view addSubview:_webview];
    
    [_webview loadRequest:request];
}

- (void)setupNavigationItem {
    
    self.navigationItem.title = @"关于作者";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem BarButtonItemWithBackgroudImageName:@"more_share" highBackgroudImageName:@"more_share_p" target:self action:@selector(shareOnClick)];
}



- (void)shareOnClick{
    
    UnLoginView *view = [UnLoginView unLoginView];
    [view showUnLoginViewToView:self.view];
 
    NSLog(@"点击了分享");
}



@end
