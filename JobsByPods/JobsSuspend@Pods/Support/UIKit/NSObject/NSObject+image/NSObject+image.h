//
//  NSObject+image.h
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_IMAGE_934747C82F
#define JOBS_HEADER_GUARD_NSOBJECT_IMAGE_934747C82F

#pragma once

#import <UIKit/UIKit.h>
#import <JobsSuspend/NSString+Sys.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (image)

Prop_strong(readonly,nullable)UIImage *img;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_IMAGE_934747C82F */
