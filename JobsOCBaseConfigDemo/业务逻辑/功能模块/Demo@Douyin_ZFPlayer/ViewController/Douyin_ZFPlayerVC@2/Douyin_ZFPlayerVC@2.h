//
//  Douyin_ZFPlayerVC@2.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "JobsNetWorkTools.h"
#import "JobsVideoTBVCell.h"
#import "VideoModel.h"

#if __has_include(<ZFPlayer/ZFPlayer.h>)
#import <ZFPlayer/ZFPlayer.h>
#else
#import "ZFPlayer.h"
#endif

#if __has_include(<KTVHTTPCache/KTVHTTPCache.h>)
#import <KTVHTTPCache/KTVHTTPCache.h>
#else
#import "KTVHTTPCache.h"
#endif

#if __has_include(<ZFPlayerExtra/ZFPlayerExtra.h>)
#import <ZFPlayerExtra/ZFPlayerExtra.h>
#else
#import "ZFPlayerExtra.h"
#endif

#if __has_include(<JobsByOCPods/ZFCustomControlView.h>)
#import <JobsByOCPods/ZFCustomControlView.h>
#else
#import "ZFCustomControlView.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsBitsMonitor/JobsBitsMonitor.h>)
#import <JobsBitsMonitor/JobsBitsMonitor.h>
#else
#import "JobsBitsMonitor.h"
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

@interface Douyin_ZFPlayerVC_2 : BaseViewController
<
UITableViewDelegate,
UITableViewDataSource
>
/// 指定到某一行播放
-(void)playTheIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
/**
 
     play the video

     @"https://www.apple.com/105/media/us/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-tpl-cc-us-20170912_1280x720h.mp4"
     @"https://www.apple.com/105/media/cn/mac/family/2018/46c4b917_abfd_45a3_9b51_4e3054191797/films/bruce/mac-bruce-tpl-cn-2018_1280x720h.mp4"
     @"https://www.apple.com/105/media/us/mac/family/2018/46c4b917_abfd_45a3_9b51_4e3054191797/films/peter/mac-peter-tpl-cc-us-2018_1280x720h.mp4"
     @"https://www.apple.com/105/media/us/mac/family/2018/46c4b917_abfd_45a3_9b51_4e3054191797/films/grimes/mac-grimes-tpl-cc-us-2018_1280x720h.mp4"
     @"https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7194236f31b2e1e3da0fe06cfed4ba2b.mp4"
     @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
     @"http://vjs.zencdn.net/v/oceans.mp4"
     @"https://media.w3.org/2010/05/sintel/trailer.mp4"
     @"http://mirror.aarnet.edu.au/pub/TED-talks/911Mothers_2010W-480p.mp4"
     @"https://sample-videos.com/video123/mp4/480/big_buck_bunny_480p_2mb.mp4"
 */
