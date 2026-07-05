//
//  ZFIJKPlayerManager+ZFPlayerExtraDSL.m
//  ZFPlayerExtra
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#import "ZFIJKPlayerManager+ZFPlayerExtraDSL.h"

#if !TARGET_OS_SIMULATOR
@implementation ZFIJKPlayerManager (ZFPlayerExtraDSL)

-(JobsRetZFIJKPlayerManagerByURLBlock _Nonnull)byAssetURL{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(NSURL *_Nullable data){
        @jobs_strongify(self)
        self.assetURL = data;
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByViewBlock _Nonnull)byView{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(ZFPlayerView *_Nullable data){
        @jobs_strongify(self)
        self.view = data;
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByFloatBlock _Nonnull)byVolume{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(float data){
        @jobs_strongify(self)
        self.volume = data;
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByBOOLBlock _Nonnull)byMuted{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.muted = data;
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByFloatBlock _Nonnull)byRate{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(float data){
        @jobs_strongify(self)
        self.rate = data;
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByPlaybackTimeBlock _Nonnull)bySeekTime{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        self.seekTime = data;
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByScalingModeBlock _Nonnull)byScalingMode{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(ZFPlayerScalingMode data){
        @jobs_strongify(self)
        self.scalingMode = data;
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByBOOLBlock _Nonnull)byShouldAutoPlay{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.shouldAutoPlay = data;
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByCGSizeBlock _Nonnull)byPresentationSize{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(CGSize data){
        @jobs_strongify(self)
        self.presentationSize = data;
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByTimeIntervalBlock _Nonnull)byTimeRefreshInterval{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        self.timeRefreshInterval = data;
        return self;
    };
}

-(__kindof ZFIJKPlayerManager *_Nonnull)byPrepareToPlay{
    [self prepareToPlay];
    return self;
}

-(__kindof ZFIJKPlayerManager *_Nonnull)byReloadPlayer{
    [self reloadPlayer];
    return self;
}

-(__kindof ZFIJKPlayerManager *_Nonnull)byPlay{
    [self play];
    return self;
}

-(__kindof ZFIJKPlayerManager *_Nonnull)byPause{
    [self pause];
    return self;
}

-(__kindof ZFIJKPlayerManager *_Nonnull)byReplay{
    [self replay];
    return self;
}

-(__kindof ZFIJKPlayerManager *_Nonnull)byStop{
    [self stop];
    return self;
}

-(JobsRetZFIJKPlayerManagerByImageBlock _Nonnull)byThumbnailImageAtCurrentTime{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(void (^ _Nullable data)(UIImage *image)){
        @jobs_strongify(self)
        if (data && [self respondsToSelector:@selector(thumbnailImageAtCurrentTime:)]) {
            [(id<ZFPlayerMediaPlayback>)self thumbnailImageAtCurrentTime:data];
        };return self;
    };
}

-(JobsRetZFIJKPlayerManagerByMediaURLBlock _Nonnull)onPrepareToPlay{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL)){
        @jobs_strongify(self)
        self.playerPrepareToPlay = data;
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByMediaURLBlock _Nonnull)onReadyToPlay{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL)){
        @jobs_strongify(self)
        self.playerReadyToPlay = data;
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByPlayTimeBlock _Nonnull)onPlayTimeChanged{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval currentTime, NSTimeInterval duration)){
        @jobs_strongify(self)
        self.playerPlayTimeChanged = data;
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByBufferTimeBlock _Nonnull)onBufferTimeChanged{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval bufferTime)){
        @jobs_strongify(self)
        self.playerBufferTimeChanged = data;
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByPlaybackStateBlock _Nonnull)onPlayStateChanged{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerPlaybackState playState)){
        @jobs_strongify(self)
        self.playerPlayStateChanged = data;
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByLoadStateBlock _Nonnull)onLoadStateChanged{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerLoadState loadState)){
        @jobs_strongify(self)
        self.playerLoadStateChanged = data;
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByMediaErrorBlock _Nonnull)onPlayFailed{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, id error)){
        @jobs_strongify(self)
        self.playerPlayFailed = data;
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByMediaBlock _Nonnull)onPlayDidEnd{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset)){
        @jobs_strongify(self)
        self.playerDidToEnd = data;
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByPresentationSizeBlock _Nonnull)onPresentationSizeChanged{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, CGSize size)){
        @jobs_strongify(self)
        self.presentationSizeChanged = data;
        return self;
    };
}

@end
#endif
