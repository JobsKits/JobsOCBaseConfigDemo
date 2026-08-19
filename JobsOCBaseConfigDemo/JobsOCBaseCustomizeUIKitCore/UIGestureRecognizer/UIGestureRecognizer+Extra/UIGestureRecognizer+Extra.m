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
-(JobsRetIDByIDBlock _Nonnull)byTarget{
    @jobs_weakify(self)
    return ^id(id target){
        @jobs_strongify(self)
        self.target = target;
        return self;
    };
}

-(JobsRetUIGestureRecognizerByjobsByVoidBlockBlock _Nonnull)gestureActionBy{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *(jobsByVoidBlock _Nonnull block){
        @jobs_strongify(self)
        if (!self) return nil;
        self.byTarget(self);
        Jobs_setAssociatedCOPY_NONATOMIC(JobsOCDSLGestureVoidBlockKey, block)
        [self addTarget:self action:@selector(jobs_ocdsl_handleGestureAction:)];
        return self;
    };
}

-(__kindof UIGestureRecognizer *_Nullable)gestureActionBy:(jobsByVoidBlock _Nonnull)block{
    return (((JobsRetUIGestureRecognizerByjobsByVoidBlockBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIGestureRecognizer.class, @selector(gestureActionBy)))(self, @selector(gestureActionBy)))(block);
}

-(JobsRetUIGestureRecognizerByjobsByGestureRecognizerBlockBlock _Nonnull)GestureActionBy{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *(jobsByGestureRecognizerBlock _Nonnull block){
        @jobs_strongify(self)
        if (!self) return nil;
        self.byTarget(self);
        Jobs_setAssociatedCOPY_NONATOMIC(JobsOCDSLGestureRecognizerBlockKey, block)
        [self addTarget:self action:@selector(jobs_ocdsl_handleGestureAction:)];
        return self;
    };
}

-(__kindof UIGestureRecognizer *_Nonnull)GestureActionBy:(jobsByGestureRecognizerBlock _Nullable)block{
    return (((JobsRetUIGestureRecognizerByjobsByGestureRecognizerBlockBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIGestureRecognizer.class, @selector(GestureActionBy)))(self, @selector(GestureActionBy)))(block);
}

-(void)jobs_ocdsl_handleGestureAction:(__kindof UIGestureRecognizer *)gesture{
    jobsByGestureRecognizerBlock action = ((jobsByGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIGestureRecognizer.class, @selector(jobsJobs_ocdsl_handleGestureAction)))(self, @selector(jobsJobs_ocdsl_handleGestureAction));
    if (action) action(gesture);
}

-(jobsByGestureRecognizerBlock _Nonnull)jobsJobs_ocdsl_handleGestureAction{
    @jobs_weakify(self)
    return ^(__kindof UIGestureRecognizer * gesture){
        @jobs_strongify(self)
        if (!self) return;
        jobsByVoidBlock voidBlock = Jobs_getAssociatedObject(JobsOCDSLGestureVoidBlockKey);
        if (voidBlock) voidBlock();
        jobsByGestureRecognizerBlock gestureBlock = Jobs_getAssociatedObject(JobsOCDSLGestureRecognizerBlockKey);
        if (gestureBlock) gestureBlock(gesture);
    };
}

-(JobsRetGestureRecognizerBySELBlock _Nonnull)removeAction{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(SEL _Nullable data){
        @jobs_strongify(self)
        if(data) [self removeTarget:self.target action:data];
        return self;
    };
}

-(JobsRetGestureRecognizerBySELBlock _Nonnull)addAction{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(SEL _Nullable data){
        @jobs_strongify(self)
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
