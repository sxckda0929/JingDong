//
//  PromptView.m
//  JDWorkspace
//
//  Created by 金亮齐 on 16/7/1.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "PromptView.h"
#import "MenuButton.h"

@interface PromptView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
/** 提醒View */
@property (nonatomic, strong) PromptView *prompView;

@end

@implementation PromptView

- (void)awakeFromNib
{
    self.layer.cornerRadius = 10;
    self.layer.shadowOffset = CGSizeMake(4, 4);
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.layer.cornerRadius = self.iconImageView.frame.size.width / 2;
}

- (void)showPromptViewToView:(UIView *)superView
{
    CGRect rect = self.bounds;
    rect.origin = CGPointMake((superView.bounds.size.width - rect.size.width) / 2, 100);
    self.frame = rect;
    self.alpha = 0;
    
    [superView addSubview:self];
    [UIView animateWithDuration:0.4 animations:^{
        self.alpha = 1.0;
    }];
}

- (void)hidePromptViewToView
{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (IBAction)deleteView:(UIButton *)sender {
    [self hidePromptViewToView];
}

- (void)showPromptViewToView
{
    [self.prompView hidePromptViewToView];
    self.prompView = nil;
    self.prompView = [PromptView promptView];
    [_prompView showPromptViewToView:self.superview];
}

+ (instancetype)promptView
{
    PromptView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].lastObject;
    return view;
}

@end
