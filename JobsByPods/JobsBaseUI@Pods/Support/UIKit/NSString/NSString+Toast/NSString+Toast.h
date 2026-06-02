//
//  NSString+Toast.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月18日，星期一.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_TOAST_4E5BDEA272
#define JOBS_HEADER_GUARD_NSSTRING_TOAST_4E5BDEA272

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
#endif /* JOBS_HEADER_GUARD_NSSTRING_TOAST_4E5BDEA272 */
