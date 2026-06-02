//
//  NSString+Toast.h
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_TOAST_912BFA75FD
#define JOBS_HEADER_GUARD_NSSTRING_TOAST_912BFA75FD

#import <Foundation/Foundation.h>

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

@interface NSString (Toast)

-(jobsByVoidBlock _Nonnull)toast;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_TOAST_912BFA75FD */
