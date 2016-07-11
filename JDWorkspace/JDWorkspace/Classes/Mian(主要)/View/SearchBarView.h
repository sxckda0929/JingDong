//
//  SearchBarView.h
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchBarViewDelegate;

@interface SearchBarView : UIView


@property (nonatomic) NSString *placeholder;



@property (nonatomic, weak) id <SearchBarViewDelegate> delegate;

@end

@protocol SearchBarViewDelegate <NSObject>

@optional

- (void)searchBarAudioButtonClicked:(SearchBarView *)searchBarView;
- (void)searchBarSearchButtonClicked:(SearchBarView *)searchBarView;
@end

@interface RoundedView : UIView

@end
