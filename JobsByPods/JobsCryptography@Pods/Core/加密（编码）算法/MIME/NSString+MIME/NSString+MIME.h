//
//  NSString+MIME.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_MIME_AAB8BB339E
#define JOBS_HEADER_GUARD_NSSTRING_MIME_AAB8BB339E

#import <UIKit/UIKit.h>
#import <JobsCryptography/NSData+MIME.h>

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
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

@interface NSString (MIME)
#pragma mark —— MIME编码的数据 <==> NSString对象
///【类方法】以MIME编码的字符串数据 转换成 普通NSString对象
+(JobsRetStrByStrBlock _Nonnull)stringByMIMEData;
///【实例方法】以MIME编码的字符串数据 转换成 普通NSString对象
-(JobsRetStrByVoidBlock _Nonnull)mimeData;
#pragma mark —— MIME编码的数据 ==> NSData对象
///【类方法】以MIME编码的数据 转换成 NSData对象
+(JobsRetDataByStrBlock _Nonnull)dataByMIMEString;
///【实例方法】以MIME编码的数据 转换成 NSData对象
-(JobsRetDataByVoidBlock _Nonnull)dataByMIMEString;
#pragma mark —— MIME编码的数据 ==> UIImage对象
///【类方法】以MIME编码的数据 转换成 UIImage对象
+(JobsRetImageByStrBlock _Nonnull)imageByMIMEString;
///【实例方法】以MIME编码的数据 转换成 UIImage对象
-(JobsRetImageByVoidBlock _Nonnull)imageByMIMEString;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_MIME_AAB8BB339E */
