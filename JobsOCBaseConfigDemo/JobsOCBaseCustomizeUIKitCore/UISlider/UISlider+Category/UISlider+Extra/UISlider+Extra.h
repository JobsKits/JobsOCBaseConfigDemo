//
//  UISlider+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UISLIDER_EXTRA_B9293AA0D1
#define JOBS_HEADER_GUARD_UISLIDER_EXTRA_B9293AA0D1

#import <UIKit/UIKit.h>

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UISlider (Extra)

-(RACDisposable *)jobsSliderAllTouchEventBlock:(jobsByIDBlock)subscribeNextBlock;
-(RACDisposable *)jobsSliderValueChangedEventBlock:(jobsByIDBlock)subscribeNextBlock;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UISLIDER_EXTRA_B9293AA0D1 */
