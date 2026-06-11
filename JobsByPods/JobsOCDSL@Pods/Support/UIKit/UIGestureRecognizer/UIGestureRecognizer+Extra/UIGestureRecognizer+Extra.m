//
//  UIGestureRecognizer+Extra.m
//  JobsOCDSL Support
//
//  Migrated from JobsByOCPods on 2026年6月10日，星期三.
//

#import "UIGestureRecognizer+Extra.h"

static const void *JobsOCDSLGestureTargetKey = &JobsOCDSLGestureTargetKey;
static const void *JobsOCDSLGestureVoidBlockKey = &JobsOCDSLGestureVoidBlockKey;
static const void *JobsOCDSLGestureRecognizerBlockKey = &JobsOCDSLGestureRecognizerBlockKey;

@implementation UIGestureRecognizer (Extra)

-(__kindof UIGestureRecognizer *)gestureActionBy:(jobsByVoidBlock _Nonnull)block{
    self.target = self;
    objc_setAssociatedObject(self, JobsOCDSLGestureVoidBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(jobs_ocdsl_handleGestureAction:)];
    return self;
}

-(__kindof UIGestureRecognizer *)GestureActionBy:(jobsByGestureRecognizerBlock _Nonnull)block{
    self.target = self;
    objc_setAssociatedObject(self, JobsOCDSLGestureRecognizerBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(jobs_ocdsl_handleGestureAction:)];
    return self;
}

-(void)jobs_ocdsl_handleGestureAction:(__kindof UIGestureRecognizer *)gesture{
    jobsByVoidBlock voidBlock = objc_getAssociatedObject(self, JobsOCDSLGestureVoidBlockKey);
    if (voidBlock) voidBlock();

    jobsByGestureRecognizerBlock gestureBlock = objc_getAssociatedObject(self, JobsOCDSLGestureRecognizerBlockKey);
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
    return objc_getAssociatedObject(self, JobsOCDSLGestureTargetKey);
}

-(void)setTarget:(id)target{
    objc_setAssociatedObject(self,
                             JobsOCDSLGestureTargetKey,
                             target,
                             OBJC_ASSOCIATION_ASSIGN);
}

@end
