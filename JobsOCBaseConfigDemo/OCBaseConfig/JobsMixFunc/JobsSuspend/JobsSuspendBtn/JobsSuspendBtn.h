//
//  JobsSuspendBtn.h
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSSUSPENDBTN_3751419CBC
#define JOBS_HEADER_GUARD_JOBSSUSPENDBTN_3751419CBC

#import <UIKit/UIKit.h>
#import "UIView+SuspendView.h"

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#import "JobsBaseProtocolHeader.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSuspendBtn : UIButton<BaseViewProtocol>

/// 开关悬浮拖拽能力
-(JobsRetBtnByBOOLBlock _Nonnull)byAllowDrag;

@end

NS_ASSUME_NONNULL_END
/**

    使用方法：
     # 如果是View：在需要作用的UIView的子类
     Prop_weak()UIViewController *vcer;//这个属性掌管悬浮效果，具体实现见  @interface UIView (SuspendView)
     -(void)drawRect:(CGRect)rect{
         [super drawRect:rect];
         if (self.isSuspend) {
             //开启悬浮效果
             self.vc = self.vcer;//外界传进来的，父承接的VC
             self.panRcognize.enabled = YES;
         }else{
             self.vc = nil;
         }
     }

     # 如果是ViewController
     -(JobsSuspendBtn *)suspendBtn{
         JobsSuspendBtn *SuspendBtn = Jobs_getAssociatedObject(_suspendBtn);
         if (!SuspendBtn) {
             SuspendBtn = JobsSuspendBtn.new;
             SuspendBtn.jobsResetBtnImage = @"旋转".img;
             SuspendBtn.isAllowDrag = YES;//悬浮效果必须要的参数
             @jobs_weakify(self)
             SuspendBtn.onClickBy(^(UIButton *x) {
                 @jobs_strongify(self)
                 x.selected = !x.selected;
                 JobsLog(@"%@",x.selected ? @"开始旋转".tr : @"停止旋转".tr);
                 // x.旋转动画(x.selected);
                 if (self.objBlock) self.objBlock(x);
             });
             self.view.vc = weak_self;
             [self.view addSubview:SuspendBtn];
             SuspendBtn.frame = CGRectMake(JobsMainScreen_WIDTH() - JobsWidth(50) - JobsWidth(5),
                                           JobsMainScreen_HEIGHT() - JobsTabBarHeightByBottomSafeArea(nil) - JobsWidth(100),
                                           JobsWidth(50),
                                           JobsWidth(50));
             SuspendBtn.cornerCutToCircleWithCornerRadius(SuspendBtn.width / 2));
             Jobs_setAssociatedRETAIN_NONATOMIC(_suspendBtn, SuspendBtn)
         };return SuspendBtn;
     }

     -(void)setSuspendBtn:(JobsSuspendBtn *)suspendBtn{
         Jobs_setAssociatedRETAIN_NONATOMIC(_suspendBtn, suspendBtn)
     }
*/
#endif /* JOBS_HEADER_GUARD_JOBSSUSPENDBTN_3751419CBC */
