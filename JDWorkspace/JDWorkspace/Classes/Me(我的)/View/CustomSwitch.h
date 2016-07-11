//
//  CustomSwitch.h
//  JDWorkspace
//
//  Created by 金亮齐 on 16/6/30.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CustomSwitchStatus)
{
    CustomSwitchStatusOn = 0,//开启
    CustomSwitchStatusOff = 1//关闭
};

typedef NS_ENUM(NSUInteger, CustomSwitchArrange)
{
    CustomSwitchArrangeONLeftOFFRight = 0,//左边是开启,右边是关闭，默认
    CustomSwitchArrangeOFFLeftONRight = 1//左边是关闭，右边是开启
};

@protocol CustomSwitchDelegate <NSObject>

-(void)customSwitchSetStatus:(CustomSwitchStatus)status;
@end

@interface CustomSwitch : UIControl{
    UIImage *_onImage;
    UIImage *_offImage;
    id<CustomSwitchDelegate> _delegate;
    CustomSwitchArrange _arrange;
    
}

@property(nonatomic,retain) UIImage *onImage;
@property(nonatomic,retain) UIImage *offImage;
@property(nonatomic,retain) IBOutlet id<CustomSwitchDelegate> delegate;
@property(nonatomic) CustomSwitchArrange arrange;
@property(nonatomic) CustomSwitchStatus status;

@end
