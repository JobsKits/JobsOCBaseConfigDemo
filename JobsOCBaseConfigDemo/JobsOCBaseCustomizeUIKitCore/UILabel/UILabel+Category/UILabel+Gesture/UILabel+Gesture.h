//
//  UILabel+Gesture.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UILABEL_GESTURE_A652C744E8
#define JOBS_HEADER_GUARD_UILABEL_GESTURE_A652C744E8

#import <UIKit/UIKit.h>

#if __has_include(<ReactiveObjC/RACmetamacros.h>)
#import <ReactiveObjC/RACmetamacros.h>
#else
#import "RACmetamacros.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTScope.h>)
#import <ReactiveObjC/RACEXTScope.h>
#else
#import "RACEXTScope.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTKeyPathCoding.h>)
#import <ReactiveObjC/RACEXTKeyPathCoding.h>
#else
#import "RACEXTKeyPathCoding.h"
#endif

//#if __has_include(<ReactiveObjC/RACEXTRuntimeExtensions.h>)
//#import <ReactiveObjC/RACEXTRuntimeExtensions.h>
//#else
//#import "RACEXTRuntimeExtensions.h"
//#endif

#import "JobsOCRuntimeKits.h"

#import "JobsLanMgr.h"

#import "JobsOCDSL.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Gesture)

-(void)makeLabelGesture;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UILABEL_GESTURE_A652C744E8 */
