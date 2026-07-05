//
//  UIWindow+JobsAppTools.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIWindow+JobsAppTools.h"

@implementation UIWindow (JobsAppTools)
/// 横屏模式下的Window（宽高互换）
-(__kindof UIWindow *)landscape{
    if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
        self.byFrame(self.landscapeWindowFrame());

    };return self;
}

@end
