//
//  ZFPlayerExtra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_ZFPLAYEREXTRA_8DD8D35B7E
#define JOBS_HEADER_GUARD_ZFPLAYEREXTRA_8DD8D35B7E

#import <Foundation/Foundation.h>
#import <TargetConditionals.h>
#import <ZFPlayerExtra/ZFDouYinControlView.h>
#import <ZFPlayerExtra/ZFDouYinControlView+DSL.h>
#import <ZFPlayerExtra/ZFAVPlayerManager+ZFPlayerExtraDSL.h>
#import <ZFPlayerExtra/ZFIJKPlayerManager+ZFPlayerExtraDSL.h>

#if __has_include(<ZFPlayer/ZFPlayer.h>)
#import <ZFPlayer/ZFPlayer.h>
#else
#import "ZFPlayer.h"
#endif

#if __has_include(<ZFPlayer/ZFAVPlayerManager.h>)
#import <ZFPlayer/ZFAVPlayerManager.h>
#else
#import "ZFAVPlayerManager.h"
#endif

#if !TARGET_OS_SIMULATOR && __has_include(<IJKMediaFramework/IJKMediaFramework.h>) && __has_include(<ZFPlayer/ZFIJKPlayerManager.h>)
#import <ZFPlayer/ZFIJKPlayerManager.h>
#else
#if !TARGET_OS_SIMULATOR && __has_include(<IJKMediaFramework/IJKMediaFramework.h>)
#import <ZFPlayerExtra/ZFIJKPlayerManager.h>
#endif
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

@interface ZFPlayerExtra : NSObject

@end

NS_ASSUME_NONNULL_END

#if __has_include(<ZFPlayer/ZFAVPlayerManager.h>)
NS_INLINE __kindof ZFAVPlayerManager *_Nonnull jobsMakeZFAVPlayerManager(jobsByZFAVPlayerManagerBlock _Nonnull block){
    ZFAVPlayerManager *data = ZFAVPlayerManager.alloc.init;
    if (block) block(data);
    return data;
}
#endif

#if !TARGET_OS_SIMULATOR && __has_include(<IJKMediaFramework/IJKMediaFramework.h>) && __has_include(<ZFPlayer/ZFIJKPlayerManager.h>)
NS_INLINE __kindof ZFIJKPlayerManager *_Nonnull jobsMakeZFIJKPlayerManager(jobsByZFIJKPlayerManagerBlock _Nonnull block){
    ZFIJKPlayerManager *data = ZFIJKPlayerManager.alloc.init;
    if (block) block(data);
    return data;
}
#endif

NS_INLINE __kindof ZFDouYinControlView *_Nonnull jobsMakeZFDouYinControlView(jobsByZFDouYinControlViewBlock _Nonnull block){
    ZFDouYinControlView *data = ZFDouYinControlView.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_ZFPLAYEREXTRA_8DD8D35B7E */
