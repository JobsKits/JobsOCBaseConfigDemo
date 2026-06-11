//
//  UIGestureRecognizer+Extra.h
//  JobsOCDSL Support
//
//  Migrated from JobsByOCPods on 2026年6月10日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_EXTRA_89FAC8A5AC
#define JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_EXTRA_89FAC8A5AC

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

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

@interface UIGestureRecognizer (Extra)<BaseProtocol>

@property(nonatomic, assign, nullable) id target;

-(__kindof UIGestureRecognizer *)gestureActionBy:(jobsByVoidBlock _Nonnull)block;
-(__kindof UIGestureRecognizer *)GestureActionBy:(jobsByGestureRecognizerBlock _Nonnull)block;

-(JobsRetGestureRecognizerBySELBlock _Nonnull)removeAction;
-(JobsRetGestureRecognizerBySELBlock _Nonnull)addAction;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIGESTURERECOGNIZER_EXTRA_89FAC8A5AC */
