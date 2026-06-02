//
//  NSObject+image.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_IMAGE_8409C017BB
#define JOBS_HEADER_GUARD_NSOBJECT_IMAGE_8409C017BB

#pragma once

#import <UIKit/UIKit.h>
#import <JobsBaseUI/NSString+URL.h>
#import <JobsBaseUI/UIImage+YBGIF.h>
#import <JobsBaseUI/NSString+Check.h>

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

@interface NSObject (image)
/// 获取本地普通图像
Prop_strong(readonly,nullable)UIImage *img;    // -(nullable UIImage *)img;
/// 获取本地GIF图像
Prop_strong(readonly,nullable)UIImage *gif_img;// -(nullable UIImage *)gif_img;
/// 获取系统内置图像
Prop_strong(readonly,nullable)UIImage *sys_img;// -(nullable UIImage *)sys_img;
/// 获取网络图像
-(void)fetchImageByPlaceholder:(UIImage *)placeholder
                    completion:(jobsByImageBlock _Nullable)completion;

-(JobsRetImageByStrBlock _Nonnull)imageByDataURL;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_IMAGE_8409C017BB */
