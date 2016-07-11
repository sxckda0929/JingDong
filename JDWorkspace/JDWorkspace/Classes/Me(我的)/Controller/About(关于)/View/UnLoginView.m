//
//  UnLoginView.m
//  JDWorkspace
//
//  Created by 金亮齐 on 16/7/1.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "UnLoginView.h"

#import "PromptView.h"

static const CGFloat unLoginViewHeight = 250;

static const CGFloat unLoginViewShowAndHideDuration = 0.3;

@interface UnLoginView ()


@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (nonatomic, strong) UIButton *maxCoverBtn;

@property (nonatomic, assign) CGRect superViewBouns;

@property (nonatomic, strong) PromptView *prompView;

@end

@implementation UnLoginView

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor whiteColor];
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.layer.cornerRadius = self.iconImageView.bounds.size.height / 2;
    
    _maxCoverBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _maxCoverBtn.frame = [UIScreen mainScreen].bounds;
    [_maxCoverBtn setBackgroundColor:[UIColor blackColor]];
    [_maxCoverBtn setAlpha:0.3];
    [_maxCoverBtn addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)sinaLoginBtnClick:(UIButton *)sender {
    [self showPromptViewToView];
}

- (IBAction)WeixinLoginBtnClick:(UIButton *)sender {
    [self showPromptViewToView];
}

- (void)showPromptViewToView
{
    [self.prompView hidePromptViewToView];
    self.prompView = nil;
    self.prompView = [PromptView promptView];
    [_prompView showPromptViewToView:self.superview];
}

+ (instancetype)unLoginView
{
    UnLoginView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    return view;
}



- (void)showUnLoginViewToView:(UIView *)superView
{
    [superView addSubview:self.maxCoverBtn];
    
    self.superViewBouns = superView.bounds;
    
    self.frame = CGRectMake(0, superView.bounds.size.height, superView.bounds.size.width, unLoginViewHeight);
    
    [superView addSubview:self];
    
    [UIView animateWithDuration:unLoginViewShowAndHideDuration animations:^{
        self.frame = CGRectMake(0, superView.bounds.size.height - unLoginViewHeight, superView.bounds.size.width, unLoginViewHeight);
    }];
}


- (void)coverClick
{
    [UIView animateWithDuration:unLoginViewShowAndHideDuration animations:^{
        self.frame = CGRectMake(0, self.superViewBouns.size.height, self.superViewBouns.size.width, unLoginViewHeight);
    } completion:^(BOOL finished) {
        [self.maxCoverBtn removeFromSuperview];
        [self removeFromSuperview];
        [self.prompView hidePromptViewToView];
    }];
}


@end
