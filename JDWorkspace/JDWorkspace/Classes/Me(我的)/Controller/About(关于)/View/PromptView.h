//
//  PromptView.h
//  JDWorkspace
//
//  Created by 金亮齐 on 16/7/1.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PromptView : UIView

- (void)showPromptViewToView:(UIView *)superView;

- (void)hidePromptViewToView;

+ (instancetype)promptView;

@end
