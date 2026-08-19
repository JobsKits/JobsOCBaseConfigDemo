//
//  UISlider+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UISLIDER_EXTRA_B9293AA0D1

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#define JOBS_HEADER_GUARD_UISLIDER_EXTRA_B9293AA0D1

#import <UIKit/UIKit.h>

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UISlider (Extra)

-(JobsRetRACDisposableByRACNextBlock _Nonnull)jobsSliderAllTouchEventBlock;
-(JobsRetRACDisposableByRACNextBlock _Nonnull)jobsSliderValueChangedEventBlock;
/// 仅供不可修改的第三方源码保持 ABI；Jobs 自有代码统一使用点语法 Block。
-(RACDisposable *_Nullable)jobsSliderValueChangedEventBlock:(jobsByIDBlock _Nullable)subscribeNextBlock;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UISLIDER_EXTRA_B9293AA0D1 */
