//
//  JobsSuspendLab.h
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSSUSPENDLAB_6EF04B3A81
#define JOBS_HEADER_GUARD_JOBSSUSPENDLAB_6EF04B3A81

#import <UIKit/UIKit.h>
#import "UIView+SuspendView.h"

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#import "JobsBaseProtocolHeader.h"
#import "JobsLanMgr.h"
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsSuspendLab : UILabel <BaseProtocol>

Prop_assign()BOOL isAllowDrag;// 是否允许托拽手势

@end

NS_ASSUME_NONNULL_END
/**

    使用方法：
     在需要作用的UIView的子类

     Prop_weak()UIViewController *vcer;//这个属性掌管悬浮效果，具体实现见  @interface UIView (SuspendView)

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
#endif /* JOBS_HEADER_GUARD_JOBSSUSPENDLAB_6EF04B3A81 */
