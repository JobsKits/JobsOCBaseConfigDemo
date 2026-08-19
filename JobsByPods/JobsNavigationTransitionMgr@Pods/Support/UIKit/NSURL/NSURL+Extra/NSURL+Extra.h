//
//  NSURL+Extra.h
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSURL_EXTRA_D4023D52F3
#define JOBS_HEADER_GUARD_NSURL_EXTRA_D4023D52F3

#pragma once

#import <Foundation/Foundation.h>
#import <JobsNavigationTransitionMgr/NSURLRequest+Extra.h>
#import <JobsNavigationTransitionMgr/NSString+Check.h>
#import <JobsNavigationTransitionMgr/NSString+Replace.h>
#import <JobsNavigationTransitionMgr/NSString+URL.h>

#if __has_include(<This/ThisHeader.h>)
#import <This/ThisHeader.h>
#else
#import "ThisHeader.h"
#endif

#if __has_include(<JobsStringUtils/JobsStringUtilsHeader.h>)
#import <JobsStringUtils/JobsStringUtilsHeader.h>
#else
#import "JobsStringUtilsHeader.h"
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

@interface This (JobsNavigationTransitionMgrURL)

+(JobsRetStrByVoidBlock _Nonnull)BaseUrl_Image;

@end

@interface NSURL (Extra)
/// 对系统方法 fileURLWithPath 的二次封装
+(JobsRetURLByStrBlock _Nonnull)fileURLWithPath;
///  能否正常打开Url
-(JobsRetBOOLByVoidBlock _Nonnull)jobsCanOpenUrl;
/// 一般的URL路径补齐
-(JobsRetURLByVoidBlock _Nonnull)normalURLPlus;
/// NSString + NSURL => NSURL
-(JobsRetURLByStrBlock _Nonnull)add;
/// NSURL + NSURL => NSURL
-(JobsRetURLByURLBlock _Nonnull)Add;
/// NSURL => NSMutableURLRequest
-(NSMutableURLRequest *)URLRequest;
-(JobsRetMutableURLRequestByVoidBlock _Nonnull)jobsURLRequest;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSURL_EXTRA_D4023D52F3 */
