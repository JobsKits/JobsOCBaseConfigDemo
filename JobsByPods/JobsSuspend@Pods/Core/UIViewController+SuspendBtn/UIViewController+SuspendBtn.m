//
//  UIViewController+SuspendBtn.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIViewController+SuspendBtn.h"

#import <JobsSuspend/UIButton+UI.h>
#import <JobsSuspend/UIButton+SimplyMake.h>
#import <JobsSuspend/NSObject+image.h>

@implementation UIViewController (SuspendBtn)
#pragma mark —— Prop_strong()JobsSuspendBtn *suspendBtn;
JobsKey(_suspendBtn)
@dynamic suspendBtn;
-(JobsSuspendBtn *)suspendBtn{
    JobsSuspendBtn *SuspendBtn = Jobs_getAssociatedObject(_suspendBtn);
    if (!SuspendBtn) {
        @jobs_weakify(self)
        SuspendBtn = self.view.addSubview(JobsSuspendBtn.initByNormalImage(@"旋转".img)
                                          .onClickBy(^(UIButton *x){
                                              @jobs_strongify(self)
                                              x.byToggleSelected();
                                              JobsLog(@"%@",x.jobs_isSelected ? @"开始旋转".jobsTr() : @"停止旋转".jobsTr());
                                              x.旋转动画(x.jobs_isSelected);
                                              if (self.objBlock) self.objBlock(x);
                                          }).onLongPressGestureBy(^(id data){
                                              JobsLog(@"");
                                          })
                                          .cornerCutToCircleWithCornerRadius(SuspendBtn.width / 2)
                                          .byFrame(CGRectMake(JobsMainScreen_WIDTH() - JobsWidth(50) - JobsWidth(5),
                                                              JobsMainScreen_HEIGHT() - JobsTabBarHeightByBottomSafeArea(nil) - JobsWidth(100),
                                                              JobsWidth(50),
                                                              JobsWidth(50))));
        SuspendBtn.byAllowDrag(YES);
        self.view.byVc(weak_self);
        Jobs_setAssociatedRETAIN_NONATOMIC(_suspendBtn, SuspendBtn)
    };return SuspendBtn;
}

-(void)setSuspendBtn:(JobsSuspendBtn *)suspendBtn{
    Jobs_setAssociatedRETAIN_NONATOMIC(_suspendBtn, suspendBtn)
}

@end
