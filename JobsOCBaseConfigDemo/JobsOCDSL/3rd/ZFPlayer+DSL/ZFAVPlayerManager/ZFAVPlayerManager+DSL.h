//
//  ZFAVPlayerManager+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_ZFAVPLAYERMANAGER_DSL_EB61DDA93B
#define JOBS_HEADER_GUARD_ZFAVPLAYERMANAGER_DSL_EB61DDA93B

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

#if __has_include(<ZFPlayer/ZFAVPlayerManager.h>)
#import <ZFPlayer/ZFAVPlayerManager.h>
#else
#import "ZFAVPlayerManager.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN


@interface ZFAVPlayerManager (DSL)

-(JobsRetZFAVPlayerManagerByTimeIntervalBlock _Nonnull)byTimeRefreshInterval;
-(JobsRetZFAVPlayerManagerByDictionaryBlock _Nonnull)byRequestHeader;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_ZFAVPLAYERMANAGER_DSL_EB61DDA93B */
