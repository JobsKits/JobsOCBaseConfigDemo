//
//  UIControl+DSL.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIControl+DSL.h"

/// 内部闭包包装器
@interface _JobsClosureWrapper : NSObject

Prop_copy()jobsByCtrlBlock handler;
-(instancetype)initWithHandler:(jobsByCtrlBlock)handler;
-(void)invoke:(UIControl *)sender;
-(jobsByCtrlBlock _Nonnull)jobsInvoke;

@end

@implementation _JobsClosureWrapper
-(instancetype)initWithHandler:(jobsByCtrlBlock)handler{
    if ( self = [super init]){
        _handler = [handler copy];
    };return self;
}

-(void)invoke:(UIControl *)sender{
    jobsByCtrlBlock action = ((jobsByCtrlBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(_JobsClosureWrapper.class, @selector(jobsInvoke)))(self, @selector(jobsInvoke));
    if (action) action(sender);
}

-(jobsByCtrlBlock _Nonnull)jobsInvoke{
    @jobs_weakify(self)
    return ^(UIControl * sender){
        @jobs_strongify(self)
        if (!self) return;
        if (self.handler){
            self.handler(sender);
        }
    };
}

@end
/// 辅助函数：注册事件 + Block
static const void *JobsClosureWrappersKey = &JobsClosureWrappersKey;

static NSMutableDictionary<NSNumber *, NSMutableArray<_JobsClosureWrapper *> *> *JobsClosureWrappers(UIControl *control,
                                                                                                       BOOL createIfNeeded){
    NSMutableDictionary *wrappers = objc_getAssociatedObject(control, JobsClosureWrappersKey);
    if (!wrappers && createIfNeeded) {
        wrappers = NSMutableDictionary.dictionary;
        objc_setAssociatedObject(control,
                                 JobsClosureWrappersKey,
                                 wrappers,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    };return wrappers;
}

static void JobsAddClosureAction(UIControl *control,
                                 UIControlEvents events,
                                 jobsByCtrlBlock handler){
    if (!control || !handler) return;
    _JobsClosureWrapper *wrapper = [_JobsClosureWrapper.alloc initWithHandler:handler];
    NSMutableDictionary *wrappers = JobsClosureWrappers(control, YES);
    NSNumber *eventKey = @(events);
    NSMutableArray *eventWrappers = wrappers[eventKey];
    if (!eventWrappers) {
        eventWrappers = NSMutableArray.array;
        wrappers[eventKey] = eventWrappers;
    }
    [eventWrappers addObject:wrapper];
    [control addTarget:wrapper
                action:@selector(invoke:)
      forControlEvents:events];
}

static void JobsRemoveClosureActions(UIControl *control,
                                     UIControlEvents events){
    NSMutableDictionary *wrappers = JobsClosureWrappers(control, NO);
    NSNumber *eventKey = @(events);
    NSArray<_JobsClosureWrapper *> *eventWrappers = [wrappers[eventKey] copy];
    for (_JobsClosureWrapper *wrapper in eventWrappers) {
        [control removeTarget:wrapper
                       action:@selector(invoke:)
             forControlEvents:events];
    }
    [wrappers removeObjectForKey:eventKey];
}

@implementation UIControl (DSL)
-(JobsRetControlByHandlerBlock _Nonnull)onJobsTap{
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (jobsByCtrlBlock handler){
        @jobs_strongify(self)
        if (!handler) return self;
        JobsAddClosureAction(self, UIControlEventTouchUpInside, handler);
        return self;
    };
}

-(JobsRetControlByHandlerBlock _Nonnull)onJobsChange{
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (jobsByCtrlBlock handler){
        @jobs_strongify(self)
        if (!handler) return self;
        JobsAddClosureAction(self, UIControlEventValueChanged, handler);
        return self;
    };
}

-(JobsRetControlByEventsHandlerBlock _Nonnull)onJobsEvent{
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (UIControlEvents events,
                                            jobsByCtrlBlock handler){
        @jobs_strongify(self)
        if (!handler) return self;
        JobsAddClosureAction(self, events, handler);
        return self;
    };
}

-(JobsRetControlByEventsBlock _Nonnull)offJobsEvent{
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (UIControlEvents events){
        @jobs_strongify(self)
        JobsRemoveClosureActions(self, events);
        return self;
    };
}

#pragma mark —— 基础状态

-(JobsRetControlByBOOLBlock _Nonnull)byEnabled{
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (BOOL value){
        @jobs_strongify(self)
        if (!self) return nil;
        self.enabled = value;
        return self;
    };
}

-(JobsRetControlByBOOLBlock _Nonnull)bySelected{
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (BOOL value){
        @jobs_strongify(self)
        if (!self) return nil;
        self.selected = value;
        return self;
    };
}

-(JobsRetControlByBOOLBlock _Nonnull)byHighlighted{
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (BOOL value){
        @jobs_strongify(self)
        if (!self) return nil;
        self.highlighted = value;
        return self;
    };
}

-(JobsRetControlByVoidBlock _Nonnull)byToggleSelected{
    @jobs_weakify(self)
    return ^__kindof UIControl *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        self.bySelected(!self.selected);
        return self;
    };
}

-(BOOL)jobs_isEnabled{
    return self.isEnabled;
}

-(BOOL)jobs_isSelected{
    return self.isSelected;
}

-(BOOL)jobs_isHighlighted{
    return self.isHighlighted;
}

-(UIControlState)jobs_effectiveState{
    return self.state;
}

#pragma mark —— 内容对齐

-(JobsRetControlByAlignBlock _Nonnull)byContentAlignment{
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (UIControlContentHorizontalAlignment horizontal,
                                            UIControlContentVerticalAlignment vertical){
        @jobs_strongify(self)
        if (!self) return nil;
        self.byContentHorizontalAlignment(horizontal);
        self.byContentVerticalAlignment(vertical);
        return self;
    };
}

-(JobsRetControlByHorizontalAlignBlock _Nonnull)byContentHorizontalAlignment{
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (UIControlContentHorizontalAlignment horizontal){
        @jobs_strongify(self)
        if (!self) return nil;
        self.contentHorizontalAlignment = horizontal;
        return self;
    };
}

-(JobsRetControlByVerticalAlignBlock _Nonnull)byContentVerticalAlignment{
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (UIControlContentVerticalAlignment vertical){
        @jobs_strongify(self)
        if (!self) return nil;
        self.contentVerticalAlignment = vertical;
        return self;
    };
}

-(JobsRetControlByTargetActionEventsBlock _Nonnull)byAddTarget{
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (__kindof id target,
                                            SEL action,
                                            UIControlEvents events){
        @jobs_strongify(self)
        if (!self) return nil;
        [self addTarget:target action:action forControlEvents:events];
        return self;
    };
}

-(JobsRetControlByTargetActionEventsBlock _Nonnull)byRemoveTarget{
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (__kindof id target,
                                            SEL action,
                                            UIControlEvents events){
        @jobs_strongify(self)
        if (!self) return nil;
        [self removeTarget:target action:action forControlEvents:events];
        return self;
    };
}

-(JobsRetControlByEventsBlock _Nonnull)bySendActions{
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (UIControlEvents events){
        @jobs_strongify(self)
        if (!self) return nil;
        [self sendActionsForControlEvents:events];
        return self;
    };
}

-(JobsRetControlByActionBlock _Nonnull)bySendAction API_AVAILABLE(ios(14.0)){
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (UIAction *action){
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 14.0, *)){
            if (action) [self sendAction:action];
        };return self;
    };
}

-(JobsRetControlByEventsBlock _Nonnull)bySendActionsForControlEvents{
    return self.bySendActions;
}

-(JobsRetControlByActionEventsBlock _Nonnull)byAddAction API_AVAILABLE(ios(14.0)){
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (UIAction *action,
                                            UIControlEvents events){
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 14.0, *)){
            if (action){
                [self addAction:action forControlEvents:events];
            }
        };return self;
    };
}

-(JobsRetControlByActionEventsBlock _Nonnull)byRemoveAction API_AVAILABLE(ios(14.0)){
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (UIAction *action,
                                            UIControlEvents events){
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 14.0, *)){
            if (action) [self removeAction:action forControlEvents:events];
        };return self;
    };
}

-(JobsRetControlByIdentifierEventsBlock _Nonnull)byRemoveActionByIdentifier API_AVAILABLE(ios(14.0)){
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (UIActionIdentifier identifier,
                                            UIControlEvents events){
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 14.0, *)){
            [self removeActionForIdentifier:identifier forControlEvents:events];
        };return self;
    };
}

-(JobsRetControlByEventsIdentifierActionHandlerBlock _Nonnull)byOnAction API_AVAILABLE(ios(14.0)){
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (UIControlEvents events,
                                            UIActionIdentifier _Nullable identifier,
                                            void(^handler)(UIAction *action)){
        @jobs_strongify(self)
        if (!handler) return self;
        if (@available(iOS 14.0, *)){
            UIAction *action = nil;
            if (identifier.length > 0){
                action = [UIAction actionWithTitle:@""
                                             image:nil
                                        identifier:identifier
                                          handler:handler];
            } else{
                action = [UIAction actionWithHandler:handler];
            }[self addAction:action forControlEvents:events];
        };return self;
    };
}

-(JobsRetControlByBOOLBlock _Nonnull)byShowsMenuAsPrimaryAction API_AVAILABLE(ios(14.0)){
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (BOOL value){
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 14.0, *)){
            self.showsMenuAsPrimaryAction = value;
        };return self;
    };
}

-(JobsRetControlByBOOLBlock _Nonnull)byContextMenuEnabled API_AVAILABLE(ios(14.0)){
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (BOOL value){
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 14.0, *)){
            self.contextMenuInteractionEnabled = value;
        };return self;
    };
}

-(JobsRetControlByBOOLBlock _Nonnull)byContextMenuInteractionEnabled API_AVAILABLE(ios(14.0)){
    return self.byContextMenuEnabled;
}

-(JobsRetControlByStringBlock _Nonnull)byToolTip API_AVAILABLE(ios(15.0)){
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (NSString * _Nullable text){
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 15.0, *)){
            self.toolTip = text;
        };return self;
    };
}

-(JobsRetControlByBOOLBlock _Nonnull)bySymbolAnimationEnabled API_AVAILABLE(ios(17.0)){
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (BOOL value){
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 17.0, *)){
            self.symbolAnimationEnabled = value;
        };return self;
    };
}

#if defined(__IPHONE_17_4) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_17_4)
-(JobsRetControlByVoidBlock _Nonnull)byPerformPrimaryAction API_AVAILABLE(ios(17.4)){
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (void){
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 17.4, *)){
            [self performPrimaryAction];
        };return self;
    };
}
#endif

@end
