//
//  UIView+JHGestureBlock.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+JHGestureBlock.h"

@implementation UIView (JHGestureBlock)

static const char *JHGestureBlockKey;
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
        
        NSMutableDictionary *blockDic = objc_getAssociatedObject(self, JHGestureBlockKey);
        if (!blockDic) {
            blockDic = @{}.mutableCopy;
            objc_setAssociatedObject(self, JHGestureBlockKey, blockDic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        [blockDic setObject:block forKey:string];
    
        return gesture;
    };return nil;
}

- (void)gestureAction:(UIGestureRecognizer *)gesture{
    NSMutableDictionary *blockDic = objc_getAssociatedObject(gesture.view, JHGestureBlockKey);
    JHGestureBlock block = blockDic[NSStringFromClass(gesture.class)];
    if (block) block(gesture.view, gesture);
}

@end
