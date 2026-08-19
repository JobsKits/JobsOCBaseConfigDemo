//
//  JobsAppDoorInputViewBaseStyle_2.h
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSAPPDOORINPUTVIEWBASESTYLE_2_2AB28898C2

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#define JOBS_HEADER_GUARD_JOBSAPPDOORINPUTVIEWBASESTYLE_2_2AB28898C2

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsAppDoorConfig.h"
#import "JobsAppDoorInputViewBaseStyle.h"
#import "ImageCodeView.h"

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import "JobsBaseProtocolHeader.h"
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import "JobsByOCPods.h"
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import "JobsMakes.h"
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import "JobsDefines.h"
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import "JobsOCDSL.h"
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import "JobsModelDSL.h"
#else
#import "JobsModelDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorInputViewBaseStyle_2 : JobsAppDoorInputViewBaseStyle

-(void)changeTextFieldAnimationColor:(BOOL)toRegisterBtnSelected;
-(jobsByBOOLBlock _Nonnull)jobsChangeTextFieldAnimationColor;
/**
 
 * 其实并不建议用init方法,而是期望带参数初始化，比如对应BaseViewProtocol里面的 - (instancetype)initWithSize:(CGSize)thisViewSize
 * 因为本类在大多数情况下是依附于一个父视图执行的，这样可以有效的避免过程值对环境的影响
 * 因为父视图在没有进行展开的时候，子视图是不展开的。那么存在生命周期的过程，会影响布局结果
    
 * 如果以后需要强行禁用init或者new，那么:
 - (instancetype)init NS_UNAVAILABLE;
 - (instancetype)new NS_UNAVAILABLE;
 
 */

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_2
-(JobsRetJobsAppDoorInputViewBaseStyle_2ByJobsAppDoorInputViewBaseStyleModelBlock _Nonnull)byDoorInputViewBaseStyleModel;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_2
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSAPPDOORINPUTVIEWBASESTYLE_2_2AB28898C2 */
