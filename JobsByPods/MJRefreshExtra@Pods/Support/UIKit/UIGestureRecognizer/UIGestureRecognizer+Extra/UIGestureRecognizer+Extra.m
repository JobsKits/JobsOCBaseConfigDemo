//
//  UIGestureRecognizer+Extra.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIGestureRecognizer+Extra.h"

@implementation UIGestureRecognizer (Extra)
-(JobsRetUIGestureRecognizerByjobsByVoidBlockBlock _Nonnull)gestureActionBy{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *(jobsByVoidBlock _Nonnull block){
        @jobs_strongify(self)
        if (!self) return nil;
        [self.rac_gestureSignal subscribeNext:^(__kindof UIGestureRecognizer * _Nullable gesture) {
            if(block) block();
        }];return self;
    };
}

-(JobsRetUIGestureRecognizerByjobsByGestureRecognizerBlockBlock _Nonnull)GestureActionBy{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *(jobsByGestureRecognizerBlock _Nonnull block){
        @jobs_strongify(self)
        if (!self) return nil;
        [self.rac_gestureSignal subscribeNext:^(__kindof UIGestureRecognizer * _Nullable gesture) {
            if(block) block(gesture);
        }];return self;
    };
}

-(jobsBySELBlock _Nonnull)removeAction{
    @jobs_weakify(self)
    return ^(SEL _Nullable data){
        @jobs_strongify(self)
        if(data) [self removeTarget:self.target action:data];
    };
}

-(jobsBySELBlock _Nonnull)addAction{
    @jobs_weakify(self)
    return ^(SEL _Nullable data){
        @jobs_strongify(self)
        if(data) [self addTarget:self.target action:data];
    };
}
#pragma mark —— Prop_strong(nullable)id target;
JobsKey(_target)
@dynamic target;
-(id)target{
    return Jobs_getAssociatedObject(_target);
}

-(void)setTarget:(id)target{
    Jobs_setAssociatedRETAIN_NONATOMIC(_target, target);
}

@end
