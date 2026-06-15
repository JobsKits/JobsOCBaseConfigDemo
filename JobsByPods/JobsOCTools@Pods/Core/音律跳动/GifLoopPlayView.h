//
//  GifLoopPlayView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_GIFLOOPPLAYVIEW_C24003D652
#define JOBS_HEADER_GUARD_GIFLOOPPLAYVIEW_C24003D652

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsLoadingImage/JobsLoadingImage.h>)
#import <JobsLoadingImage/JobsLoadingImage.h>
#else
#import "JobsLoadingImage.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 一个 gif 动画显示组件，允许在指定时间内播放动画序列，无限循环，支持停止、播放
@interface GifLoopPlayView : UIView

Prop_assign()BOOL stopped;
                         // YES: 没有播放，NO：正在播放
Prop_assign()CGFloat duration;
                     // 动图执行周期
Prop_strong()NSMutableArray<UIImage *> *gifMutArr; // 要播放的动画序列
Prop_strong()UIImage *pauseImage;
                  // 暂停时显示的图片

@end

NS_ASSUME_NONNULL_END

/**

      使用方法：

     // 开始播动画
     self.gifLoopPlayView.stopped = NO;//YES - 停止；NO - 播放


     -(GifLoopPlayView *)gifLoopPlayView{
         if (!_gifLoopPlayView) {
             _gifLoopPlayView = GifLoopPlayView.new;
             _gifLoopPlayView.byFrame(CGRectMake(100, 200, 104, 11));

             [self.view addSubview:_gifLoopPlayView];
             for (int t = 1; t <= 10; t++) {
                 [_gifLoopPlayView.gifMutArr addObject:JobsLoadBundleImage(nil,@"音律跳动",  nil,[NSString stringWithFormat:@"%d",t])];
             }
             // 设置动画时长
             _gifLoopPlayView.duration = 0.85;
         };return _gifLoopPlayView;
     }
 */
#endif /* JOBS_HEADER_GUARD_GIFLOOPPLAYVIEW_C24003D652 */
