//
//  JobsLinkageMenuViewConfig.h
//  JobsLinkageMenuView
//
//  Created by Jobs on 2026/5/25.
//

#ifndef JOBS_HEADER_GUARD_JOBSLINKAGEMENUVIEWCONFIG_335BF6DCAD
#define JOBS_HEADER_GUARD_JOBSLINKAGEMENUVIEWCONFIG_335BF6DCAD

#import <Foundation/Foundation.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsLinkageMenuViewConfig : NSObject

Prop_assign()CGFloat MENU_WIDTH;
        // 左侧菜单栏宽度，默认136
Prop_assign()CGFloat BOTTOMVIEW_HEIGHT; // 滑块高度
Prop_assign()CGFloat BOTTOMVIEW_WIDTH;  // 滑块宽度
Prop_assign()CGFloat LINEVIEW_WIDTH;    // 分割线宽度
Prop_assign()CGFloat ANIMATION_TIME;    // 菜单栏滚动的时间

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSLINKAGEMENUVIEWCONFIG_335BF6DCAD */
