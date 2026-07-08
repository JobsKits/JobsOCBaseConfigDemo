//
//  JobsAppDoorInputViewBaseStyle_1.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSAPPDOORINPUTVIEWBASESTYLE_1_A2DF156E15
#define JOBS_HEADER_GUARD_JOBSAPPDOORINPUTVIEWBASESTYLE_1_A2DF156E15

#import <UIKit/UIKit.h>
#import <JobsOCTools/JobsAppDoorConfig.h>
#import <JobsOCTools/JobsAppDoorInputViewBaseStyle.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
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

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsCountdownBtn/JobsCountdownBtn.h>)
#import <JobsCountdownBtn/JobsCountdownBtn.h>
#else
#import "JobsCountdownBtn.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorInputViewBaseStyle_1 : JobsAppDoorInputViewBaseStyle

Prop_assign()CGFloat countDownBtnWidth;
Prop_assign()CGFloat textFieldWidth;
/// 倒计时按钮（需要销毁定时器）
-(UIButton *)getCountDownBtn;
/**
 
 * 其实并不建议用init方法,而是期望带参数初始化，比如对应BaseViewProtocol里面的 - (instancetype)initWithSize:(CGSize)thisViewSize
 * 因为本类在大多数情况下是依附于一个父视图执行的，这样可以有效的避免过程值对环境的影响
 * 因为父视图在没有进行展开的时候，子视图是不展开的。那么存在生命周期的过程，会影响布局结果
    
 * 如果以后需要强行禁用init或者new，那么:
 - (instancetype)init NS_UNAVAILABLE;
 - (instancetype)new NS_UNAVAILABLE;
 
 */

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSAPPDOORINPUTVIEWBASESTYLE_1_A2DF156E15 */
