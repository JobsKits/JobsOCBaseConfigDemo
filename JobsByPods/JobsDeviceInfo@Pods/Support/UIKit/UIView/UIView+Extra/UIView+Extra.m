//
//  UIView+Extra.m
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月17日，星期日.
//

#import "UIView+Extra.h"

@implementation UIView (Extra)

#pragma mark —— Prop_assign()CGFloat jobsVisible;
/// 需要特别注意的是：这个地方的jobsVisible不能属性化，否则在某些情况下会出现异常（只会走子类方法不会走分类方法）
JobsKey(_jobsVisible)
-(CGFloat)jobsVisible{
    BOOL JobsVisible = [Jobs_getAssociatedObject(_jobsVisible) floatValue];
    return JobsVisible;
}

-(void)setJobsVisible:(CGFloat)jobsVisible{
    self.byHidden(!jobsVisible);

    self.byAlpha(jobsVisible);

    Jobs_setAssociatedRETAIN_NONATOMIC(_jobsVisible, @(jobsVisible))
}

@end
