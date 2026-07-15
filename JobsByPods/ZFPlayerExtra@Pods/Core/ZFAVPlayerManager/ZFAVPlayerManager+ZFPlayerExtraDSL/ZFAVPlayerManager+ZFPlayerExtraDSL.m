//
//  ZFAVPlayerManager+ZFPlayerExtraDSL.m
//  ZFPlayerExtra
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#import "ZFAVPlayerManager+ZFPlayerExtraDSL.h"

@implementation ZFAVPlayerManager (ZFPlayerExtraDSL)
-(JobsRetZFAVPlayerManagerByURLBlock _Nonnull)byAssetURL{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(NSURL *_Nullable data){
        @jobs_strongify(self)
        self.assetURL = data;
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByViewBlock _Nonnull)byView{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(ZFPlayerView *_Nullable data){
        @jobs_strongify(self)
        self.view = data;
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByFloatBlock _Nonnull)byVolume{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(float data){
        @jobs_strongify(self)
        self.volume = data;
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByBOOLBlock _Nonnull)byMuted{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.muted = data;
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByFloatBlock _Nonnull)byRate{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(float data){
        @jobs_strongify(self)
        self.rate = data;
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByPlaybackTimeBlock _Nonnull)bySeekTime{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        self.seekTime = data;
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByScalingModeBlock _Nonnull)byScalingMode{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(ZFPlayerScalingMode data){
        @jobs_strongify(self)
        self.scalingMode = data;
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByBOOLBlock _Nonnull)byShouldAutoPlay{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.shouldAutoPlay = data;
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByCGSizeBlock _Nonnull)byPresentationSize{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(CGSize data){
        @jobs_strongify(self)
        self.presentationSize = data;
        return self;
    };
}

-(__kindof ZFAVPlayerManager *_Nonnull)byPrepareToPlay{
    [self prepareToPlay];
    return self;
}

-(__kindof ZFAVPlayerManager *_Nonnull)byReloadPlayer{
    [self reloadPlayer];
    return self;
}

-(__kindof ZFAVPlayerManager *_Nonnull)byPlay{
    [self play];
    return self;
}

-(__kindof ZFAVPlayerManager *_Nonnull)byPause{
    [self pause];
    return self;
}

-(__kindof ZFAVPlayerManager *_Nonnull)byReplay{
    [self replay];
    return self;
}

-(__kindof ZFAVPlayerManager *_Nonnull)byStop{
    [self stop];
    return self;
}

-(JobsRetZFAVPlayerManagerByImageBlock _Nonnull)byThumbnailImageAtCurrentTime{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(void (^ _Nullable data)(UIImage *image)){
        @jobs_strongify(self)
        if (data && [self respondsToSelector:@selector(thumbnailImageAtCurrentTime:)]) {
            [(id<ZFPlayerMediaPlayback>)self thumbnailImageAtCurrentTime:data];
        };return self;
    };
}

-(JobsRetZFAVPlayerManagerByMediaURLBlock _Nonnull)onPrepareToPlay{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL)){
        @jobs_strongify(self)
        self.playerPrepareToPlay = data;
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByMediaURLBlock _Nonnull)onReadyToPlay{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL)){
        @jobs_strongify(self)
        self.playerReadyToPlay = data;
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByPlayTimeBlock _Nonnull)onPlayTimeChanged{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval currentTime, NSTimeInterval duration)){
        @jobs_strongify(self)
        self.playerPlayTimeChanged = data;
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByBufferTimeBlock _Nonnull)onBufferTimeChanged{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval bufferTime)){
        @jobs_strongify(self)
        self.playerBufferTimeChanged = data;
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByPlaybackStateBlock _Nonnull)onPlayStateChanged{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerPlaybackState playState)){
        @jobs_strongify(self)
        self.playerPlayStateChanged = data;
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByLoadStateBlock _Nonnull)onLoadStateChanged{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerLoadState loadState)){
        @jobs_strongify(self)
        self.playerLoadStateChanged = data;
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByMediaErrorBlock _Nonnull)onPlayFailed{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, id error)){
        @jobs_strongify(self)
        self.playerPlayFailed = data;
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByMediaBlock _Nonnull)onPlayDidEnd{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset)){
        @jobs_strongify(self)
        self.playerDidToEnd = data;
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByPresentationSizeBlock _Nonnull)onPresentationSizeChanged{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, CGSize size)){
        @jobs_strongify(self)
        self.presentationSizeChanged = data;
        return self;
    };
}

@end
