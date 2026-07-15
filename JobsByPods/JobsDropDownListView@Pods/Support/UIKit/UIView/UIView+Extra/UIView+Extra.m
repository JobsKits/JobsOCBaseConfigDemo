//
//  UIView+Extra.m
//  AFNetworking
//
//  Created by Jobs on 2026/5/20.
//

#import "UIView+Extra.h"

@implementation UIView (Extra)
/// 数据（字符串）定宽
-(JobsRetCGFloatByIDBlock _Nonnull)widthByData{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.widthByData(data);
    };
}
/// 数据（字符串）定高
-(JobsRetCGFloatByIDBlock _Nonnull)heightByData{
    @jobs_weakify(self)
    return ^CGFloat(id _Nullable data){
        @jobs_strongify(self)
        return self.class.heightByData(data);
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
    self.byHidden(!jobsVisible);
    self.byAlpha(jobsVisible);
    Jobs_setAssociatedRETAIN_NONATOMIC(_jobsVisible, @(jobsVisible))
}

@end
