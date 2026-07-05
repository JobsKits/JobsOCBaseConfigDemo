//
//  UIView+AppTool.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+AppTool.h"

@implementation UIView (AppTool)
/// 仅在横屏情况下交换Size宽高的值
-(JobsRetFrameByVoidBlock _Nonnull)fitSize{
    @jobs_weakify(self)
    return ^CGRect(){
        @jobs_strongify(self)
        if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
            return self.exchangeWidthAndHeight();
        }else return self.frame;
    };
}
/// 仅在横屏情况下交换坐标XY的值
-(JobsRetFrameByVoidBlock _Nonnull)fitOrigin{
    @jobs_weakify(self)
    return ^CGRect(){
        @jobs_strongify(self)
        if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
            return self.exchangeXAndY();
        }else return self.frame;
    };
}

@end
