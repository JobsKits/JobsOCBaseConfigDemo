//
//  NSBundle+Extra.h
//  JobsLanMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSBUNDLE_EXTRA_F398291EE3
#define JOBS_HEADER_GUARD_NSBUNDLE_EXTRA_F398291EE3

#pragma once

#import <Foundation/Foundation.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (Extra)

+(JobsRetBundleByStrBlock _Nonnull)initByPath;
+(JobsRetBundleByURLBlock _Nonnull)initByURL;
+(JobsRetBundleByClsBlock _Nonnull)initByCls;
+(JobsRetBundleByStrBlock _Nonnull)initByID;

-(JobsRetIDByStrBlock _Nonnull)objectForInfoDictionaryKey;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSBUNDLE_EXTRA_F398291EE3 */
