//
//  UIView+Measure.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+Measure.h"

@implementation UIView (Measure)

-(JobsRetViewByFrameBlock _Nonnull)byFrame{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGRect data){
        @jobs_strongify(self)
        self.frame = data;
        return self;
    };
}

-(JobsRetFrameByCGFloatBlock _Nonnull)resetOriginX{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data){
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.x = data;
        return frame;
    };
}

-(JobsRetFrameByCGFloatBlock _Nonnull)resetOriginY{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data){
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.origin.y = data;
        return frame;
    };
}

-(JobsRetFrameByCGFloatBlock _Nonnull)resetWidth{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data){
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.width = data;
        return frame;
    };
}

-(JobsRetFrameByCGFloatBlock _Nonnull)resetHeight{
    @jobs_weakify(self)
    return ^CGRect(CGFloat data){
        @jobs_strongify(self)
        CGRect frame = self.frame;
        frame.size.height = data;
        return frame;
    };
}
#pragma mark —— Prop_assign()CGFloat x
JobsKey(_x)
@dynamic x;
-(CGFloat)x{
    return [Jobs_getAssociatedObject(_x) floatValue] ? : self.frame.origin.x;
}

-(void)setX:(CGFloat)x{
    CGFloat X = x ? : self.frame.origin.x;
    self.frame = self.resetOriginX(X);
    Jobs_setAssociatedRETAIN_NONATOMIC(_x, @(X))
}
#pragma mark —— Prop_assign()CGFloat y
JobsKey(_y)
@dynamic y;
-(CGFloat)y{
    return [Jobs_getAssociatedObject(_y) floatValue] ? : self.frame.origin.y;
}

-(void)setY:(CGFloat)y{
    CGFloat Y = y ? : self.frame.origin.y;
    self.frame = self.resetOriginY(Y);
    Jobs_setAssociatedRETAIN_NONATOMIC(_y, @(Y))
}
#pragma mark —— Prop_assign()CGFloat width
JobsKey(_width)
@dynamic width;
-(CGFloat)width{
    return [Jobs_getAssociatedObject(_width) floatValue] ? : self.frame.size.width;
}

-(void)setWidth:(CGFloat)width{
    CGFloat Width = width ? : self.frame.size.width;
    self.frame = self.resetWidth(Width);
    Jobs_setAssociatedRETAIN_NONATOMIC(_width, @(Width))
}
#pragma mark —— Prop_assign()CGFloat height
JobsKey(_height)
@dynamic height;
-(CGFloat)height{
    return [Jobs_getAssociatedObject(_height) floatValue] ? : self.frame.size.height;
}

-(void)setHeight:(CGFloat)height{
    CGFloat Height = height ? : self.frame.size.height;
    self.frame = self.resetHeight(Height);
    Jobs_setAssociatedRETAIN_NONATOMIC(_height, @(Height))
}

@end
