//
//  UIGestureRecognizer+Extra.m
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIGestureRecognizer+Extra.h"

JobsKey(JobsOCDSLGestureTargetKey)
JobsKey(JobsOCDSLGestureVoidBlockKey)
JobsKey(JobsOCDSLGestureRecognizerBlockKey)

@implementation UIGestureRecognizer (Extra)
-(__kindof UIGestureRecognizer *)gestureActionBy:(jobsByVoidBlock _Nonnull)block{
    self.target = self;
    Jobs_setAssociatedCOPY_NONATOMIC(JobsOCDSLGestureVoidBlockKey, block)
    [self addTarget:self action:@selector(jobs_ocdsl_handleGestureAction:)];
    return self;
}

-(__kindof UIGestureRecognizer *)GestureActionBy:(jobsByGestureRecognizerBlock _Nonnull)block{
    self.target = self;
    Jobs_setAssociatedCOPY_NONATOMIC(JobsOCDSLGestureRecognizerBlockKey, block)
    [self addTarget:self action:@selector(jobs_ocdsl_handleGestureAction:)];
    return self;
}

-(void)jobs_ocdsl_handleGestureAction:(__kindof UIGestureRecognizer *)gesture{
    jobsByVoidBlock voidBlock = Jobs_getAssociatedObject(JobsOCDSLGestureVoidBlockKey);
    if (voidBlock) voidBlock();
    jobsByGestureRecognizerBlock gestureBlock = Jobs_getAssociatedObject(JobsOCDSLGestureRecognizerBlockKey);
    if (gestureBlock) gestureBlock(gesture);
}

-(JobsRetGestureRecognizerBySELBlock _Nonnull)removeAction{
    __weak typeof(self) weakSelf = self;
    return ^__kindof UIGestureRecognizer *_Nullable(SEL _Nullable data){
        __strong typeof(weakSelf) self = weakSelf;
        if(data) [self removeTarget:self.target action:data];
        return self;
    };
}

-(JobsRetGestureRecognizerBySELBlock _Nonnull)addAction{
    __weak typeof(self) weakSelf = self;
    return ^__kindof UIGestureRecognizer *_Nullable(SEL _Nullable data){
        __strong typeof(weakSelf) self = weakSelf;
        if(data) [self addTarget:self.target action:data];
        return self;
    };
}

@dynamic target;
-(id)target{
    return Jobs_getAssociatedObject(JobsOCDSLGestureTargetKey);
}

-(void)setTarget:(id)target{
    Jobs_setAssociatedASSIGN(JobsOCDSLGestureTargetKey, target)
}

@end
