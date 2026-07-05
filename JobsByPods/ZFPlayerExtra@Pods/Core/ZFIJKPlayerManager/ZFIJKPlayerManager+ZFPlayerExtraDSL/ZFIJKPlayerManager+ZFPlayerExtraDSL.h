//
//  ZFIJKPlayerManager+ZFPlayerExtraDSL.h
//  ZFPlayerExtra
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#ifndef JOBS_HEADER_GUARD_ZFIJKPLAYERMANAGER_ZFPLAYEREXTRADSL_C79D275D02
#define JOBS_HEADER_GUARD_ZFIJKPLAYERMANAGER_ZFPLAYEREXTRADSL_C79D275D02

#import <UIKit/UIKit.h>
#import <TargetConditionals.h>

#if !TARGET_OS_SIMULATOR && __has_include(<IJKMediaFramework/IJKMediaFramework.h>) && __has_include(<ZFPlayer/ZFIJKPlayerManager.h>)
#import <ZFPlayer/ZFIJKPlayerManager.h>
#elif !TARGET_OS_SIMULATOR && __has_include(<IJKMediaFramework/IJKMediaFramework.h>) && __has_include("ZFIJKPlayerManager.h")
#import "ZFIJKPlayerManager.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if !TARGET_OS_SIMULATOR && __has_include(<IJKMediaFramework/IJKMediaFramework.h>) && (__has_include(<ZFPlayer/ZFIJKPlayerManager.h>) || __has_include("ZFIJKPlayerManager.h"))
NS_ASSUME_NONNULL_BEGIN

typedef __kindof ZFIJKPlayerManager *_Nullable(^JobsRetZFIJKPlayerManagerByURLBlock)(NSURL *_Nullable data);
typedef __kindof ZFIJKPlayerManager *_Nullable(^JobsRetZFIJKPlayerManagerByViewBlock)(ZFPlayerView *_Nullable data);
typedef __kindof ZFIJKPlayerManager *_Nullable(^JobsRetZFIJKPlayerManagerByFloatBlock)(float data);
typedef __kindof ZFIJKPlayerManager *_Nullable(^JobsRetZFIJKPlayerManagerByBOOLBlock)(BOOL data);
typedef __kindof ZFIJKPlayerManager *_Nullable(^JobsRetZFIJKPlayerManagerByPlaybackTimeBlock)(NSTimeInterval data);
typedef __kindof ZFIJKPlayerManager *_Nullable(^JobsRetZFIJKPlayerManagerByScalingModeBlock)(ZFPlayerScalingMode data);
typedef __kindof ZFIJKPlayerManager *_Nullable(^JobsRetZFIJKPlayerManagerByCGSizeBlock)(CGSize data);
typedef __kindof ZFIJKPlayerManager *_Nullable(^JobsRetZFIJKPlayerManagerByMediaURLBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL));
typedef __kindof ZFIJKPlayerManager *_Nullable(^JobsRetZFIJKPlayerManagerByPlayTimeBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval currentTime, NSTimeInterval duration));
typedef __kindof ZFIJKPlayerManager *_Nullable(^JobsRetZFIJKPlayerManagerByBufferTimeBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval bufferTime));
typedef __kindof ZFIJKPlayerManager *_Nullable(^JobsRetZFIJKPlayerManagerByPlaybackStateBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerPlaybackState playState));
typedef __kindof ZFIJKPlayerManager *_Nullable(^JobsRetZFIJKPlayerManagerByLoadStateBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerLoadState loadState));
typedef __kindof ZFIJKPlayerManager *_Nullable(^JobsRetZFIJKPlayerManagerByMediaErrorBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, id error));
typedef __kindof ZFIJKPlayerManager *_Nullable(^JobsRetZFIJKPlayerManagerByMediaBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset));
typedef __kindof ZFIJKPlayerManager *_Nullable(^JobsRetZFIJKPlayerManagerByPresentationSizeBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, CGSize size));
typedef __kindof ZFIJKPlayerManager *_Nullable(^JobsRetZFIJKPlayerManagerByImageBlock)(void (^ _Nullable data)(UIImage *image));
typedef __kindof ZFIJKPlayerManager *_Nullable(^JobsRetZFIJKPlayerManagerByTimeIntervalBlock)(NSTimeInterval data);

@interface ZFIJKPlayerManager (ZFPlayerExtraDSL)

-(JobsRetZFIJKPlayerManagerByURLBlock _Nonnull)byAssetURL;
-(JobsRetZFIJKPlayerManagerByViewBlock _Nonnull)byView;
-(JobsRetZFIJKPlayerManagerByFloatBlock _Nonnull)byVolume;
-(JobsRetZFIJKPlayerManagerByBOOLBlock _Nonnull)byMuted;
-(JobsRetZFIJKPlayerManagerByFloatBlock _Nonnull)byRate;
-(JobsRetZFIJKPlayerManagerByPlaybackTimeBlock _Nonnull)bySeekTime;
-(JobsRetZFIJKPlayerManagerByScalingModeBlock _Nonnull)byScalingMode;
-(JobsRetZFIJKPlayerManagerByBOOLBlock _Nonnull)byShouldAutoPlay;
-(JobsRetZFIJKPlayerManagerByCGSizeBlock _Nonnull)byPresentationSize;
-(JobsRetZFIJKPlayerManagerByTimeIntervalBlock _Nonnull)byTimeRefreshInterval;

-(__kindof ZFIJKPlayerManager *_Nonnull)byPrepareToPlay;
-(__kindof ZFIJKPlayerManager *_Nonnull)byReloadPlayer;
-(__kindof ZFIJKPlayerManager *_Nonnull)byPlay;
-(__kindof ZFIJKPlayerManager *_Nonnull)byPause;
-(__kindof ZFIJKPlayerManager *_Nonnull)byReplay;
-(__kindof ZFIJKPlayerManager *_Nonnull)byStop;
-(JobsRetZFIJKPlayerManagerByImageBlock _Nonnull)byThumbnailImageAtCurrentTime;

-(JobsRetZFIJKPlayerManagerByMediaURLBlock _Nonnull)onPrepareToPlay;
-(JobsRetZFIJKPlayerManagerByMediaURLBlock _Nonnull)onReadyToPlay;
-(JobsRetZFIJKPlayerManagerByPlayTimeBlock _Nonnull)onPlayTimeChanged;
-(JobsRetZFIJKPlayerManagerByBufferTimeBlock _Nonnull)onBufferTimeChanged;
-(JobsRetZFIJKPlayerManagerByPlaybackStateBlock _Nonnull)onPlayStateChanged;
-(JobsRetZFIJKPlayerManagerByLoadStateBlock _Nonnull)onLoadStateChanged;
-(JobsRetZFIJKPlayerManagerByMediaErrorBlock _Nonnull)onPlayFailed;
-(JobsRetZFIJKPlayerManagerByMediaBlock _Nonnull)onPlayDidEnd;
-(JobsRetZFIJKPlayerManagerByPresentationSizeBlock _Nonnull)onPresentationSizeChanged;

@end

NS_ASSUME_NONNULL_END
#endif
#endif /* JOBS_HEADER_GUARD_ZFIJKPLAYERMANAGER_ZFPLAYEREXTRADSL_C79D275D02 */
