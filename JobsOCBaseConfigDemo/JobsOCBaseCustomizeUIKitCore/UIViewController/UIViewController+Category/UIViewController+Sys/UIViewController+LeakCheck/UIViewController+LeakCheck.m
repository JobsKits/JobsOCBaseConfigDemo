//
//  UIViewController+LeakCheck.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIViewController+LeakCheck.h"

@implementation UIViewController (LeakCheck)
+(void)load{
#ifdef DEBUG
    self.exchangeMethod();
#endif
}

+(JobsRetNSPointerArrayByVoidBlock _Nonnull)sharePointerArray{
    return ^NSPointerArray *{
        static NSPointerArray *sharePointerArray = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharePointerArray = NSPointerArray.weakObjectsPointerArray; // 弱引用数组，避免强引用循环
        });return sharePointerArray;
    };
}

+(JobsRetNSMutableSetByVoidBlock _Nonnull)loggedLeakedControllers{
    return ^NSMutableSet *{
        static NSMutableSet *loggedLeakedControllers = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            loggedLeakedControllers = NSMutableSet.set;
        });return loggedLeakedControllers;
    };
}

+(jobsByVoidBlock _Nonnull)exchangeMethod{
    return ^{
        method_exchangeImplementations(class_getInstanceMethod(self, @selector(viewDidAppear:)),
                                       class_getInstanceMethod(self, @selector(my_viewDidAppear:)));
        method_exchangeImplementations(class_getInstanceMethod(self, @selector(viewDidDisappear:)),
                                       class_getInstanceMethod(self, @selector(my_viewDidDisappear:)));
        method_exchangeImplementations(class_getInstanceMethod(self, NSSelectorFromString(@"dealloc")),
                                       class_getInstanceMethod(self, @selector(my_dealloc)));
    };
}

-(void)my_viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIViewController.class, @selector(jobsMy_viewDidAppear)))(self, @selector(jobsMy_viewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsMy_viewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [self my_viewDidAppear:animated];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{
            NSPointerArray *pointerArray = UIViewController.sharePointerArray();
            NSMutableSet *loggedSet = UIViewController.loggedLeakedControllers();
            for (NSUInteger i = 0; i < pointerArray.count; i++) {
                id obj = (__bridge id)pointerArray.pointerByIndex(i);/// 转换成对象指针
                if (obj) {
                    if (!loggedSet.containsObject(obj)) {
                        loggedSet.add(obj);
                        NSLog(@"\n🔴 UIViewController Leaked Detected 🔴\n"
                              "Timestamp: %@\n"
                              "Class: %@\n"
                              "Description: %@\n"
                              "Address: %p\n",
                              self.currentTimeStringByStyle1(),
                              NSStringFromClass([obj class]),
                              obj,
                              obj);
                    }
                } else {
                    pointerArray.removePointerBy(i); // 清除 NULL 指针
                    i--; // 保持索引一致
                }
            }
        });
    };
}

-(void)my_viewDidDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIViewController.class, @selector(jobsMy_viewDidDisappear)))(self, @selector(jobsMy_viewDidDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsMy_viewDidDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [self my_viewDidDisappear:animated];
        // 排除系统类
        if (![NSStringFromClass([self class]) hasPrefix:@"UI"]) {
            BOOL shouldAdd = NO;
            if (self.presentingViewController && self.presentingViewController.presentedViewController == self) {
                shouldAdd = YES;
            } else if (self.navigationController && ![self.navigationController.viewControllers containsObject:self]) {
                shouldAdd = YES;
            }if (shouldAdd) UIViewController.sharePointerArray().add((__bridge void *)self);
        }
    };
}

-(void)my_dealloc{
    // 析构期不能再为 self 建立弱引用，因此保留不捕获 self 的传统清理入口
    NSPointerArray *pointerArray = UIViewController.sharePointerArray();
    for (NSUInteger i = 0; i < pointerArray.count; i++) {
        id obj = (__bridge id)pointerArray.pointerByIndex(i);/// 转换成对象指针
        if (obj == self) {
            pointerArray.removePointerBy(i);
            break;
        }
    }
    [UIViewController.loggedLeakedControllers() removeObject:self];
    [self my_dealloc];
}

@end
