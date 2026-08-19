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

-(JobsRetZFPlayerControllerByVoidBlock _Nonnull)byPlay;
-(JobsRetZFPlayerControllerByVoidBlock _Nonnull)byPause;
-(JobsRetZFPlayerControllerByVoidBlock _Nonnull)byStop;
-(JobsRetZFPlayerControllerByVoidBlock _Nonnull)byPlayNext;
-(JobsRetZFPlayerControllerByVoidBlock _Nonnull)byPlayPrevious;
-(JobsRetZFPlayerByNSIntegerBlock _Nonnull)byPlayIndex;
-(JobsRetZFPlayerByTimeCompletionBlock _Nonnull)bySeekToTime;
-(JobsRetZFPlayerByViewBlock _Nonnull)byAddPlayerViewToContainerView;
-(JobsRetZFPlayerControllerByVoidBlock _Nonnull)byAddPlayerViewToCell;
-(JobsRetZFPlayerControllerByVoidBlock _Nonnull)byAddPlayerViewToSmallFloatView;
-(JobsRetZFPlayerByOrientationBlock _Nonnull)byRotateToOrientation;
-(JobsRetZFPlayerByFullScreenBlock _Nonnull)byEnterFullScreen;

-(JobsRetZFPlayerByMediaURLBlock _Nonnull)byPlayerPrepareToPlay;
-(JobsRetZFPlayerByMediaURLBlock _Nonnull)byPlayerReadyToPlay;
-(JobsRetZFPlayerByPlayTimeBlock _Nonnull)byPlayerPlayTimeChanged;
-(JobsRetZFPlayerByPlaybackStateBlock _Nonnull)byPlayerPlayStateChanged;
-(JobsRetZFPlayerByLoadStateBlock _Nonnull)byPlayerLoadStateChanged;
-(JobsRetZFPlayerByMediaErrorBlock _Nonnull)byPlayerPlayFailed;
-(JobsRetZFPlayerByMediaBlock _Nonnull)byPlayerDidToEnd;
-(JobsRetZFPlayerByOrientationChangeBlock _Nonnull)byOrientationWillChange;
-(JobsRetZFPlayerByOrientationChangeBlock _Nonnull)byOrientationDidChanged;

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

@interface ZFOrientationObserver (DSL)
-(JobsRetZFOrientationObserverByZFFullScreenModeBlock _Nonnull)byFullScreenMode;
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_ZFPLAYERCONTROLLER_DSL_44F11BFC9D */
