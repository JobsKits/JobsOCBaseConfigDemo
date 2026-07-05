//
//  NSObject+Image.h
//  JobsAppTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_IMAGE_EC1078C9A1
#define JOBS_HEADER_GUARD_NSOBJECT_IMAGE_EC1078C9A1

#pragma once

#import <Foundation/Foundation.h>
#import <JobsAppTools/NSString+Extra.h>
#import <JobsAppTools/NSString+Sys.h>

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

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Image)
/// 获取本地普通图像
Prop_strong(readonly,nullable)UIImage *img;    // -(nullable UIImage *)img;
-(JobsRetImageByStrBlock _Nonnull)imageByDataURL;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_IMAGE_EC1078C9A1 */
