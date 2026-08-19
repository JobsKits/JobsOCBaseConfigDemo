//
//  ZFIJKPlayerManager+ZFPlayerExtraDSL.m
//  ZFPlayerExtra
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#import "ZFIJKPlayerManager+ZFPlayerExtraDSL.h"

#if !TARGET_OS_SIMULATOR
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN ZFIJKPlayerManager
@interface ZFIJKPlayerManager (JobsPropertyDSLSetterAutogen_bb0d0b2b92)
-(void)setPlayerBufferTimeChanged:(void (^ _Nullable)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval bufferTime))data;
-(void)setPlayerDidToEnd:(void (^ _Nullable)(id<ZFPlayerMediaPlayback> asset))data;
-(void)setPlayerLoadStateChanged:(void (^ _Nullable)(id<ZFPlayerMediaPlayback> asset, ZFPlayerLoadState loadState))data;
-(void)setPlayerPlayFailed:(void (^ _Nullable)(id<ZFPlayerMediaPlayback> asset, id error))data;
-(void)setPlayerPlayStateChanged:(void (^ _Nullable)(id<ZFPlayerMediaPlayback> asset, ZFPlayerPlaybackState playState))data;
-(void)setPlayerPlayTimeChanged:(void (^ _Nullable)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval currentTime, NSTimeInterval duration))data;
-(void)setPlayerPrepareToPlay:(void (^ _Nullable)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL))data;
-(void)setPlayerReadyToPlay:(void (^ _Nullable)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL))data;
-(void)setPresentationSizeChanged:(void (^ _Nullable)(id<ZFPlayerMediaPlayback> asset, CGSize size))data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END ZFIJKPlayerManager

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

-(JobsRetZFIJKPlayerManagerByVoidBlock _Nonnull)byPrepareToPlay{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        [self prepareToPlay];
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByVoidBlock _Nonnull)byReloadPlayer{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        [self reloadPlayer];
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByVoidBlock _Nonnull)byPlay{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        [self play];
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByVoidBlock _Nonnull)byPause{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        self.pause;
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByVoidBlock _Nonnull)byReplay{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        [self replay];
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByVoidBlock _Nonnull)byStop{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        self.stop;
        return self;
    };
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
        self.byPlayerPrepareToPlay(data);
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByMediaURLBlock _Nonnull)onReadyToPlay{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL)){
        @jobs_strongify(self)
        self.byPlayerReadyToPlay(data);
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByPlayTimeBlock _Nonnull)onPlayTimeChanged{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval currentTime, NSTimeInterval duration)){
        @jobs_strongify(self)
        self.byPlayerPlayTimeChanged(data);
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByBufferTimeBlock _Nonnull)onBufferTimeChanged{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval bufferTime)){
        @jobs_strongify(self)
        self.byPlayerBufferTimeChanged(data);
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByPlaybackStateBlock _Nonnull)onPlayStateChanged{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerPlaybackState playState)){
        @jobs_strongify(self)
        self.byPlayerPlayStateChanged(data);
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByLoadStateBlock _Nonnull)onLoadStateChanged{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerLoadState loadState)){
        @jobs_strongify(self)
        self.byPlayerLoadStateChanged(data);
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByMediaErrorBlock _Nonnull)onPlayFailed{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, id error)){
        @jobs_strongify(self)
        self.byPlayerPlayFailed(data);
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByMediaBlock _Nonnull)onPlayDidEnd{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset)){
        @jobs_strongify(self)
        self.byPlayerDidToEnd(data);
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByPresentationSizeBlock _Nonnull)onPresentationSizeChanged{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager *_Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, CGSize size)){
        @jobs_strongify(self)
        self.byPresentationSizeChanged(data);
        return self;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN ZFIJKPlayerManager
-(JobsRetZFIJKPlayerManagerByvoidIDZFPlayerMediaPlaybackassetBlock _Nonnull)byPlayerDidToEnd{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset)){
        @jobs_strongify(self)
        [self setPlayerDidToEnd:data];
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByvoidIDZFPlayerMediaPlaybackassetCGSizesizeBlock _Nonnull)byPresentationSizeChanged{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, CGSize size)){
        @jobs_strongify(self)
        [self setPresentationSizeChanged:data];
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByvoidIDZFPlayerMediaPlaybackassetNSTimeIntervalbufferTimeBlock _Nonnull)byPlayerBufferTimeChanged{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval bufferTime)){
        @jobs_strongify(self)
        [self setPlayerBufferTimeChanged:data];
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByvoidIDZFPlayerMediaPlaybackassetNSTimeIntervalcurrentTimebff1d962bBlock _Nonnull)byPlayerPlayTimeChanged{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval currentTime, NSTimeInterval duration)){
        @jobs_strongify(self)
        [self setPlayerPlayTimeChanged:data];
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByvoidIDZFPlayerMediaPlaybackassetNSURLassetURLBlock _Nonnull)byPlayerPrepareToPlay{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL)){
        @jobs_strongify(self)
        [self setPlayerPrepareToPlay:data];
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByvoidIDZFPlayerMediaPlaybackassetNSURLassetURLBlock _Nonnull)byPlayerReadyToPlay{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL)){
        @jobs_strongify(self)
        [self setPlayerReadyToPlay:data];
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByvoidIDZFPlayerMediaPlaybackassetZFPlayerLoadStateloadStateBlock _Nonnull)byPlayerLoadStateChanged{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerLoadState loadState)){
        @jobs_strongify(self)
        [self setPlayerLoadStateChanged:data];
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByvoidIDZFPlayerMediaPlaybackassetZFPlayerPlaybackStateplayStateBlock _Nonnull)byPlayerPlayStateChanged{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerPlaybackState playState)){
        @jobs_strongify(self)
        [self setPlayerPlayStateChanged:data];
        return self;
    };
}

-(JobsRetZFIJKPlayerManagerByvoidIDZFPlayerMediaPlaybackassetiderrorBlock _Nonnull)byPlayerPlayFailed{
    @jobs_weakify(self)
    return ^__kindof ZFIJKPlayerManager * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, id error)){
        @jobs_strongify(self)
        [self setPlayerPlayFailed:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END ZFIJKPlayerManager
@end
#endif
