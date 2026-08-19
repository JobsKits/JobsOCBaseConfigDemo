//
//  JobsRightMenuView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSRIGHTMENUVIEW_61099153F8
#define JOBS_HEADER_GUARD_JOBSRIGHTMENUVIEW_61099153F8

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsSuspend/JobsSuspend.h>)
#import <JobsSuspend/JobsSuspend.h>
#else
#import "JobsSuspend.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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

@interface JobsRightMenuView : BaseImageView

-(jobsByBtnBlock _Nonnull)resetUI;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsRightMenuView
-(JobsRetJobsRightMenuViewByNSArrayUIButtonBlock _Nonnull)byDatas;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsRightMenuView
@end

NS_ASSUME_NONNULL_END

/**

     #import <JobsOCTools/JobsRightMenuView.h> /// 首页右侧菜单
     Prop_strong()JobsRightMenuView *rightMenuView; /// 首页右侧菜单
     self.rightMenuView.byAlpha(1);


     -(JobsRightMenuView *)rightMenuView{
         if(!_rightMenuView){
             @jobs_weakify(self)
             _rightMenuView = self.view.addSubview(JobsRightMenuView
                                                   .BySize(JobsRightMenuView.viewSizeByModel(nil))
                                                   .JobsRichViewByModel2(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                                                       viewModel.data = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIButton *>* _Nullable arr) {
                                                           arr.add(BaseButton.jobsInit()
                                                                   .imageURL(@"".jobsURL())
                                                                   .placeholderImage(@"首页右侧悬浮菜单人工客服".img)
                                                                   .options(SDWebImageRefreshCached)/// 强制刷新缓存
                                                                   .completed(^(UIImage * _Nullable image,
                                                                                NSError * _Nullable error,
                                                                                SDImageCacheType cacheType,
                                                                                NSURL * _Nullable imageURL) {
                                                               if (error) {
                                                                   JobsLog(@"图片加载失败: %@-%@", error,imageURL);
                                                               } else {
                                                                   JobsLog(@"图片加载成功");
                                                               }
                                                           }).onClickBy(^(UIButton *x){
                                                               @jobs_strongify(self)
                                                               self->_rightMenuView.resetUI(x);
                                                               x.byToggleSelected();
     //                                                          toastBy(@"人工客服");
                                                               self.唤起人工客服();
     //                                                          if (self.objBlock) self.objBlock(x);
                                                           }).onLongPressGestureBy(^(id data){
                                                               JobsLog(@"");
                                                           }).normalLoad())
                                                          .add(BaseButton.jobsInit()
                                                               .imageURL(@"".jobsURL())
                                                               .placeholderImage(@"首页右侧悬浮菜单Telegram".img)
                                                               .options(SDWebImageRefreshCached)/// 强制刷新缓存
                                                               .completed(^(UIImage * _Nullable image,
                                                                            NSError * _Nullable error,
                                                                            SDImageCacheType cacheType,
                                                                            NSURL * _Nullable imageURL) {
                                                              if (error) {
                                                                  JobsLog(@"图片加载失败: %@-%@", error,imageURL);
                                                              } else {
                                                                  JobsLog(@"图片加载成功");
                                                              }
                                                          }).onClickBy(^(UIButton *x){
                                                              @jobs_strongify(self)
                                                              self->_rightMenuView.resetUI(x);
                                                              x.byToggleSelected();
                                                              toastBy(@"Telegram");
                                                              self.jobsOpenURL(@"https://t.me/bsports_ph");
     //                                                         if (self.objBlock) self.objBlock(x);
                                                          }).onLongPressGestureBy(^(id data){
                                                              JobsLog(@"");
                                                          }).normalLoad())
                                                          .add(BaseButton.jobsInit()
                                                               .imageURL(@"".jobsURL())
                                                               .placeholderImage(@"首页右侧悬浮菜单FaceBook".img)
                                                               .options(SDWebImageRefreshCached)/// 强制刷新缓存
                                                               .completed(^(UIImage * _Nullable image,
                                                                            NSError * _Nullable error,
                                                                            SDImageCacheType cacheType,
                                                                            NSURL * _Nullable imageURL) {
                                                              if (error) {
                                                                  JobsLog(@"图片加载失败: %@-%@", error,imageURL);
                                                              } else {
                                                                  JobsLog(@"图片加载成功");
                                                              }
                                                          }).onClickBy(^(UIButton *x){
                                                              @jobs_strongify(self)
                                                              self->_rightMenuView.resetUI(x);
                                                              x.byToggleSelected();
                                                              toastBy(@"FaceBook");
                                                              self.jobsOpenURL(@"https://www.facebook.com/profile.php?id=61569306594235");
                                                              if (self.objBlock) self.objBlock(x);
                                                          }).onLongPressGestureBy(^(id data){
                                                              JobsLog(@"");
                                                          }).normalLoad());
                                                       });
                                                   }))
                                                   .JobsBlock1(^(UIButton *x) {
                                                       [UIView animateWithDuration:1
                                                                        animations:^{
                                                           @jobs_strongify(self)
                                                           self->_rightMenuView.resetOriginXByOffset(x.jobs_isSelected ? JobsWidth(-30) :JobsWidth(30));
                                                       }];
                                                   }));
             _rightMenuView.resetOriginX(JobsMainScreen_WIDTH() - JobsWidth(20));
             _rightMenuView.resetOriginY(JobsStatusBarHeight() + JobsWidth(54 + 163 + 100));
         };return _rightMenuView;
     }
 */
#endif /* JOBS_HEADER_GUARD_JOBSRIGHTMENUVIEW_61099153F8 */
