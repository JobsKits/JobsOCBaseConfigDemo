//
//  JobsLinkageMenuView.h
//  JobsLinkageMenuView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSLINKAGEMENUVIEW_6F373EA6B1
#define JOBS_HEADER_GUARD_JOBSLINKAGEMENUVIEW_6F373EA6B1

#import <UIKit/UIKit.h>
#import <JobsLinkageMenuView/JobsLinkageMenuViewConfig.h>

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

@interface JobsLinkageMenuView : BaseView

Prop_strong()UIColor *selectViewColor; // 滑块颜色
Prop_strong()UIColor *textColor;       // 标题颜色
Prop_strong()UIColor *selectTextColor; // 标题选中的颜色
Prop_assign()CGFloat textSize;
         // 标题字体大小

-(instancetype)initWithFrame:(CGRect)frame
                   btnConfig:(UIButtonModel *)btnConfig
       linkageMenuViewConfig:(JobsLinkageMenuViewConfig *)linkageMenuViewConfig;
@end
#endif /* JOBS_HEADER_GUARD_JOBSLINKAGEMENUVIEW_6F373EA6B1 */
