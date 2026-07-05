//
//  NSString+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_EXTRA_7F4EFC602C
#define JOBS_HEADER_GUARD_NSSTRING_EXTRA_7F4EFC602C

#import <Foundation/Foundation.h>
#import <JobsByOCPods/UIColor+Extra.h>
#import <JobsByOCPods/NSString+Check.h>

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<WHToastExtra/WHToastExtra.h>)
#import <WHToastExtra/WHToastExtra.h>
#else
#import "WHToastExtra.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsStringUtils/JobsStringUtilsHeader.h>)
#import <JobsStringUtils/JobsStringUtilsHeader.h>
#else
#import "JobsStringUtilsHeader.h"
#endif

#if __has_include(<JobsAPIs/JobsAPIs.h>)
#import <JobsAPIs/JobsAPIs.h>
#else
#import "JobsAPIs.h"
#endif

#if __has_include(<This/ThisHeader.h>)
#import <This/ThisHeader.h>
#else
#import "ThisHeader.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JobsByOCPodsExtra)

-(UIColor *)cor;
/// 图片URL路径补齐
-(NSString *_Nullable)imageURLPlus;
/// 一般的URL路径补齐
-(NSString *_Nullable)normalURLPlus;
/// 清除 SDImage 的图片缓存（用 url 为 key）
-(void)cleanSDImageCache:(SDWebImageNoParamsBlock _Nullable)block;
/// 复制到系统剪切板
-(JobsRetStrByVoidBlock _Nonnull)pasteboard;
/// 完整的文件名提取普通文件名和文件后缀名
- (JobsRetFileNameModelByStrBlock _Nonnull)byFileFullName;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_EXTRA_7F4EFC602C */
