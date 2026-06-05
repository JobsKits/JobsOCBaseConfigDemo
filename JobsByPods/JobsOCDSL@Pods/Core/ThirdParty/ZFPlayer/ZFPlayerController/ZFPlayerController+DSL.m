//
//  ZFPlayerController+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "ZFPlayerController+DSL.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

@implementation ZFPlayerController (DSL)

- (JobsRetZFPlayerByViewBlock _Nonnull)byContainerView { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(__kindof UIView *_Nullable data) { @jobs_strongify(self) self.containerView = data; return self; }; }
- (JobsRetZFPlayerByManagerBlock _Nonnull)byPlayerManager { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(id<ZFPlayerMediaPlayback> _Nullable data) { @jobs_strongify(self) if (data) [self replaceCurrentPlayerManager:data]; return self; }; }
- (JobsRetZFPlayerByControlViewBlock _Nonnull)byControlView { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(__kindof UIView<ZFPlayerMediaControl> *_Nullable data) { @jobs_strongify(self) self.controlView = data; return self; }; }
- (JobsRetZFPlayerByURLBlock _Nonnull)byAssetURL { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(NSURL *_Nullable data) { @jobs_strongify(self) self.assetURL = data; return self; }; }
- (JobsRetZFPlayerByURLsBlock _Nonnull)byAssetURLs { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(NSArray<NSURL *> *_Nullable data) { @jobs_strongify(self) self.assetURLs = data; return self; }; }
- (JobsRetZFPlayerByNSIntegerBlock _Nonnull)byCurrentPlayIndex { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(NSInteger data) { @jobs_strongify(self) self.currentPlayIndex = data; return self; }; }
- (JobsRetZFPlayerByFloatBlock _Nonnull)byVolume { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(float data) { @jobs_strongify(self) self.volume = data; return self; }; }
- (JobsRetZFPlayerByBOOLBlock _Nonnull)byMuted { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(BOOL data) { @jobs_strongify(self) self.muted = data; return self; }; }
- (JobsRetZFPlayerByCGFloatBlock _Nonnull)byBrightness { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(CGFloat data) { @jobs_strongify(self) self.brightness = data; return self; }; }
- (JobsRetZFPlayerByBOOLBlock _Nonnull)byShouldAutoPlay { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(BOOL data) { @jobs_strongify(self) self.shouldAutoPlay = data; return self; }; }
- (JobsRetZFPlayerByBOOLBlock _Nonnull)byPauseWhenAppResignActive { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(BOOL data) { @jobs_strongify(self) self.pauseWhenAppResignActive = data; return self; }; }
- (JobsRetZFPlayerByBOOLBlock _Nonnull)byAllowOrientationRotation { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(BOOL data) { @jobs_strongify(self) self.allowOrentitaionRotation = data; return self; }; }
- (JobsRetZFPlayerByBOOLBlock _Nonnull)byExitFullScreenWhenStop { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(BOOL data) { @jobs_strongify(self) self.exitFullScreenWhenStop = data; return self; }; }
- (JobsRetZFPlayerByBOOLBlock _Nonnull)byLockedScreen { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(BOOL data) { @jobs_strongify(self) self.lockedScreen = data; return self; }; }
- (JobsRetZFPlayerByDisableGestureBlock _Nonnull)byDisableGestureTypes { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(ZFPlayerDisableGestureTypes data) { @jobs_strongify(self) self.disableGestureTypes = data; return self; }; }
- (JobsRetZFPlayerByDisablePanBlock _Nonnull)byDisablePanMovingDirection { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(ZFPlayerDisablePanMovingDirection data) { @jobs_strongify(self) self.disablePanMovingDirection = data; return self; }; }

- (__kindof ZFPlayerController *_Nonnull)byPlay { [self.currentPlayerManager play]; return self; }
- (__kindof ZFPlayerController *_Nonnull)byPause { [self.currentPlayerManager pause]; return self; }
- (__kindof ZFPlayerController *_Nonnull)byStop { [self stop]; return self; }
- (__kindof ZFPlayerController *_Nonnull)byPlayNext { [self playTheNext]; return self; }
- (__kindof ZFPlayerController *_Nonnull)byPlayPrevious { [self playThePrevious]; return self; }

- (JobsRetZFPlayerByNSIntegerBlock _Nonnull)byPlayIndex {
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        [self playTheIndex:data];
        return self;
    };
}

- (JobsRetZFPlayerByTimeCompletionBlock _Nonnull)bySeekToTime {
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(NSTimeInterval time, void (^ _Nullable completion)(BOOL finished)) {
        @jobs_strongify(self)
        [self seekToTime:time completionHandler:completion];
        return self;
    };
}

- (JobsRetZFPlayerByViewBlock _Nonnull)byAddPlayerViewToContainerView {
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(__kindof UIView *_Nullable data) {
        @jobs_strongify(self)
        if (data) {
            [self addPlayerViewToContainerView:data];
        }return self;
    };
}

- (__kindof ZFPlayerController *_Nonnull)byAddPlayerViewToCell { [self addPlayerViewToCell]; return self; }
- (__kindof ZFPlayerController *_Nonnull)byAddPlayerViewToSmallFloatView { [self addPlayerViewToSmallFloatView]; return self; }

- (JobsRetZFPlayerByOrientationBlock _Nonnull)byRotateToOrientation {
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(UIInterfaceOrientation orientation, BOOL animated) {
        @jobs_strongify(self)
        [self rotateToOrientation:orientation animated:animated];
        return self;
    };
}

- (JobsRetZFPlayerByFullScreenBlock _Nonnull)byEnterFullScreen {
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(BOOL fullScreen, BOOL animated) {
        @jobs_strongify(self)
        [self enterFullScreen:fullScreen animated:animated];
        return self;
    };
}

- (JobsRetZFPlayerByMediaURLBlock _Nonnull)onPrepareToPlay { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL)) { @jobs_strongify(self) self.playerPrepareToPlay = data; return self; }; }
- (JobsRetZFPlayerByMediaURLBlock _Nonnull)onReadyToPlay { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL)) { @jobs_strongify(self) self.playerReadyToPlay = data; return self; }; }
- (JobsRetZFPlayerByPlayTimeBlock _Nonnull)onPlayTimeChanged { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval currentTime, NSTimeInterval duration)) { @jobs_strongify(self) self.playerPlayTimeChanged = data; return self; }; }
- (JobsRetZFPlayerByPlaybackStateBlock _Nonnull)onPlayStateChanged { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerPlaybackState playState)) { @jobs_strongify(self) self.playerPlayStateChanged = data; return self; }; }
- (JobsRetZFPlayerByLoadStateBlock _Nonnull)onLoadStateChanged { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerLoadState loadState)) { @jobs_strongify(self) self.playerLoadStateChanged = data; return self; }; }
- (JobsRetZFPlayerByMediaErrorBlock _Nonnull)onPlayFailed { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, id error)) { @jobs_strongify(self) self.playerPlayFailed = data; return self; }; }
- (JobsRetZFPlayerByMediaBlock _Nonnull)onPlayDidEnd { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset)) { @jobs_strongify(self) self.playerDidToEnd = data; return self; }; }
- (JobsRetZFPlayerByOrientationChangeBlock _Nonnull)onOrientationWillChange { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(void (^ _Nullable data)(ZFPlayerController *player, BOOL isFullScreen)) { @jobs_strongify(self) self.orientationWillChange = data; return self; }; }
- (JobsRetZFPlayerByOrientationChangeBlock _Nonnull)onOrientationDidChanged { @jobs_weakify(self) return ^__kindof ZFPlayerController *_Nullable(void (^ _Nullable data)(ZFPlayerController *player, BOOL isFullScreen)) { @jobs_strongify(self) self.orientationDidChanged = data; return self; }; }

@end
