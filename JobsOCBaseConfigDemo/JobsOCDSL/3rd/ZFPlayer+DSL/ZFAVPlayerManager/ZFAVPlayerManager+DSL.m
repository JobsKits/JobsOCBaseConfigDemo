//
//  ZFAVPlayerManager+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "ZFAVPlayerManager+DSL.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN ZFAVPlayerManager
@interface ZFAVPlayerManager (JobsPropertyDSLSetterAutogen_1b83b72dde)
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
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END ZFAVPlayerManager

@implementation ZFAVPlayerManager (DSL)
-(JobsRetZFAVPlayerManagerByTimeIntervalBlock _Nonnull)byTimeRefreshInterval{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        self.timeRefreshInterval = data;
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByDictionaryBlock _Nonnull)byRequestHeader{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager *_Nullable(NSDictionary *_Nullable data){
        @jobs_strongify(self)
        self.requestHeader = data;
        return self;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN ZFAVPlayerManager
-(JobsRetZFAVPlayerManagerByvoidIDZFPlayerMediaPlaybackassetBlock _Nonnull)byPlayerDidToEnd{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset)){
        @jobs_strongify(self)
        [self setPlayerDidToEnd:data];
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByvoidIDZFPlayerMediaPlaybackassetCGSizesizeBlock _Nonnull)byPresentationSizeChanged{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, CGSize size)){
        @jobs_strongify(self)
        [self setPresentationSizeChanged:data];
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByvoidIDZFPlayerMediaPlaybackassetNSTimeIntervalbufferTimeBlock _Nonnull)byPlayerBufferTimeChanged{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval bufferTime)){
        @jobs_strongify(self)
        [self setPlayerBufferTimeChanged:data];
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByvoidIDZFPlayerMediaPlaybackassetNSTimeIntervalcurrentTimebff1d962bBlock _Nonnull)byPlayerPlayTimeChanged{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSTimeInterval currentTime, NSTimeInterval duration)){
        @jobs_strongify(self)
        [self setPlayerPlayTimeChanged:data];
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByvoidIDZFPlayerMediaPlaybackassetNSURLassetURLBlock _Nonnull)byPlayerPrepareToPlay{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL)){
        @jobs_strongify(self)
        [self setPlayerPrepareToPlay:data];
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByvoidIDZFPlayerMediaPlaybackassetNSURLassetURLBlock _Nonnull)byPlayerReadyToPlay{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, NSURL *assetURL)){
        @jobs_strongify(self)
        [self setPlayerReadyToPlay:data];
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByvoidIDZFPlayerMediaPlaybackassetZFPlayerLoadStateloadStateBlock _Nonnull)byPlayerLoadStateChanged{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerLoadState loadState)){
        @jobs_strongify(self)
        [self setPlayerLoadStateChanged:data];
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByvoidIDZFPlayerMediaPlaybackassetZFPlayerPlaybackStateplayStateBlock _Nonnull)byPlayerPlayStateChanged{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, ZFPlayerPlaybackState playState)){
        @jobs_strongify(self)
        [self setPlayerPlayStateChanged:data];
        return self;
    };
}

-(JobsRetZFAVPlayerManagerByvoidIDZFPlayerMediaPlaybackassetiderrorBlock _Nonnull)byPlayerPlayFailed{
    @jobs_weakify(self)
    return ^__kindof ZFAVPlayerManager * _Nullable(void (^ _Nullable data)(id<ZFPlayerMediaPlayback> asset, id error)){
        @jobs_strongify(self)
        [self setPlayerPlayFailed:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END ZFAVPlayerManager
@end
