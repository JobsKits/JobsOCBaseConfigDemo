//
//  NSString+URL.h
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_URL_B649C4118E
#define JOBS_HEADER_GUARD_NSSTRING_URL_B649C4118E

#pragma once

#import <Foundation/Foundation.h>
#import <JobsAPIs/NSString+Extra.h>

#if __has_include(<JobsDeviceInfo/JobsDeviceInfo.h>)
#import <JobsDeviceInfo/JobsDeviceInfo.h>
#else
#import "JobsDeviceInfo.h"
#endif

#if __has_include(<JobsStringUtils/JobsStringUtils.h>)
#import <JobsStringUtils/JobsStringUtils.h>
#else
#import "JobsStringUtils.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSString (URL)
/// 返回网址相关的NSURL *
-(NSURL *_Nonnull)jobsUrl;
/// NSString => NSURLRequest
-(NSMutableURLRequest *_Nonnull)URLRequest;
/// 返回文件路径相关的NSURL *
/// 增加file://
-(NSURL *_Nonnull)jobsFileUrl;
///  能否正常打开Url
-(BOOL)jobsCanOpenUrl;
/**

     问题：直接其他地方复制过来的中文字进行网页搜索、或者中文字识别排序等情况的，会出现搜索不到的情况。
     解决方法：可能存在复制源里面的文字带了空白url编码%E2%80%8B，空白编码没有宽度，虽然看不到但是会影响结果无法正确匹配对应的中文字。可以把文字重新url编码即可。
 */
-(NSString *_Nonnull)urlProtect;

-(NSString *_Nonnull)byHttp;

-(NSString *_Nonnull)byHttps;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_URL_B649C4118E */
