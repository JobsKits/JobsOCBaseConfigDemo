//
//  JobsSuspendView.h
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSSUSPENDVIEW_6A20CCA0B2
#define JOBS_HEADER_GUARD_JOBSSUSPENDVIEW_6A20CCA0B2

#import <UIKit/UIKit.h>
#import <JobsSuspend/UIView+SuspendView.h>

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
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

@interface JobsSuspendView : UIView

Prop_assign()BOOL isAllowDrag; // 是否允许托拽手势
Prop_copy()jobsByIDBlock suspendViewBlock;

-(void)actionSuspendViewBlock:(jobsByIDBlock _Nullable)suspendLabBlock;

@end

NS_ASSUME_NONNULL_END
/**

     使用方法：
     在需要作用的UIView的子类

     Prop_weak()UIViewController *vcer; // 这个属性掌管悬浮效果，具体实现见  @interface UIView (SuspendView)

     -(void)drawRect:(CGRect)rect{
         [super drawRect:rect];
         if (self.isSuspend) {
             //开启悬浮效果
             self.vc = self.vcer;
             self.panRcognize.enabled = YES;
         }else{
             self.vc = nil;
         }
     }
*/
#endif /* JOBS_HEADER_GUARD_JOBSSUSPENDVIEW_6A20CCA0B2 */
