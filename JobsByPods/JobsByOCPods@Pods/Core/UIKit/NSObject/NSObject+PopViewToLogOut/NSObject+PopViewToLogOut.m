//
//  NSObject+PopViewToLogOut.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+PopViewToLogOut.h"

// 旧 Demo 的强定义优先；弱缺省值让独立 Pod 无需宿主提供旗标。
BOOL ISLogin __attribute__((weak)) = NO;

@implementation NSObject (PopViewToLogOut)
#pragma mark —— Prop_strong()UIViewModel *logOutPopupVM;
JobsKey(_logOutPopupVM)
@dynamic logOutPopupVM;
-(UIViewModel *)logOutPopupVM{
    UIViewModel *LogOutPopupVM = Jobs_getAssociatedObject(_logOutPopupVM);
    if (!LogOutPopupVM) {
        LogOutPopupVM = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.textModel.byText(@"Confirm to exit ?".jobsTr())
                          .byFont(UIFontWeightRegularSize(14))
                          .byTextAlignment(NSTextAlignmentCenter);
            data.subTextModel.byText(@"".jobsTr());
            data.byBgCor(JobsWhiteColor);
        });Jobs_setAssociatedRETAIN_NONATOMIC(_logOutPopupVM, LogOutPopupVM)
    };return LogOutPopupVM;
}

-(void)setLogOutPopupVM:(UIViewModel *)logOutPopupVM{
    Jobs_setAssociatedRETAIN_NONATOMIC(_logOutPopupVM, logOutPopupVM)
}
#pragma mark —— Prop_strong()JobsBasePopupView *logOutPopupView;
JobsKey(_logOutPopupView)
@dynamic logOutPopupView;
-(JobsBasePopupView *)logOutPopupView{
    JobsBasePopupView *LogOutPopupView = Jobs_getAssociatedObject(_logOutPopupView);
    if (!LogOutPopupView) {
        LogOutPopupView = JobsBasePopupView
            .BySize(JobsBasePopupView.viewSizeByModel(nil))
            .JobsRichViewByModel2(self.logOutPopupVM);
        Jobs_setAssociatedRETAIN_NONATOMIC(_logOutPopupView, LogOutPopupView)
        __weak JobsBasePopupView *weakPopupView = LogOutPopupView;
        @jobs_weakify(self)
        LogOutPopupView.JobsBlock1(^(UIButton *data) {
            @jobs_strongify(self)
            JobsBasePopupView *popupView = weakPopupView;
            if (!self || !popupView) {
                return;
            }
            if (data.tag == 666) {// 取消
                JobsLog(@"手滑了");
            }else if (data.tag == 999){// 确定退出
                self.logOut();
                self.jobsToastSuccessMsg(@"Logout succeeded".jobsTr());
                if (&ISLogin != NULL) {
                    ISLogin = NO;
                }
                JobsPostNotification(退出登录成功, @(NO));
            }
            [popupView tf_hide:nil];
        });
    }
    return LogOutPopupView;
}

-(void)setLogOutPopupView:(JobsBasePopupView *)logOutPopupView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_logOutPopupView, logOutPopupView)
}

@end
