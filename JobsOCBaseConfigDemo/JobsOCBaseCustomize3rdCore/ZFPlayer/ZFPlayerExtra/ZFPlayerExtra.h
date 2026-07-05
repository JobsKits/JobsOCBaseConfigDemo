//
//  ZFPlayerExtra.h
//  ZFPlayerExtra
//
//  Created by Jobs on 2026年5月20日，星期三.
//

#ifndef ZFPlayerExtra_h
#define ZFPlayerExtra_h

#import <Foundation/Foundation.h>
#import <TargetConditionals.h>
#import "ZFDouYinControlView.h"
#import "ZFDouYinControlView+DSL.h"
#import "ZFAVPlayerManager+ZFPlayerExtraDSL.h"
#import "ZFIJKPlayerManager+ZFPlayerExtraDSL.h"

#if __has_include(<ZFPlayer/ZFPlayer.h>)
#import <ZFPlayer/ZFPlayer.h>
#else
#import "ZFPlayer.h"
#endif

#if __has_include(<ZFPlayer/ZFAVPlayerManager.h>)
#import <ZFPlayer/ZFAVPlayerManager.h>
#else
#import "ZFAVPlayerManager.h"
#endif

#if !TARGET_OS_SIMULATOR && __has_include(<IJKMediaFramework/IJKMediaFramework.h>) && __has_include(<ZFPlayer/ZFIJKPlayerManager.h>)
#import <ZFPlayer/ZFIJKPlayerManager.h>
#else
#if !TARGET_OS_SIMULATOR && __has_include(<IJKMediaFramework/IJKMediaFramework.h>)
#import "ZFIJKPlayerManager.h"
#endif
#endif

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZFPlayerExtra : NSObject

@end

NS_ASSUME_NONNULL_END

#if __has_include(<ZFPlayer/ZFAVPlayerManager.h>)
#ifndef JOBS_MAKE_ZFAVPLAYERMANAGER
#define JOBS_MAKE_ZFAVPLAYERMANAGER
NS_INLINE __kindof ZFAVPlayerManager *_Nonnull jobsMakeZFAVPlayerManager(jobsByZFAVPlayerManagerBlock _Nonnull block){
    ZFAVPlayerManager *data = ZFAVPlayerManager.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_MAKE_ZFAVPLAYERMANAGER */
#endif

#if !TARGET_OS_SIMULATOR && __has_include(<IJKMediaFramework/IJKMediaFramework.h>) && (__has_include(<ZFPlayer/ZFIJKPlayerManager.h>) || __has_include("ZFIJKPlayerManager.h"))
#ifndef JOBS_MAKE_ZFIJKPLAYERMANAGER
#define JOBS_MAKE_ZFIJKPLAYERMANAGER
NS_INLINE __kindof ZFIJKPlayerManager *_Nonnull jobsMakeZFIJKPlayerManager(jobsByZFIJKPlayerManagerBlock _Nonnull block){
    ZFIJKPlayerManager *data = ZFIJKPlayerManager.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_MAKE_ZFIJKPLAYERMANAGER */
#endif

#ifndef JOBS_MAKE_ZFDOUYINCONTROLVIEW
#define JOBS_MAKE_ZFDOUYINCONTROLVIEW
NS_INLINE __kindof ZFDouYinControlView *_Nonnull jobsMakeZFDouYinControlView(jobsByZFDouYinControlViewBlock _Nonnull block){
    ZFDouYinControlView *data = ZFDouYinControlView.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_MAKE_ZFDOUYINCONTROLVIEW */

#endif /* ZFPlayerExtra_h */
