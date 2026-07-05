//
//  ZFAVPlayerManager+ZFPlayerExtraDSL.h
//  ZFPlayerExtra
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#ifndef JOBS_HEADER_GUARD_ZFAVPLAYERMANAGER_ZFPLAYEREXTRADSL_57FA1A9D2D
#define JOBS_HEADER_GUARD_ZFAVPLAYERMANAGER_ZFPLAYEREXTRADSL_57FA1A9D2D

#import <UIKit/UIKit.h>

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

typedef __kindof ZFAVPlayerManager *_Nullable(^JobsRetZFAVPlayerManagerByURLBlock)(NSURL *_Nullable data);
typedef __kindof ZFAVPlayerManager *_Nullable(^JobsRetZFAVPlayerManagerByViewBlock)(ZFPlayerView *_Nullable data);
typedef __kindof ZFAVPlayerManager *_Nullable(^JobsRetZFAVPlayerManagerByFloatBlock)(float data);
typedef __kindof ZFAVPlayerManager *_Nullable(^JobsRetZFAVPlayerManagerByBOOLBlock)(BOOL data);
typedef __kindof ZFAVPlayerManager *_Nullable(^JobsRetZFAVPlayerManagerByPlaybackTimeBlock)(NSTimeInterval data);
typedef __kindof ZFAVPlayerManager *_Nullable(^JobsRetZFAVPlayerManagerByScalingModeBlock)(ZFPlayerScalingMode data);
typedef __kindof ZFAVPlayerManager *_Nullable(^JobsRetZFAVPlayerManagerByCGSizeBlock)(CGSize data);
typedef __kindof ZFAVPlayerManager *_Nullable(^JobsRetZFAVPlayerManagerByMediaURLBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL));
typedef __kindof ZFAVPlayerManager *_Nullable(^JobsRetZFAVPlayerManagerByPlayTimeBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval currentTime, NSTimeInterval duration));
typedef __kindof ZFAVPlayerManager *_Nullable(^JobsRetZFAVPlayerManagerByBufferTimeBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval bufferTime));
typedef __kindof ZFAVPlayerManager *_Nullable(^JobsRetZFAVPlayerManagerByPlaybackStateBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerPlaybackState playState));
typedef __kindof ZFAVPlayerManager *_Nullable(^JobsRetZFAVPlayerManagerByLoadStateBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerLoadState loadState));
typedef __kindof ZFAVPlayerManager *_Nullable(^JobsRetZFAVPlayerManagerByMediaErrorBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, id error));
typedef __kindof ZFAVPlayerManager *_Nullable(^JobsRetZFAVPlayerManagerByMediaBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset));
typedef __kindof ZFAVPlayerManager *_Nullable(^JobsRetZFAVPlayerManagerByPresentationSizeBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, CGSize size));
typedef __kindof ZFAVPlayerManager *_Nullable(^JobsRetZFAVPlayerManagerByImageBlock)(void (^ _Nullable data)(UIImage *image));

@interface ZFAVPlayerManager (ZFPlayerExtraDSL)

-(JobsRetZFAVPlayerManagerByURLBlock _Nonnull)byAssetURL;
-(JobsRetZFAVPlayerManagerByViewBlock _Nonnull)byView;
-(JobsRetZFAVPlayerManagerByFloatBlock _Nonnull)byVolume;
-(JobsRetZFAVPlayerManagerByBOOLBlock _Nonnull)byMuted;
-(JobsRetZFAVPlayerManagerByFloatBlock _Nonnull)byRate;
-(JobsRetZFAVPlayerManagerByPlaybackTimeBlock _Nonnull)bySeekTime;
-(JobsRetZFAVPlayerManagerByScalingModeBlock _Nonnull)byScalingMode;
-(JobsRetZFAVPlayerManagerByBOOLBlock _Nonnull)byShouldAutoPlay;
-(JobsRetZFAVPlayerManagerByCGSizeBlock _Nonnull)byPresentationSize;

-(__kindof ZFAVPlayerManager *_Nonnull)byPrepareToPlay;
-(__kindof ZFAVPlayerManager *_Nonnull)byReloadPlayer;
-(__kindof ZFAVPlayerManager *_Nonnull)byPlay;
-(__kindof ZFAVPlayerManager *_Nonnull)byPause;
-(__kindof ZFAVPlayerManager *_Nonnull)byReplay;
-(__kindof ZFAVPlayerManager *_Nonnull)byStop;
-(JobsRetZFAVPlayerManagerByImageBlock _Nonnull)byThumbnailImageAtCurrentTime;

-(JobsRetZFAVPlayerManagerByMediaURLBlock _Nonnull)onPrepareToPlay;
-(JobsRetZFAVPlayerManagerByMediaURLBlock _Nonnull)onReadyToPlay;
-(JobsRetZFAVPlayerManagerByPlayTimeBlock _Nonnull)onPlayTimeChanged;
-(JobsRetZFAVPlayerManagerByBufferTimeBlock _Nonnull)onBufferTimeChanged;
-(JobsRetZFAVPlayerManagerByPlaybackStateBlock _Nonnull)onPlayStateChanged;
-(JobsRetZFAVPlayerManagerByLoadStateBlock _Nonnull)onLoadStateChanged;
-(JobsRetZFAVPlayerManagerByMediaErrorBlock _Nonnull)onPlayFailed;
-(JobsRetZFAVPlayerManagerByMediaBlock _Nonnull)onPlayDidEnd;
-(JobsRetZFAVPlayerManagerByPresentationSizeBlock _Nonnull)onPresentationSizeChanged;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_ZFAVPLAYERMANAGER_ZFPLAYEREXTRADSL_57FA1A9D2D */
