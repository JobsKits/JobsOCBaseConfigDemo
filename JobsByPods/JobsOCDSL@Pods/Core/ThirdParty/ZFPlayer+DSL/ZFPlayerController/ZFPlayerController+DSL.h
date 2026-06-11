//
//  ZFPlayerController+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_ZFPLAYERCONTROLLER_DSL_44F11BFC9D
#define JOBS_HEADER_GUARD_ZFPLAYERCONTROLLER_DSL_44F11BFC9D

#import <UIKit/UIKit.h>

#if __has_include(<ZFPlayer/ZFPlayer.h>)
#import <ZFPlayer/ZFPlayer.h>
#else
#import "ZFPlayer.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByViewBlock)(__kindof UIView *_Nullable data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByManagerBlock)(id<ZFPlayerMediaPlayback> _Nullable data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByControlViewBlock)(__kindof UIView<ZFPlayerMediaControl> *_Nullable data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByURLBlock)(NSURL *_Nullable data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByURLsBlock)(NSArray<NSURL *> *_Nullable data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByNSIntegerBlock)(NSInteger data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByFloatBlock)(float data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByCGFloatBlock)(CGFloat data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByBOOLBlock)(BOOL data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByTimeCompletionBlock)(NSTimeInterval time, void (^ _Nullable completion)(BOOL finished));
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByOrientationBlock)(UIInterfaceOrientation orientation, BOOL animated);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByFullScreenBlock)(BOOL fullScreen, BOOL animated);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByDisableGestureBlock)(ZFPlayerDisableGestureTypes data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByDisablePanBlock)(ZFPlayerDisablePanMovingDirection data);
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByPlaybackStateBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerPlaybackState playState));
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByLoadStateBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerLoadState loadState));
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByPlayTimeBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval currentTime, NSTimeInterval duration));
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByMediaURLBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL));
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByMediaBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset));
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByMediaErrorBlock)(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, id error));
typedef __kindof ZFPlayerController *_Nullable(^JobsRetZFPlayerByOrientationChangeBlock)(void (^ _Nullable data)(ZFPlayerController *player, BOOL isFullScreen));

@interface ZFPlayerController (DSL)

-(JobsRetZFPlayerByViewBlock _Nonnull)byContainerView;
-(JobsRetZFPlayerByManagerBlock _Nonnull)byPlayerManager;
-(JobsRetZFPlayerByControlViewBlock _Nonnull)byControlView;
-(JobsRetZFPlayerByURLBlock _Nonnull)byAssetURL;
-(JobsRetZFPlayerByURLsBlock _Nonnull)byAssetURLs;
-(JobsRetZFPlayerByNSIntegerBlock _Nonnull)byCurrentPlayIndex;
-(JobsRetZFPlayerByFloatBlock _Nonnull)byVolume;
-(JobsRetZFPlayerByBOOLBlock _Nonnull)byMuted;
-(JobsRetZFPlayerByCGFloatBlock _Nonnull)byBrightness;
-(JobsRetZFPlayerByBOOLBlock _Nonnull)byShouldAutoPlay;
-(JobsRetZFPlayerByBOOLBlock _Nonnull)byPauseWhenAppResignActive;
-(JobsRetZFPlayerByBOOLBlock _Nonnull)byAllowOrientationRotation;
-(JobsRetZFPlayerByBOOLBlock _Nonnull)byExitFullScreenWhenStop;
-(JobsRetZFPlayerByBOOLBlock _Nonnull)byLockedScreen;
-(JobsRetZFPlayerByDisableGestureBlock _Nonnull)byDisableGestureTypes;
-(JobsRetZFPlayerByDisablePanBlock _Nonnull)byDisablePanMovingDirection;

-(__kindof ZFPlayerController *_Nonnull)byPlay;
-(__kindof ZFPlayerController *_Nonnull)byPause;
-(__kindof ZFPlayerController *_Nonnull)byStop;
-(__kindof ZFPlayerController *_Nonnull)byPlayNext;
-(__kindof ZFPlayerController *_Nonnull)byPlayPrevious;
-(JobsRetZFPlayerByNSIntegerBlock _Nonnull)byPlayIndex;
-(JobsRetZFPlayerByTimeCompletionBlock _Nonnull)bySeekToTime;
-(JobsRetZFPlayerByViewBlock _Nonnull)byAddPlayerViewToContainerView;
-(__kindof ZFPlayerController *_Nonnull)byAddPlayerViewToCell;
-(__kindof ZFPlayerController *_Nonnull)byAddPlayerViewToSmallFloatView;
-(JobsRetZFPlayerByOrientationBlock _Nonnull)byRotateToOrientation;
-(JobsRetZFPlayerByFullScreenBlock _Nonnull)byEnterFullScreen;

-(JobsRetZFPlayerByMediaURLBlock _Nonnull)onPrepareToPlay;
-(JobsRetZFPlayerByMediaURLBlock _Nonnull)onReadyToPlay;
-(JobsRetZFPlayerByPlayTimeBlock _Nonnull)onPlayTimeChanged;
-(JobsRetZFPlayerByPlaybackStateBlock _Nonnull)onPlayStateChanged;
-(JobsRetZFPlayerByLoadStateBlock _Nonnull)onLoadStateChanged;
-(JobsRetZFPlayerByMediaErrorBlock _Nonnull)onPlayFailed;
-(JobsRetZFPlayerByMediaBlock _Nonnull)onPlayDidEnd;
-(JobsRetZFPlayerByOrientationChangeBlock _Nonnull)onOrientationWillChange;
-(JobsRetZFPlayerByOrientationChangeBlock _Nonnull)onOrientationDidChanged;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_ZFPLAYERCONTROLLER_DSL_44F11BFC9D */
