//
//  UIGestureRecognizer+Extra.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_EXTRA_4121F3E0CF
#define JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_EXTRA_4121F3E0CF

#pragma once

#import <UIKit/UIKit.h>

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#import "JobsBaseProtocolHeader.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIGestureRecognizer (Extra)

Prop_assign(nullable)id target;

-(__kindof UIGestureRecognizer *)gestureActionBy:(jobsByVoidBlock _Nonnull)block;
-(__kindof UIGestureRecognizer *)GestureActionBy:(jobsByGestureRecognizerBlock _Nonnull)block;
-(JobsRetGestureRecognizerBySELBlock _Nonnull)removeAction;
-(JobsRetGestureRecognizerBySELBlock _Nonnull)addAction;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_EXTRA_4121F3E0CF */
