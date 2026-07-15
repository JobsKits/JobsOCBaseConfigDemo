//
//  ZFDouYinControlView+DSL.m
//  ZFPlayerExtra
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#import "ZFDouYinControlView+DSL.h"

@implementation ZFDouYinControlView (DSL)
-(JobsRetZFDouYinControlViewByPlayerBlock _Nonnull)byPlayer{
    @jobs_weakify(self)
    return ^__kindof ZFDouYinControlView *_Nullable(ZFPlayerController *_Nullable data){
        @jobs_strongify(self)
        self.player = data;
        return self;
    };
}

-(__kindof ZFDouYinControlView *_Nonnull)byResetControlView{
    [self resetControlView];
    return self;
}

-(JobsRetZFDouYinControlViewByStringBlock _Nonnull)byShowCoverViewWithUrl{
    @jobs_weakify(self)
    return ^__kindof ZFDouYinControlView *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        [self showCoverViewWithUrl:data];
        return self;
    };
}

@end
