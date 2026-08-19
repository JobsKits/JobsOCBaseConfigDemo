//
//  ZFAVPlayerManager+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_ZFAVPLAYERMANAGER_DSL_EB61DDA93B
#define JOBS_HEADER_GUARD_ZFAVPLAYERMANAGER_DSL_EB61DDA93B

#import <Foundation/Foundation.h>

#if __has_include(<ZFPlayer/ZFAVPlayerManager.h>)
#import <ZFPlayer/ZFAVPlayerManager.h>
#else
#import "ZFAVPlayerManager.h"
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

@interface ZFAVPlayerManager (DSL)

-(JobsRetZFAVPlayerManagerByTimeIntervalBlock _Nonnull)byTimeRefreshInterval;
-(JobsRetZFAVPlayerManagerByDictionaryBlock _Nonnull)byRequestHeader;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN ZFAVPlayerManager
-(JobsRetZFAVPlayerManagerByvoidIDZFPlayerMediaPlaybackassetBlock _Nonnull)byPlayerDidToEnd;
-(JobsRetZFAVPlayerManagerByvoidIDZFPlayerMediaPlaybackassetCGSizesizeBlock _Nonnull)byPresentationSizeChanged;
-(JobsRetZFAVPlayerManagerByvoidIDZFPlayerMediaPlaybackassetNSTimeIntervalbufferTimeBlock _Nonnull)byPlayerBufferTimeChanged;
-(JobsRetZFAVPlayerManagerByvoidIDZFPlayerMediaPlaybackassetNSTimeIntervalcurrentTimebff1d962bBlock _Nonnull)byPlayerPlayTimeChanged;
-(JobsRetZFAVPlayerManagerByvoidIDZFPlayerMediaPlaybackassetNSURLassetURLBlock _Nonnull)byPlayerPrepareToPlay;
-(JobsRetZFAVPlayerManagerByvoidIDZFPlayerMediaPlaybackassetNSURLassetURLBlock _Nonnull)byPlayerReadyToPlay;
-(JobsRetZFAVPlayerManagerByvoidIDZFPlayerMediaPlaybackassetZFPlayerLoadStateloadStateBlock _Nonnull)byPlayerLoadStateChanged;
-(JobsRetZFAVPlayerManagerByvoidIDZFPlayerMediaPlaybackassetZFPlayerPlaybackStateplayStateBlock _Nonnull)byPlayerPlayStateChanged;
-(JobsRetZFAVPlayerManagerByvoidIDZFPlayerMediaPlaybackassetiderrorBlock _Nonnull)byPlayerPlayFailed;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END ZFAVPlayerManager
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_ZFAVPLAYERMANAGER_DSL_EB61DDA93B */
