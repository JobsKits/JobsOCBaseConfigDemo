//
//  JobsLinkageMenuView.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSLINKAGEMENUVIEW_F759B6D83C
#define JOBS_HEADER_GUARD_JOBSLINKAGEMENUVIEW_F759B6D83C

#pragma once

#import <UIKit/UIKit.h>
#import <JobsBaseUI/BaseView.h>
#import <JobsBaseUI/UIButton+Extra.h>

#if __has_include(<JobsAppTools/JobsAppTools.h>)
#import <JobsAppTools/JobsAppTools.h>
#else
#import "JobsAppTools.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

@class JobsLinkageMenuViewConfig;

@interface JobsLinkageMenuView : BaseView

Prop_strong()UIColor *selectViewColor;// 滑块颜色
Prop_strong()UIColor *textColor;// 标题颜色
Prop_strong()UIColor *selectTextColor;// 标题选中的颜色
Prop_assign()CGFloat textSize;// 标题字体大小

-(instancetype)initWithFrame:(CGRect)frame
                   btnConfig:(UIButtonModel *)btnConfig
       linkageMenuViewConfig:(JobsLinkageMenuViewConfig *)linkageMenuViewConfig;
@end

@interface JobsLinkageMenuViewConfig : NSObject

Prop_assign()CGFloat MENU_WIDTH;// 左侧菜单栏宽度，默认136
Prop_assign()CGFloat BOTTOMVIEW_HEIGHT;// 滑块高度
Prop_assign()CGFloat BOTTOMVIEW_WIDTH;// 滑块宽度
Prop_assign()CGFloat LINEVIEW_WIDTH;// 分割线宽度
Prop_assign()CGFloat ANIMATION_TIME;// 菜单栏滚动的时间

@end
#endif /* JOBS_HEADER_GUARD_JOBSLINKAGEMENUVIEW_F759B6D83C */
