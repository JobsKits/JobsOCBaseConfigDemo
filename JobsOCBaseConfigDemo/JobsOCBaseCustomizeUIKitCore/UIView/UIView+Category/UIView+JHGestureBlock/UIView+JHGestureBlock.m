//
//  UIView+JHGestureBlock.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+JHGestureBlock.h"

@implementation UIView (JHGestureBlock)
JobsKey(JHGestureBlockKey)
- (__kindof UIGestureRecognizer *)addGestureRecognizer:(JHGestureType)type block:(JHGestureBlock)block{
    if (block) {
        NSDictionary *dic = @{@"0":@"UITapGestureRecognizer",
                              @"1":@"UILongPressGestureRecognizer",
                              @"2":@"UISwipeGestureRecognizer",
                              @"3":@"UIPanGestureRecognizer",
                              @"4":@"UIRotationGestureRecognizer",
                              @"5":@"UIPinchGestureRecognizer"};
        NSString *string = dic[@(type).stringValue];
        UIGestureRecognizer *gesture = [NSClassFromString(string).alloc initWithTarget:self action:@selector(gestureAction:)];
        [self addGestureRecognizer:gesture];
        NSMutableDictionary *blockDic = Jobs_getAssociatedObject(JHGestureBlockKey);
        if (!blockDic) {
            blockDic = @{}.mutableCopy;
            Jobs_setAssociatedRETAIN_NONATOMIC(JHGestureBlockKey, blockDic)
        }
        [blockDic setObject:block forKey:string];
        return gesture;
    };return nil;
}

- (void)gestureAction:(UIGestureRecognizer *)gesture{
    jobsByGestureRecognizerBlock action = ((jobsByGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIView.class, @selector(jobsGestureAction)))(self, @selector(jobsGestureAction));
    if (action) action(gesture);
}

-(jobsByGestureRecognizerBlock _Nonnull)jobsGestureAction{
    @jobs_weakify(self)
    return ^(UIGestureRecognizer * gesture){
        @jobs_strongify(self)
        if (!self) return;
        NSMutableDictionary *blockDic = Jobs_getAssociatedObjectByTarget(gesture.view, JHGestureBlockKey);
        JHGestureBlock block = blockDic[NSStringFromClass(gesture.class)];
        if (block) block(gesture.view, gesture);
    };
}

@end
