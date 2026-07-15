//
//  UIMenuItem+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "UIMenuItem+DSL.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

JobsKey(JobsUIMenuItemActionBlockKey)
JobsKey(JobsUIMenuItemActionSelectorNameKey)
static NSMapTable<NSString *, UIMenuItem *> *JobsUIMenuItemActionWeakMap(void){
    static NSMapTable<NSString *, UIMenuItem *> *map;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        map = [NSMapTable strongToWeakObjectsMapTable];
    });return map;
}

static void JobsUIMenuItemBlockActionIMP(id responder, SEL selector, id sender){
    NSString *selectorName = NSStringFromSelector(selector);
    UIMenuItem *menuItem = nil;
    @synchronized (JobsUIMenuItemActionWeakMap()) {
        menuItem = [JobsUIMenuItemActionWeakMap() objectForKey:selectorName];
    }
    jobsByMenuItemBlock block = Jobs_getAssociatedObjectByTarget(menuItem, JobsUIMenuItemActionBlockKey);
    if (block) block(menuItem);
}

static SEL JobsUIMenuItemEnsureActionSelector(UIMenuItem *menuItem){
    NSString *selectorName = Jobs_getAssociatedObjectByTarget(menuItem, JobsUIMenuItemActionSelectorNameKey);
    if (!selectorName.length) {
        selectorName = [NSString stringWithFormat:@"jobs_uimenuItemAction_%p:", menuItem];
        Jobs_setAssociatedCOPY_NONATOMICByTarget(menuItem, JobsUIMenuItemActionSelectorNameKey, selectorName)
    }
    SEL selector = NSSelectorFromString(selectorName);
    if (!class_getInstanceMethod(UIResponder.class, selector)) {
        class_addMethod(UIResponder.class,
                        selector,
                        (IMP)JobsUIMenuItemBlockActionIMP,
                        "v@:@");
    }
    @synchronized (JobsUIMenuItemActionWeakMap()) {
        [JobsUIMenuItemActionWeakMap() setObject:menuItem forKey:selectorName];
    };return selector;
}

BOOL JobsUIMenuItemCanPerformAction(SEL action){
    if (!action) return NO;
    NSString *selectorName = NSStringFromSelector(action);
    if (!selectorName.length) return NO;
    @synchronized (JobsUIMenuItemActionWeakMap()) {
        return [JobsUIMenuItemActionWeakMap() objectForKey:selectorName] != nil;
    }
}

@implementation UIMenuItem (DSL)
#pragma mark —— Make
+(JobsRetMenuItemByVoidBlock _Nonnull)byMenuItem{
    return ^__kindof UIMenuItem *_Nullable(void){
        return UIMenuItem.alloc.init;
    };
}

+(JobsRetMenuItemByStringBlock _Nonnull)byTitle{
    return ^__kindof UIMenuItem *_Nullable(NSString *_Nullable data){
        return UIMenuItem.byMenuItem().byTitle(data);
    };
}

#pragma mark —— Properties
-(JobsRetMenuItemByStringBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^__kindof UIMenuItem *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(JobsRetMenuItemBySELBlock _Nonnull)byAction{
    @jobs_weakify(self)
    return ^__kindof UIMenuItem *_Nullable(SEL _Nullable data){
        @jobs_strongify(self)
        self.action = data;
        return self;
    };
}

#pragma mark —— Block Action
-(JobsRetMenuItemByMenuItemBlock _Nonnull)byActionBlock{
    @jobs_weakify(self)
    return ^__kindof UIMenuItem *_Nullable(jobsByMenuItemBlock _Nullable block){
        @jobs_strongify(self)
        Jobs_setAssociatedCOPY_NONATOMIC(JobsUIMenuItemActionBlockKey, block)
        self.action = JobsUIMenuItemEnsureActionSelector(self);
        return self;
    };
}

@end

#pragma clang diagnostic pop
