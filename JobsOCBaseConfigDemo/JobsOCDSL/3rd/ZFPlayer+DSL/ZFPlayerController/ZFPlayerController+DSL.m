//
//  ZFPlayerController+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "ZFPlayerController+DSL.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN ZFPlayerController
@interface ZFPlayerController (JobsPropertyDSLSetterAutogen_4bbda5cb66)
-(void)setAllowOrentitaionRotation:(BOOL)data;
-(void)setOrientationDidChanged:(void (^ _Nullable)(ZFPlayerController *player, BOOL isFullScreen))data;
-(void)setOrientationWillChange:(void (^ _Nullable)(ZFPlayerController *player, BOOL isFullScreen))data;
-(void)setPlayerDidToEnd:(void (^ _Nullable)(id<ZFPlayerMediaPlayback> asset))data;
-(void)setPlayerDisapperaPercent:(CGFloat)data;
-(void)setPlayerLoadStateChanged:(void (^ _Nullable)(id<ZFPlayerMediaPlayback> asset, ZFPlayerLoadState loadState))data;
-(void)setPlayerPlayFailed:(void (^ _Nullable)(id<ZFPlayerMediaPlayback> asset, id error))data;
-(void)setPlayerPlayStateChanged:(void (^ _Nullable)(id<ZFPlayerMediaPlayback> asset, ZFPlayerPlaybackState playState))data;
-(void)setPlayerPlayTimeChanged:(void (^ _Nullable)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval currentTime, NSTimeInterval duration))data;
-(void)setPlayerPrepareToPlay:(void (^ _Nullable)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL))data;
-(void)setPlayerReadyToPlay:(void (^ _Nullable)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL))data;
-(void)setWWANAutoPlay:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END ZFPlayerController

@implementation ZFPlayerController (DSL)
-(JobsRetZFPlayerByViewBlock _Nonnull)byContainerView{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(__kindof UIView *_Nullable data){
        @jobs_strongify(self)
        self.containerView = data;
        return self;
    };
}

-(JobsRetZFPlayerByManagerBlock _Nonnull)byPlayerManager{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(id<ZFPlayerMediaPlayback> _Nullable data){
        @jobs_strongify(self)
        if (data) [self replaceCurrentPlayerManager:data];
        return self;
    };
}

-(JobsRetZFPlayerByControlViewBlock _Nonnull)byControlView{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(__kindof UIView<ZFPlayerMediaControl> *_Nullable data){
        @jobs_strongify(self)
        self.controlView = data;
        return self;
    };
}

-(JobsRetZFPlayerByURLBlock _Nonnull)byAssetURL{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(NSURL *_Nullable data){
        @jobs_strongify(self)
        self.assetURL = data;
        return self;
    };
}

-(JobsRetZFPlayerByURLsBlock _Nonnull)byAssetURLs{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(NSArray<NSURL *> *_Nullable data){
        @jobs_strongify(self)
        self.assetURLs = data;
        return self;
    };
}

-(JobsRetZFPlayerByNSIntegerBlock _Nonnull)byCurrentPlayIndex{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.currentPlayIndex = data;
        return self;
    };
}

-(JobsRetZFPlayerByFloatBlock _Nonnull)byVolume{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(float data){
        @jobs_strongify(self)
        self.volume = data;
        return self;
    };
}

-(JobsRetZFPlayerByBOOLBlock _Nonnull)byMuted{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.muted = data;
        return self;
    };
}

-(JobsRetZFPlayerByCGFloatBlock _Nonnull)byBrightness{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.brightness = data;
        return self;
    };
}

-(JobsRetZFPlayerByBOOLBlock _Nonnull)byShouldAutoPlay{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.shouldAutoPlay = data;
        return self;
    };
}

-(JobsRetZFPlayerByBOOLBlock _Nonnull)byPauseWhenAppResignActive{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.pauseWhenAppResignActive = data;
        return self;
    };
}

-(JobsRetZFPlayerByBOOLBlock _Nonnull)byAllowOrientationRotation{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.allowOrentitaionRotation = data;
        return self;
    };
}

-(JobsRetZFPlayerByBOOLBlock _Nonnull)byExitFullScreenWhenStop{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.exitFullScreenWhenStop = data;
        return self;
    };
}

-(JobsRetZFPlayerByBOOLBlock _Nonnull)byLockedScreen{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.lockedScreen = data;
        return self;
    };
}

-(JobsRetZFPlayerByDisableGestureBlock _Nonnull)byDisableGestureTypes{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(ZFPlayerDisableGestureTypes data){
        @jobs_strongify(self)
        self.disableGestureTypes = data;
        return self;
    };
}

-(JobsRetZFPlayerByDisablePanBlock _Nonnull)byDisablePanMovingDirection{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(ZFPlayerDisablePanMovingDirection data){
        @jobs_strongify(self)
        self.disablePanMovingDirection = data;
        return self;
    };
}

-(JobsRetZFPlayerControllerByVoidBlock _Nonnull)byPlay{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        [self.currentPlayerManager play];
        return self;
    };
}

-(JobsRetZFPlayerControllerByVoidBlock _Nonnull)byPause{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        [self.currentPlayerManager pause];
        return self;
    };
}

-(JobsRetZFPlayerControllerByVoidBlock _Nonnull)byStop{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        [self stop];
        return self;
    };
}

-(JobsRetZFPlayerControllerByVoidBlock _Nonnull)byPlayNext{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        [self playTheNext];
        return self;
    };
}

-(JobsRetZFPlayerControllerByVoidBlock _Nonnull)byPlayPrevious{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        [self playThePrevious];
        return self;
    };
}

-(JobsRetZFPlayerByNSIntegerBlock _Nonnull)byPlayIndex{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(NSInteger data){
        @jobs_strongify(self)
        [self playTheIndex:data];
        return self;
    };
}

-(JobsRetZFPlayerByTimeCompletionBlock _Nonnull)bySeekToTime{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(NSTimeInterval time, void (^ _Nullable completion)(BOOL finished)){
        @jobs_strongify(self)
        [self seekToTime:time completionHandler:completion];
        return self;
    };
}

-(JobsRetZFPlayerByViewBlock _Nonnull)byAddPlayerViewToContainerView{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(__kindof UIView *_Nullable data){
        @jobs_strongify(self)
        if (data){
            [self addPlayerViewToContainerView:data];
        };return self;
    };
}

-(JobsRetZFPlayerControllerByVoidBlock _Nonnull)byAddPlayerViewToCell{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        [self addPlayerViewToCell];
        return self;
    };
}

-(JobsRetZFPlayerControllerByVoidBlock _Nonnull)byAddPlayerViewToSmallFloatView{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        [self addPlayerViewToSmallFloatView];
        return self;
    };
}

-(JobsRetZFPlayerByOrientationBlock _Nonnull)byRotateToOrientation{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(UIInterfaceOrientation orientation, BOOL animated){
        @jobs_strongify(self)
        [self rotateToOrientation:orientation animated:animated];
        return self;
    };
}

-(JobsRetZFPlayerByFullScreenBlock _Nonnull)byEnterFullScreen{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(BOOL fullScreen, BOOL animated){
        @jobs_strongify(self)
        [self enterFullScreen:fullScreen animated:animated];
        return self;
    };
}

-(JobsRetZFPlayerByMediaURLBlock _Nonnull)onPrepareToPlay{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL)){
        @jobs_strongify(self)
        self.byPlayerPrepareToPlay(data);
        return self;
    };
}

-(JobsRetZFPlayerByMediaURLBlock _Nonnull)onReadyToPlay{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL)){
        @jobs_strongify(self)
        self.byPlayerReadyToPlay(data);
        return self;
    };
}

-(JobsRetZFPlayerByPlayTimeBlock _Nonnull)onPlayTimeChanged{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval currentTime, NSTimeInterval duration)){
        @jobs_strongify(self)
        self.byPlayerPlayTimeChanged(data);
        return self;
    };
}

-(JobsRetZFPlayerByPlaybackStateBlock _Nonnull)onPlayStateChanged{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerPlaybackState playState)){
        @jobs_strongify(self)
        self.byPlayerPlayStateChanged(data);
        return self;
    };
}

-(JobsRetZFPlayerByLoadStateBlock _Nonnull)onLoadStateChanged{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerLoadState loadState)){
        @jobs_strongify(self)
        self.byPlayerLoadStateChanged(data);
        return self;
    };
}

-(JobsRetZFPlayerByMediaErrorBlock _Nonnull)onPlayFailed{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, id error)){
        @jobs_strongify(self)
        self.byPlayerPlayFailed(data);
        return self;
    };
}

-(JobsRetZFPlayerByMediaBlock _Nonnull)onPlayDidEnd{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset)){
        @jobs_strongify(self)
        self.byPlayerDidToEnd(data);
        return self;
    };
}

-(JobsRetZFPlayerByOrientationChangeBlock _Nonnull)onOrientationWillChange{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(void (^ _Nullable data)(ZFPlayerController *player, BOOL isFullScreen)){
        @jobs_strongify(self)
        self.byOrientationWillChange(data);
        return self;
    };
}

-(JobsRetZFPlayerByOrientationChangeBlock _Nonnull)onOrientationDidChanged{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController *_Nullable(void (^ _Nullable data)(ZFPlayerController *player, BOOL isFullScreen)){
        @jobs_strongify(self)
        self.byOrientationDidChanged(data);
        return self;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN ZFPlayerController
-(JobsRetZFPlayerByBOOLBlock _Nonnull)byAllowOrentitaionRotation{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setAllowOrentitaionRotation:data];
        return self;
    };
}

-(JobsRetZFPlayerByBOOLBlock _Nonnull)byWWANAutoPlay{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setWWANAutoPlay:data];
        return self;
    };
}

-(JobsRetZFPlayerByCGFloatBlock _Nonnull)byPlayerDisapperaPercent{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setPlayerDisapperaPercent:data];
        return self;
    };
}

-(JobsRetZFPlayerControllerByvoidIDZFPlayerMediaPlaybackassetBlock _Nonnull)byPlayerDidToEnd{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset)){
        @jobs_strongify(self)
        [self setPlayerDidToEnd:data];
        return self;
    };
}

-(JobsRetZFPlayerControllerByvoidIDZFPlayerMediaPlaybackassetNSTimeIntervalcurrentTimebff1d962bBlock _Nonnull)byPlayerPlayTimeChanged{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval currentTime, NSTimeInterval duration)){
        @jobs_strongify(self)
        [self setPlayerPlayTimeChanged:data];
        return self;
    };
}

-(JobsRetZFPlayerControllerByvoidIDZFPlayerMediaPlaybackassetNSURLassetURLBlock _Nonnull)byPlayerPrepareToPlay{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL)){
        @jobs_strongify(self)
        [self setPlayerPrepareToPlay:data];
        return self;
    };
}

-(JobsRetZFPlayerControllerByvoidIDZFPlayerMediaPlaybackassetNSURLassetURLBlock _Nonnull)byPlayerReadyToPlay{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL)){
        @jobs_strongify(self)
        [self setPlayerReadyToPlay:data];
        return self;
    };
}

-(JobsRetZFPlayerControllerByvoidIDZFPlayerMediaPlaybackassetZFPlayerLoadStateloadStateBlock _Nonnull)byPlayerLoadStateChanged{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerLoadState loadState)){
        @jobs_strongify(self)
        [self setPlayerLoadStateChanged:data];
        return self;
    };
}

-(JobsRetZFPlayerControllerByvoidIDZFPlayerMediaPlaybackassetZFPlayerPlaybackStateplayStateBlock _Nonnull)byPlayerPlayStateChanged{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerPlaybackState playState)){
        @jobs_strongify(self)
        [self setPlayerPlayStateChanged:data];
        return self;
    };
}

-(JobsRetZFPlayerControllerByvoidIDZFPlayerMediaPlaybackassetiderrorBlock _Nonnull)byPlayerPlayFailed{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, id error)){
        @jobs_strongify(self)
        [self setPlayerPlayFailed:data];
        return self;
    };
}

-(JobsRetZFPlayerControllerByvoidZFPlayerControllerplayerBOOLisFullScreenBlock _Nonnull)byOrientationDidChanged{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController * _Nullable(void (^ _Nullable data)(ZFPlayerController *player, BOOL isFullScreen)){
        @jobs_strongify(self)
        [self setOrientationDidChanged:data];
        return self;
    };
}

-(JobsRetZFPlayerControllerByvoidZFPlayerControllerplayerBOOLisFullScreenBlock _Nonnull)byOrientationWillChange{
    @jobs_weakify(self)
    return ^__kindof ZFPlayerController * _Nullable(void (^ _Nullable data)(ZFPlayerController *player, BOOL isFullScreen)){
        @jobs_strongify(self)
        [self setOrientationWillChange:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END ZFPlayerController
@end

@implementation ZFOrientationObserver (DSL)

-(JobsRetZFOrientationObserverByZFFullScreenModeBlock _Nonnull)byFullScreenMode{
    @jobs_weakify(self)
    return ^__kindof ZFOrientationObserver * _Nullable(ZFFullScreenMode data){
        @jobs_strongify(self)
        [self setFullScreenMode:data];
        return self;
    };
}

@end
