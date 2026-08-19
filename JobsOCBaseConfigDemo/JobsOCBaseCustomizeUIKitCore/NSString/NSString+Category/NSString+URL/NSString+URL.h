//
//  NSString+URL.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_URL_B86BE4709F
#define JOBS_HEADER_GUARD_NSSTRING_URL_B86BE4709F

#pragma once

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "NSString+Sys.h"
#import "NSURLRequest+Extra.h"
#import "NSString+Replace.h"
#import "JobsStringUtilsHeader.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (URL)
/// 返回网址相关的NSURL *
-(NSURL *)jobsUrl;
-(JobsRetURLByVoidBlock _Nonnull)jobsURL;
/// NSString => NSURLRequest
-(NSMutableURLRequest *)URLRequest;
-(JobsRetMutableURLRequestByVoidBlock _Nonnull)jobsURLRequest;
/// 返回文件路径相关的NSURL *
/// 增加file://
-(JobsRetURLByVoidBlock _Nonnull)jobsFileUrl;
///  能否正常打开Url
-(JobsRetBOOLByVoidBlock _Nonnull)jobsCanOpenUrl;
/**

     问题：直接其他地方复制过来的中文字进行网页搜索、或者中文字识别排序等情况的，会出现搜索不到的情况。
     解决方法：可能存在复制源里面的文字带了空白url编码%E2%80%8B，空白编码没有宽度，虽然看不到但是会影响结果无法正确匹配对应的中文字。可以把文字重新url编码即可。
 */
-(NSString *)urlProtect;
-(JobsRetStrByVoidBlock _Nonnull)jobsURLProtect;

-(NSString *)byHttp;
-(JobsRetStrByVoidBlock _Nonnull)jobsByHttp;

-(NSString *)byHttps;
-(JobsRetStrByVoidBlock _Nonnull)jobsByHttps;
/// 图片URL路径补齐
-(NSString *)imageURLPlus;
-(JobsRetStrByVoidBlock _Nonnull)jobsImageURLPlus;
/// 一般的URL路径补齐
-(JobsRetStrByVoidBlock _Nonnull)normalURLPlus;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_URL_B86BE4709F */
