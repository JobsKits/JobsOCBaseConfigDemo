//
//  NSString+Extra.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_EXTRA_26FE0D9AD6
#define JOBS_HEADER_GUARD_NSSTRING_EXTRA_26FE0D9AD6

#pragma once

#import <Foundation/Foundation.h>
#import <JobsBaseUI/NSString+Sys.h>

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
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

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsStringUtils/JobsStringUtils.h>)
#import <JobsStringUtils/JobsStringUtils.h>
#else
#import "JobsStringUtils.h"
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

@interface NSString (Extra)
/// 获取一行字符串的高度
/// 这个方法仅计算文本本身的高度，不包括行间距等因素
-(JobsRetCGFloatByFontBlock _Nonnull)widthBy;

-(JobsRetBOOLByIDBlock _Nonnull)isEqualToString;
/// 字符串是否包含URL【返回YES包含】
-(BOOL)isContainsUrl;
/// 完整的文件名提取普通文件名和文件后缀名
-(JobsRetFileNameModelByFileFullNameStringBlock _Nonnull)byFileFullName;

-(NSString *)pathForResourceWithFullName;
/// 返回网址相关的NSURL *
-(NSURL *_Nonnull)jobsUrl;
/// 对系统方法 stringByTrimmingCharactersInSet 的二次封装
-(JobsRetStrByCharacterSetBlock _Nonnull)byTrimmingCharactersInSet;
/// OC字符串拼接
-(JobsRetStrByStrBlock _Nonnull)add;
#pragma mark —— 动画相关
/// 创建CABasicAnimation
-(CABasicAnimation *)basicAnimation;
/// 创建CAKeyframeAnimation（关键帧动画）
-(CAKeyframeAnimation *)keyframeAnimation;
-(CAMediaTimingFunction *)makeCAMediaTimingFunction;
-(CAKeyframeAnimation *)makeCAKeyframeAnimationByBlock:(jobsByCAKeyframeAnimationBlock _Nonnull)block;
-(CABasicAnimation *)makeCABasicAnimationByBlock:(jobsByCABasicAnimationBlock _Nonnull)block;
/// 服务器请求的数据为空值的时候进行替换本地默认值
/// 因为json传输是通过对象包装来进行，所以其实归结起来就是2类，一类是基本数据类型被包装成Number、其他包装成String
/// @param nullableString 进行检查的资源
/// @param replaceString 进行替换的备用文字资源
+(NSString *)nullableString:(id)nullableString
              replaceString:(NSString *)replaceString;
-(NSData *_Nullable)UTF8Encoding;
/// 清除 SDImage 的图片缓存（用 url 为 key）
-(void)cleanSDImageCache:(SDWebImageNoParamsBlock _Nullable)block;
/// 复制到系统剪切板
-(JobsRetStrByVoidBlock _Nonnull)pasteboard;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_EXTRA_26FE0D9AD6 */
