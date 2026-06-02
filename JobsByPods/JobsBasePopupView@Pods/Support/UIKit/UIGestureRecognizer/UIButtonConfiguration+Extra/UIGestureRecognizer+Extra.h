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

NS_ASSUME_NONNULL_BEGIN

@interface UIGestureRecognizer (Extra)

-(__kindof UIGestureRecognizer *)gestureActionBy:(jobsByVoidBlock _Nonnull)block;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_EXTRA_4121F3E0CF */
