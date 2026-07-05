//
//  NSObject+Extra.h
//  JobsOCDSL Support
//
//  Migrated from JobsByOCPods on 2026年6月10日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_EXTRA_9D07F63D88
#define JOBS_HEADER_GUARD_NSOBJECT_EXTRA_9D07F63D88

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Extra)<BaseProtocol>

/// 手势迁移所需的弱目标对象。未显式设置时，默认返回 self。
Prop_weak(nullable)id weak_target;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_EXTRA_9D07F63D88 */
