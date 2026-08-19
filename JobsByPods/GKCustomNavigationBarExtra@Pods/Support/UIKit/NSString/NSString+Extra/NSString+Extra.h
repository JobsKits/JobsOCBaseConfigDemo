//
//  NSString+Extra.h
//  GKCustomNavigationBarExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_EXTRA_135B0F8342
#define JOBS_HEADER_GUARD_NSSTRING_EXTRA_135B0F8342

#import <Foundation/Foundation.h>
#import <GKCustomNavigationBarExtra/UIColor+Extra.h>
#import <GKCustomNavigationBarExtra/NSString+Check.h>

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

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
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

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsSystemAPIDSLSupplement.h>)
#import <JobsOCDSL/JobsSystemAPIDSLSupplement.h>
#else
#import "JobsSystemAPIDSLSupplement.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface This (GKCustomNavigationBarExtraURL)

+(NSString *)BaseUrl;
+(JobsRetStrByVoidBlock _Nonnull)jobsBaseUrl;
+(JobsRetStrByVoidBlock _Nonnull)BaseUrl_Image;

@end

@interface NSString (Extra)

-(UIColor *)cor;
-(JobsRetCorByVoidBlock _Nonnull)jobsCor;
/// 图片URL路径补齐
-(NSString *)imageURLPlus;
-(JobsRetStrByVoidBlock _Nonnull)jobsImageURLPlus;
/// 一般的URL路径补齐
-(JobsRetStrByVoidBlock _Nonnull)normalURLPlus;
/// 清除 SDImage 的图片缓存（用 url 为 key）
-(jobsBySDWebImageNoParamsBlockBlock _Nonnull)cleanSDImageCache;
/// 复制到系统剪切板
-(JobsRetStrByVoidBlock _Nonnull)pasteboard;
/// OC字符串拼接
-(JobsRetStrByStrBlock _Nonnull)add;
/// 完整的文件名提取普通文件名和文件后缀名
- (JobsRetFileNameModelByStrBlock _Nonnull)byFileFullName;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_EXTRA_135B0F8342 */
