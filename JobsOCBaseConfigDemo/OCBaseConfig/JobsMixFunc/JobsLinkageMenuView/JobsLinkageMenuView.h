//
//  JobsLinkageMenuView.h
//  JobsLinkageMenuView
//
//  Created by Jobs on 2026年6月27日，星期六.
//

#ifndef JOBS_HEADER_GUARD_JOBSLINKAGEMENUVIEW_6F373EA6B1
#define JOBS_HEADER_GUARD_JOBSLINKAGEMENUVIEW_6F373EA6B1

#import <UIKit/UIKit.h>
#import "JobsLinkageMenuViewConfig.h"

#import "JobsBaseUI.h"

#import "JobsAppToolsHeader.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

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
