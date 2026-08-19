//
//  UIGestureRecognizer+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_EXTRA_89FAC8A5AC
#define JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_EXTRA_89FAC8A5AC

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface UIGestureRecognizer (JobsByOCPodsExtra)<BaseProtocol>

-(JobsRetUIGestureRecognizerByjobsByVoidBlockBlock _Nonnull)gestureActionBy;
-(JobsRetUIGestureRecognizerByjobsByGestureRecognizerBlockBlock _Nonnull)GestureActionBy;
/// 仅供未纳入 Jobs 维护的历史源码兼容；Jobs 新代码统一使用 Block getter。
-(__kindof UIGestureRecognizer *_Nonnull)GestureActionBy:(jobsByGestureRecognizerBlock _Nullable)block;

-(jobsBySELBlock _Nonnull)removeAction;
-(jobsBySELBlock _Nonnull)addAction;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_EXTRA_89FAC8A5AC */
