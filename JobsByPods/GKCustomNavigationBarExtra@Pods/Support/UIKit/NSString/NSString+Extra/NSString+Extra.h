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

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

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

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface This (GKCustomNavigationBarExtraURL)

+(NSString *_Nullable)BaseUrl;
+(NSString *_Nullable)BaseUrl_Image;

@end

@interface NSString (Extra)

-(UIColor *)cor;
/// 图片URL路径补齐
-(NSString *_Nullable)imageURLPlus;
/// 一般的URL路径补齐
-(NSString *_Nullable)normalURLPlus;
/// 清除 SDImage 的图片缓存（用 url 为 key）
-(void)cleanSDImageCache:(SDWebImageNoParamsBlock _Nullable)block;
/// 复制到系统剪切板
-(JobsRetStrByVoidBlock _Nonnull)pasteboard;
/// OC字符串拼接
-(JobsRetStrByStrBlock _Nonnull)add;
/// 完整的文件名提取普通文件名和文件后缀名
- (JobsRetFileNameModelByFileFullNameStringBlock _Nonnull)byFileFullName;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_EXTRA_135B0F8342 */
