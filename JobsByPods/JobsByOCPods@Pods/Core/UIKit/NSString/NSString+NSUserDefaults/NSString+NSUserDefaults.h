//
//  NSString+NSUserDefaults.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_NSUSERDEFAULTS_7C27C7EDC6
#define JOBS_HEADER_GUARD_NSSTRING_NSUSERDEFAULTS_7C27C7EDC6

#import <Foundation/Foundation.h>

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
/// NSUserDefaults相关
@interface NSString (NSUserDefaults)
#pragma mark —— 存值
/// 保存 BOOL 值
-(jobsByBOOLBlock _Nonnull)userDefaultsByBOOL;
/// 保存 Object 值
-(jobsByIDBlock _Nonnull)userDefaultsByObj;
/// 保存 NSInteger 值
-(jobsByNSIntegerBlock _Nonnull)userDefaultsByInteger;
/// 保存 float 值
-(jobsByFloatBlock _Nonnull)userDefaultsByFloat;
/// 保存 double 值
-(jobsByDoubleBlock _Nonnull)userDefaultsByDouble;
/// 保存 NSURL 值
-(jobsByURLBlock _Nonnull)userDefaultsByURL;
#pragma mark —— 取值
/// 读取 BOOL 值
-(JobsRetBOOLByVoidBlock _Nonnull)boolBy;
/// 读取 NSInteger 值
-(JobsRetNSIntegerByVoidBlock _Nonnull)integerBy;
/// 读取 float 值
-(JobsRetFloatByVoidBlock _Nonnull)floatBy;
/// 读取 double 值
-(JobsRetDoubleByVoidBlock _Nonnull)doubleBy;
/// 读取 double 值
-(JobsRetURLByVoidBlock _Nonnull)urlBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_NSUSERDEFAULTS_7C27C7EDC6 */
