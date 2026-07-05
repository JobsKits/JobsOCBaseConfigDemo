//
//  JobsLinkageMenuView.h
//  JobsLinkageMenuView
//
//  Created by Jobs on 2026年6月27日，星期六.
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

#if __has_include(<JobsAppTools/JobsAppToolsHeader.h>)
#import <JobsAppTools/JobsAppToolsHeader.h>
#else
#import "JobsAppToolsHeader.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@class JobsLinkageMenuViewConfig;

@interface JobsLinkageMenuView : BaseView

Prop_strong()UIColor *selectViewColor; // 滑块颜色
Prop_strong()UIColor *textColor;       // 标题颜色
Prop_strong()UIColor *selectTextColor; // 标题选中的颜色
Prop_assign()CGFloat textSize;         // 标题字体大小
Prop_copy(nullable)jobsByIDBlock menuClickBlock;
Prop_copy(nullable)jobsByIDBlock noContentClickBlock;

-(instancetype)initWithFrame:(CGRect)frame
                   btnConfig:(UIButtonModel *)btnConfig
       linkageMenuViewConfig:(nullable JobsLinkageMenuViewConfig *)linkageMenuViewConfig;
-(instancetype)byMenuClickBlock:(nullable jobsByIDBlock)block;
-(instancetype)byNoContentClickBlock:(nullable jobsByIDBlock)block;
-(void)reloadData;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSLINKAGEMENUVIEW_6F373EA6B1 */
