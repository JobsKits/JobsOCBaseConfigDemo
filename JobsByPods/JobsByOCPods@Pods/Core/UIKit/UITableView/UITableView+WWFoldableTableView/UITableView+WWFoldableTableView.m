//
//  UITableView+WWFoldableTableView.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UITableView+WWFoldableTableView.h"

@interface UITableView (WWFoldableTableViewPrivate)

-(JobsRetNSMutableSetByVoidBlock _Nonnull)ww_foldState;
-(jobsByNSMutableSetBlock _Nonnull)setWw_foldState;

@end

@implementation UITableView (WWFoldableTableView)
#pragma mark —— init
+ (void)load{
    SuppressWundeclaredSelectorWarning(
//                                       [self ww_swizzInstanceMethod:@selector(_numberOfSections)
//                                                         withMethod:@selector(ww__numberOfSections)];
                                       [self ww_swizzInstanceMethod:@selector(_numberOfRowsInSection:)
                                                         withMethod:@selector(ww__numberOfRowsInSection:)];
                                       );
}

- (NSInteger)ww__numberOfRowsInSection:(NSInteger)section{
    JobsRetByNSIntegerBlock action = ((JobsRetByNSIntegerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UITableView.class, @selector(jobsWw__numberOfRowsInSection)))(self, @selector(jobsWw__numberOfRowsInSection));
    return action ? action(section) : (NSInteger){0};
}

-(JobsRetByNSIntegerBlock _Nonnull)jobsWw__numberOfRowsInSection{
    @jobs_weakify(self)
    return ^NSInteger(NSInteger section){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        if(!self.ww_foldState() || !self.ww_foldState()){
            return [self ww__numberOfRowsInSection:section];
        }
        /// 根据折叠状态返回行数
        BOOL isFolded = self.ww_isSectionFolded(section);
        return isFolded ? 0 : [self ww__numberOfRowsInSection:section];
    };
}
JobsKey(_ww_foldable)
- (BOOL)ww_foldable{
    return Jobs_getAssociatedObject(_ww_foldable);
}

- (void)setWw_foldable:(BOOL)ww_foldable{
    [self willChangeValueForKey:@"ww_foldable"];
    Jobs_setAssociatedASSIGN(_ww_foldable, @(ww_foldable))
    [self didChangeValueForKey:@"ww_foldable"];
    if(ww_foldable && !self.ww_foldState()){
        NSMutableSet *foldState = NSMutableSet.set;
        self.jobsSetWw_foldState(foldState);
    }
    //clean up
    if(!ww_foldable){
        self.jobsSetWw_foldState(nil);
    }
}

-(JobsRetTableViewByBOOLBlock _Nonnull)byFoldable{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(BOOL data) {
        @jobs_strongify(self)
        [self setWw_foldable:data];
        return self;
    };
}

JobsKey(_ww_foldState)
- (JobsRetNSMutableSetByVoidBlock _Nonnull)ww_foldState{
    @jobs_weakify(self)
    return ^NSMutableSet *{
        @jobs_strongify(self)
        if (!self) return nil;
        return Jobs_getAssociatedObject(_ww_foldState);
    };
}

-(void)setWw_foldState:(NSMutableSet *)ww_foldState{
    jobsByNSMutableSetBlock action = ((jobsByNSMutableSetBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UITableView.class, @selector(jobsSetWw_foldState)))(self, @selector(jobsSetWw_foldState));
    if (action) action(ww_foldState);
}

-(jobsByNSMutableSetBlock _Nonnull)jobsSetWw_foldState{
    @jobs_weakify(self)
    return ^(NSMutableSet * ww_foldState){
        @jobs_strongify(self)
        if (!self) return;
        if(self.ww_foldable && ww_foldState != self.ww_foldState()){
            [self willChangeValueForKey:@"ww_foldState"];
            Jobs_setAssociatedRETAIN_NONATOMIC(_ww_foldState, ww_foldState)
            [self didChangeValueForKey:@"ww_foldState"];
        }
    };
}
#pragma mark —— methods
-(JobsRetBOOLByNSIntegerBlock _Nonnull)ww_isSectionFolded{
    @jobs_weakify(self)
    return ^BOOL(NSInteger section){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        if(!self.ww_foldable || !self.ww_foldState()){
            return NO;
        };return [self.ww_foldState() containsObject:@(section)];
    };
}

- (void)ww_foldSection:(NSInteger)section fold:(BOOL)fold{
    if(!self.ww_foldable || !self.ww_foldState()){
        return;
    }
    NSMutableSet *state = self.ww_foldState();
    if(fold){
        [state addObject:@(section)];
    }else{
        [state removeObject:@(section)];
    }
    self.jobsSetWw_foldState(state);
    @try {
        //防止crash
        [self reloadSections:[NSIndexSet indexSetWithIndex:section]
            withRowAnimation:UITableViewRowAnimationFade];
    } @catch (NSException *exception) {
        JobsLog(@"%@", exception);
        [self reloadData];
    }
}

@end

@implementation NSObject (WWExtension)
+(void)ww_swizzInstanceMethod:(SEL)methodOrig withMethod:(SEL)methodNew{
    Method orig = class_getInstanceMethod(self, methodOrig);
    Method new = class_getInstanceMethod(self, methodNew);
    if(orig && new){
        method_exchangeImplementations(orig, new);
    }else{
        JobsLog(@"swizz instance method failed: %s", sel_getName(methodOrig));
    }
}

+(void)ww_swizzClassMethod:(SEL)methodOrig withMethod:(SEL)methodNew{
    Method orig = class_getClassMethod(self, methodOrig);
    Method new = class_getClassMethod(self, methodNew);
    if(orig && new){
        method_exchangeImplementations(orig, new);
    }else{
        JobsLog(@"swizz class method failed: %s", sel_getName(methodOrig));
    }
}

@end
