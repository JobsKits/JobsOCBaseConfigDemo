//
//  NSObject+ChangeAppicon.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_CHANGEAPPICON_4BAC838A67
#define JOBS_HEADER_GUARD_NSOBJECT_CHANGEAPPICON_4BAC838A67

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <JobsByOCPods/NSMutableArray+Extra.h>

#if __has_include(<WHToastExtra/WHToastExtra.h>)
#import <WHToastExtra/WHToastExtra.h>
#else
#import "WHToastExtra.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/**

    参考资料：https://github.com/maybeisyi/ChangeAppIconDemo
    https://www.jianshu.com/p/69313970d0e7
 */
@interface NSObject (ChangeAppicon)
/// 测试App更改图标
-(jobsByVoidBlock _Nonnull)testChangeAppicon;
/// App更改图标核心代码
-(jobsByStrBlock _Nonnull)setAppIconWithName;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_CHANGEAPPICON_4BAC838A67 */
