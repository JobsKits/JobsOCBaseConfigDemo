//
//  UIView+Extra.m
//  WHToastExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+Extra.h"

@implementation UIView (Extra)

-(JobsRetViewByCGFloatBlock _Nonnull)byVisible{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat alpha){
        @jobs_strongify(self)
        self.jobsVisible = alpha;
        return self;
    };
}
/// 设置控件是否可见，对影响可视化的hidden 和 alpha属性进行操作
/// 需要特别注意的是：这个地方的jobsVisible不能属性化，否则在某些情况下会出现异常（只会走子类方法不会走分类方法）
JobsKey(_jobsVisible)
-(CGFloat)jobsVisible{
    BOOL JobsVisible = [Jobs_getAssociatedObject(_jobsVisible) floatValue];
    return JobsVisible;
}

-(void)setJobsVisible:(CGFloat)jobsVisible{
    self.hidden = !jobsVisible;
    self.alpha = jobsVisible;
    Jobs_setAssociatedRETAIN_NONATOMIC(_jobsVisible, @(jobsVisible))
}

@end
