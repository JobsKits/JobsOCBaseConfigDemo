//
//  ZFPlayerExtras.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/4/18.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "ZFDouYinControlView.h"
#import "ZFCustomControlView.h"
#import "ZFIJKPlayerManager.h"

#if __has_include(<ZFPlayer/ZFPlayer.h>)
#import <ZFPlayer/ZFPlayer.h>
#else
#import "ZFPlayer.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface ZFPlayerExtras : NSObject

@end

NS_ASSUME_NONNULL_END

#ifndef JOBS_MAKE_ZFAVPLAYERMANAGER
#define JOBS_MAKE_ZFAVPLAYERMANAGER
NS_INLINE __kindof ZFAVPlayerManager *_Nonnull jobsMakeZFAVPlayerManager(jobsByZFAVPlayerManagerBlock _Nonnull block){
    ZFAVPlayerManager *data = ZFAVPlayerManager.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_MAKE_ZFAVPLAYERMANAGER */

#if __has_include(<IJKMediaFramework/IJKMediaFramework.h>)
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

#ifndef JOBS_MAKE_ZFCUSTOMCONTROLVIEW
#define JOBS_MAKE_ZFCUSTOMCONTROLVIEW
NS_INLINE __kindof ZFCustomControlView *_Nonnull jobsMakeZFCustomControlView(jobsByZFCustomControlViewBlock _Nonnull block){
    ZFCustomControlView *data = ZFCustomControlView.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_MAKE_ZFCUSTOMCONTROLVIEW */
