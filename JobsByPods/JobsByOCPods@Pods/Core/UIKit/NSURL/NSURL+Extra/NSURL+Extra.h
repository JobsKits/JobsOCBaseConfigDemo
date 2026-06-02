//
//  NSURL+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSURL_EXTRA_B3B37E2DEB
#define JOBS_HEADER_GUARD_NSURL_EXTRA_B3B37E2DEB

#import <Foundation/Foundation.h>
#import <JobsByOCPods/NSURLRequest+Extra.h>

#if __has_include(<JobsStringUtils/JobsStringUtils.h>)
#import <JobsStringUtils/JobsStringUtils.h>
#else
#import "JobsStringUtils.h"
#endif

#if __has_include(<This/This.h>)
#import <This/This.h>
#else
#import "This.h"
#endif

#if __has_include(<JobsAPIs/JobsAPIs.h>)
#import <JobsAPIs/JobsAPIs.h>
#else
#import "JobsAPIs.h"
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

@interface NSURL (Extra)
/// 对系统方法 fileURLWithPath 的二次封装
+(JobsRetURLByStrBlock _Nonnull)fileURLWithPath;
///  能否正常打开Url
-(BOOL)jobsCanOpenUrl;
/// 一般的URL路径补齐
-(NSURL *_Nullable)normalURLPlus;
/// NSString + NSURL => NSURL
-(JobsRetURLByStrBlock _Nonnull)add;
/// NSURL + NSURL => NSURL
-(JobsRetURLByURLBlock _Nonnull)Add;
/// NSURL => NSMutableURLRequest
-(NSMutableURLRequest *)URLRequest;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSURL_EXTRA_B3B37E2DEB */
