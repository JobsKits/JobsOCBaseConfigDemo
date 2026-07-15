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
#import "NSString+Extra.h"
#import "NSString+Sys.h"
#import "JobsStringUtilsHeader.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Image)
/// 获取本地普通图像
Prop_strong(readonly,nullable)UIImage *img;    // -(nullable UIImage *)img;
-(JobsRetImageByStrBlock _Nonnull)imageByDataURL;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_IMAGE_EC1078C9A1 */
