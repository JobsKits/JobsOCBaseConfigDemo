//
//  UIGestureRecognizer+Extra.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_EXTRA_4121F3E0CF

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#define JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_EXTRA_4121F3E0CF

#pragma once

#import <UIKit/UIKit.h>

#import "JobsBaseProtocolHeader.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIGestureRecognizer (Extra)

Prop_assign(nullable)id target;

-(JobsRetIDByIDBlock _Nonnull)byTarget;
-(JobsRetUIGestureRecognizerByjobsByVoidBlockBlock _Nonnull)gestureActionBy;
/// Manual_Add_ThirdParty 中的旧源码仍直接发送此消息，仅作为第三方 ABI 兼容入口保留。
-(__kindof UIGestureRecognizer *_Nullable)gestureActionBy:(jobsByVoidBlock _Nonnull)block;
-(JobsRetUIGestureRecognizerByjobsByGestureRecognizerBlockBlock _Nonnull)GestureActionBy;
/// 仅供未纳入 Jobs 维护的历史源码兼容；Jobs 新代码统一使用 Block getter。
-(__kindof UIGestureRecognizer *_Nonnull)GestureActionBy:(jobsByGestureRecognizerBlock _Nullable)block;
-(JobsRetGestureRecognizerBySELBlock _Nonnull)removeAction;
-(JobsRetGestureRecognizerBySELBlock _Nonnull)addAction;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_EXTRA_4121F3E0CF */
