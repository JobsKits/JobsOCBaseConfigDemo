//
//  UICollectionView+DSL.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UICollectionView+DSL.h"

JobsKey(JobsCollectionViewBlocksProxyKey)
JobsKey(JobsCollectionViewDataSourceMuxKey)
JobsKey(JobsCollectionViewDelegateMuxKey)

@interface JobsCollectionViewBlocksProxy : NSObject <UICollectionViewDataSource, UICollectionViewDelegate>

Prop_weak(nullable)id target;
Prop_copy(nullable)jobsCollectionViewNumberOfSectionsBlock numberOfSectionsBlock;
Prop_copy(nullable)jobsCollectionViewNumberOfItemsInSectionBlock numberOfItemsInSectionBlock;
Prop_copy(nullable)jobsCollectionViewCellForItemAtBlock cellForItemAtBlock;
Prop_copy(nullable)jobsCollectionViewDidSelectItemAtBlock didSelectItemAtBlock;

-(JobsRetIDByIDBlock _Nonnull)byTarget;

@end

@implementation JobsCollectionViewBlocksProxy
-(JobsRetIDByIDBlock _Nonnull)byTarget{
    @jobs_weakify(self)
    return ^id _Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.target = data;
        return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)resolvedTarget{
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.target ?: self;
    };
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    JobsRetNSIntegerByUICollectionViewBlock action = ((JobsRetNSIntegerByUICollectionViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCollectionViewBlocksProxy.class, @selector(jobsNumberOfSectionsInCollectionView)))(self, @selector(jobsNumberOfSectionsInCollectionView));
    return action ? action(collectionView) : (NSInteger){0};
}

-(JobsRetNSIntegerByUICollectionViewBlock _Nonnull)jobsNumberOfSectionsInCollectionView{
    @jobs_weakify(self)
    return ^NSInteger(UICollectionView * collectionView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return self.numberOfSectionsBlock ? self.numberOfSectionsBlock(self.resolvedTarget(), collectionView) : 1;
    };
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.numberOfItemsInSectionBlock ? self.numberOfItemsInSectionBlock(self.resolvedTarget(), collectionView, section) : 0;
}

-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return self.cellForItemAtBlock ? self.cellForItemAtBlock(self.resolvedTarget(), collectionView, indexPath) : UICollectionViewCell.alloc.init;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.didSelectItemAtBlock){
        self.didSelectItemAtBlock(self.resolvedTarget(), collectionView, indexPath);
    }
}

@end

@interface JobsCollectionViewDataSourceMux : NSObject <UICollectionViewDataSource>

Prop_weak(nullable)NSObject<UICollectionViewDataSource> *primary;
Prop_weak(nullable)NSObject<UICollectionViewDataSource> *secondary;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsCollectionViewDataSourceMux
-(JobsRetJobsCollectionViewDataSourceMuxByNSObjectUICollectionViewDataSourceBlock _Nonnull)byPrimary;
-(JobsRetJobsCollectionViewDataSourceMuxByNSObjectUICollectionViewDataSourceBlock _Nonnull)bySecondary;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsCollectionViewDataSourceMux
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsCollectionViewDataSourceMux
@interface JobsCollectionViewDataSourceMux (JobsPropertyDSLSetterAutogen_63a5980a3b)
-(void)setPrimary:(NSObject<UICollectionViewDataSource> * _Nullable)data;
-(void)setSecondary:(NSObject<UICollectionViewDataSource> * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsCollectionViewDataSourceMux

@implementation JobsCollectionViewDataSourceMux
-(BOOL)respondsToSelector:(SEL)aSelector{
    JobsRetBOOLBySELBlock action = ((JobsRetBOOLBySELBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCollectionViewDataSourceMux.class, @selector(jobsRespondsToSelector)))(self, @selector(jobsRespondsToSelector));
    return action ? action(aSelector) : NO;
}

-(JobsRetBOOLBySELBlock _Nonnull)jobsRespondsToSelector{
    @jobs_weakify(self)
    return ^BOOL(SEL aSelector){
        @jobs_strongify(self)
        if (!self) return NO;
        if ([super respondsToSelector:aSelector]) return YES;
        if ([(id)self.primary respondsToSelector:aSelector]) return YES;
        if ([(id)self.secondary respondsToSelector:aSelector]) return YES;
        return NO;
    };
}

-(id)forwardingTargetForSelector:(SEL)aSelector{
    JobsRetIDBySELBlock action = ((JobsRetIDBySELBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCollectionViewDataSourceMux.class, @selector(jobsForwardingTargetForSelector)))(self, @selector(jobsForwardingTargetForSelector));
    return action ? action(aSelector) : nil;
}

-(JobsRetIDBySELBlock _Nonnull)jobsForwardingTargetForSelector{
    @jobs_weakify(self)
    return ^id(SEL aSelector){
        @jobs_strongify(self)
        if (!self) return nil;
        if ([(id)self.primary respondsToSelector:aSelector]) return self.primary;
        if ([(id)self.secondary respondsToSelector:aSelector]) return self.secondary;
        return [super forwardingTargetForSelector:aSelector];
    };
}

-(BOOL)conformsToProtocol:(Protocol *)aProtocol{
    JobsRetBOOLByProtocolBlock action = ((JobsRetBOOLByProtocolBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCollectionViewDataSourceMux.class, @selector(jobsConformsToProtocol)))(self, @selector(jobsConformsToProtocol));
    return action ? action(aProtocol) : NO;
}

-(JobsRetBOOLByProtocolBlock _Nonnull)jobsConformsToProtocol{
    @jobs_weakify(self)
    return ^BOOL(Protocol * aProtocol){
        @jobs_strongify(self)
        if (!self) return NO;
        if ([super conformsToProtocol:aProtocol]) return YES;
        if ([(id)self.primary conformsToProtocol:aProtocol]) return YES;
        if ([(id)self.secondary conformsToProtocol:aProtocol]) return YES;
        return NO;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsCollectionViewDataSourceMux
-(JobsRetJobsCollectionViewDataSourceMuxByNSObjectUICollectionViewDataSourceBlock _Nonnull)byPrimary{
    @jobs_weakify(self)
    return ^__kindof JobsCollectionViewDataSourceMux * _Nullable(NSObject<UICollectionViewDataSource> * _Nullable data){
        @jobs_strongify(self)
        [self setPrimary:data];
        return self;
    };
}

-(JobsRetJobsCollectionViewDataSourceMuxByNSObjectUICollectionViewDataSourceBlock _Nonnull)bySecondary{
    @jobs_weakify(self)
    return ^__kindof JobsCollectionViewDataSourceMux * _Nullable(NSObject<UICollectionViewDataSource> * _Nullable data){
        @jobs_strongify(self)
        [self setSecondary:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsCollectionViewDataSourceMux
@end

@interface JobsCollectionViewDelegateMux : NSObject <UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

Prop_weak(nullable)NSObject<UICollectionViewDelegate> *primary;
Prop_weak(nullable)NSObject<UICollectionViewDelegate> *secondary;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsCollectionViewDelegateMux
-(JobsRetJobsCollectionViewDelegateMuxByNSObjectUICollectionViewDelegateBlock _Nonnull)byPrimary;
-(JobsRetJobsCollectionViewDelegateMuxByNSObjectUICollectionViewDelegateBlock _Nonnull)bySecondary;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsCollectionViewDelegateMux
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsCollectionViewDelegateMux
@interface JobsCollectionViewDelegateMux (JobsPropertyDSLSetterAutogen_63a5980a3b)
-(void)setPrimary:(NSObject<UICollectionViewDelegate> * _Nullable)data;
-(void)setSecondary:(NSObject<UICollectionViewDelegate> * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsCollectionViewDelegateMux

@implementation JobsCollectionViewDelegateMux
-(BOOL)respondsToSelector:(SEL)aSelector{
    JobsRetBOOLBySELBlock action = ((JobsRetBOOLBySELBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCollectionViewDelegateMux.class, @selector(jobsRespondsToSelector)))(self, @selector(jobsRespondsToSelector));
    return action ? action(aSelector) : NO;
}

-(JobsRetBOOLBySELBlock _Nonnull)jobsRespondsToSelector{
    @jobs_weakify(self)
    return ^BOOL(SEL aSelector){
        @jobs_strongify(self)
        if (!self) return NO;
        if ([super respondsToSelector:aSelector]) return YES;
        if ([(id)self.primary respondsToSelector:aSelector]) return YES;
        if ([(id)self.secondary respondsToSelector:aSelector]) return YES;
        return NO;
    };
}

-(id)forwardingTargetForSelector:(SEL)aSelector{
    JobsRetIDBySELBlock action = ((JobsRetIDBySELBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCollectionViewDelegateMux.class, @selector(jobsForwardingTargetForSelector)))(self, @selector(jobsForwardingTargetForSelector));
    return action ? action(aSelector) : nil;
}

-(JobsRetIDBySELBlock _Nonnull)jobsForwardingTargetForSelector{
    @jobs_weakify(self)
    return ^id(SEL aSelector){
        @jobs_strongify(self)
        if (!self) return nil;
        if ([(id)self.primary respondsToSelector:aSelector]) return self.primary;
        if ([(id)self.secondary respondsToSelector:aSelector]) return self.secondary;
        return [super forwardingTargetForSelector:aSelector];
    };
}

-(BOOL)conformsToProtocol:(Protocol *)aProtocol{
    JobsRetBOOLByProtocolBlock action = ((JobsRetBOOLByProtocolBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCollectionViewDelegateMux.class, @selector(jobsConformsToProtocol)))(self, @selector(jobsConformsToProtocol));
    return action ? action(aProtocol) : NO;
}

-(JobsRetBOOLByProtocolBlock _Nonnull)jobsConformsToProtocol{
    @jobs_weakify(self)
    return ^BOOL(Protocol * aProtocol){
        @jobs_strongify(self)
        if (!self) return NO;
        if ([super conformsToProtocol:aProtocol]) return YES;
        if ([(id)self.primary conformsToProtocol:aProtocol]) return YES;
        if ([(id)self.secondary conformsToProtocol:aProtocol]) return YES;
        return NO;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsCollectionViewDelegateMux
-(JobsRetJobsCollectionViewDelegateMuxByNSObjectUICollectionViewDelegateBlock _Nonnull)byPrimary{
    @jobs_weakify(self)
    return ^__kindof JobsCollectionViewDelegateMux * _Nullable(NSObject<UICollectionViewDelegate> * _Nullable data){
        @jobs_strongify(self)
        [self setPrimary:data];
        return self;
    };
}

-(JobsRetJobsCollectionViewDelegateMuxByNSObjectUICollectionViewDelegateBlock _Nonnull)bySecondary{
    @jobs_weakify(self)
    return ^__kindof JobsCollectionViewDelegateMux * _Nullable(NSObject<UICollectionViewDelegate> * _Nullable data){
        @jobs_strongify(self)
        [self setSecondary:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsCollectionViewDelegateMux
@end

static inline JobsCollectionViewBlocksProxy *jobs_collectionViewBlocksProxy(UICollectionView *collectionView, BOOL createIfNeeded){
    JobsCollectionViewBlocksProxy *proxy = Jobs_getAssociatedObjectByTarget(collectionView, JobsCollectionViewBlocksProxyKey);
    if (!proxy && createIfNeeded){
        proxy = JobsCollectionViewBlocksProxy.alloc.init;
        Jobs_setAssociatedRETAIN_NONATOMICByTarget(collectionView, JobsCollectionViewBlocksProxyKey, proxy)
    };return proxy;
}

static inline JobsCollectionViewDataSourceMux *jobs_collectionViewDataSourceMux(UICollectionView *collectionView, BOOL createIfNeeded){
    JobsCollectionViewDataSourceMux *mux = Jobs_getAssociatedObjectByTarget(collectionView, JobsCollectionViewDataSourceMuxKey);
    if (!mux && createIfNeeded){
        mux = JobsCollectionViewDataSourceMux.alloc.init;
        Jobs_setAssociatedRETAIN_NONATOMICByTarget(collectionView, JobsCollectionViewDataSourceMuxKey, mux)
    };return mux;
}

static inline JobsCollectionViewDelegateMux *jobs_collectionViewDelegateMux(UICollectionView *collectionView, BOOL createIfNeeded){
    JobsCollectionViewDelegateMux *mux = Jobs_getAssociatedObjectByTarget(collectionView, JobsCollectionViewDelegateMuxKey);
    if (!mux && createIfNeeded){
        mux = JobsCollectionViewDelegateMux.alloc.init;
        Jobs_setAssociatedRETAIN_NONATOMICByTarget(collectionView, JobsCollectionViewDelegateMuxKey, mux)
    };return mux;
}

static inline void jobs_installCollectionViewDataSourceMux(UICollectionView *collectionView){
    JobsCollectionViewBlocksProxy *proxy = jobs_collectionViewBlocksProxy(collectionView, YES);
    JobsCollectionViewDataSourceMux *mux = jobs_collectionViewDataSourceMux(collectionView, YES);
    id<UICollectionViewDataSource> current = collectionView.dataSource;
    mux.byPrimary(proxy);
    if (current && current != (id<UICollectionViewDataSource>)mux && current != (id<UICollectionViewDataSource>)proxy){
        mux.bySecondary((NSObject<UICollectionViewDataSource> *)current);
    }
    collectionView.byDataSource((id<UICollectionViewDataSource>)mux);
}

static inline void jobs_installCollectionViewDelegateMux(UICollectionView *collectionView){
    JobsCollectionViewBlocksProxy *proxy = jobs_collectionViewBlocksProxy(collectionView, YES);
    JobsCollectionViewDelegateMux *mux = jobs_collectionViewDelegateMux(collectionView, YES);
    id<UICollectionViewDelegate> current = collectionView.delegate;
    mux.byPrimary(proxy);
    if (current && current != (id<UICollectionViewDelegate>)mux && current != (id<UICollectionViewDelegate>)proxy){
        mux.bySecondary((NSObject<UICollectionViewDelegate> *)current);
    }
    collectionView.byDelegate((id<UICollectionViewDelegate>)mux);
}

@implementation UICollectionView (DSL)
/// 核心属性
-(JobsRetCollectionViewByLayoutBlock _Nonnull)byCollectionViewLayout{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(UICollectionViewLayout *layout){
        @jobs_strongify(self)
        self.collectionViewLayout = layout;
        return self;
    };
}

-(JobsRetCollectionViewByFlowLayoutBlock _Nonnull)byCollectionViewFlowLayout{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(__kindof UICollectionViewFlowLayout *_Nullable layout){
        @jobs_strongify(self)
        self.byCollectionViewLayout(layout);
        return self;
    };
}

-(JobsRetCollectionViewByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(id<UICollectionViewDelegate> delegate){
        @jobs_strongify(self)
        JobsCollectionViewDelegateMux *mux = jobs_collectionViewDelegateMux(self, NO);
        if (mux){
            mux.secondary = (NSObject<UICollectionViewDelegate> *)delegate;
            self.delegate = (id<UICollectionViewDelegate>)mux;
        } else{
            self.delegate = delegate;
        };return self;
    };
}

-(JobsRetCollectionViewByDataSourceBlock _Nonnull)byDataSource{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(id<UICollectionViewDataSource> dataSource){
        @jobs_strongify(self)
        JobsCollectionViewDataSourceMux *mux = jobs_collectionViewDataSourceMux(self, NO);
        if (mux){
            mux.secondary = (NSObject<UICollectionViewDataSource> *)dataSource;
            self.dataSource = (id<UICollectionViewDataSource>)mux;
        } else{
            self.dataSource = dataSource;
        };return self;
    };
}

-(JobsRetCollectionViewByIDBlock _Nonnull)byTarget{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(id _Nullable target){
        @jobs_strongify(self)
        JobsCollectionViewBlocksProxy *proxy = jobs_collectionViewBlocksProxy(self, YES);
        proxy.byTarget(target);
        jobs_installCollectionViewDataSourceMux(self);
        jobs_installCollectionViewDelegateMux(self);
        return self;
    };
}

-(JobsRetCollectionViewByNumberOfSectionsConfigBlock _Nonnull)byNumberOfSections{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(jobsCollectionViewNumberOfSectionsBlock _Nullable block){
        @jobs_strongify(self)
        jobs_collectionViewBlocksProxy(self, YES).numberOfSectionsBlock = block;
        jobs_installCollectionViewDataSourceMux(self);
        return self;
    };
}

-(JobsRetCollectionViewByNumberOfItemsInSectionConfigBlock _Nonnull)byNumberOfItemsInSection{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(jobsCollectionViewNumberOfItemsInSectionBlock _Nullable block){
        @jobs_strongify(self)
        jobs_collectionViewBlocksProxy(self, YES).numberOfItemsInSectionBlock = block;
        jobs_installCollectionViewDataSourceMux(self);
        return self;
    };
}

-(JobsRetCollectionViewByCellForItemAtConfigBlock _Nonnull)cellForItemAt{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(jobsCollectionViewCellForItemAtBlock _Nullable block){
        @jobs_strongify(self)
        jobs_collectionViewBlocksProxy(self, YES).cellForItemAtBlock = block;
        jobs_installCollectionViewDataSourceMux(self);
        return self;
    };
}

-(JobsRetCollectionViewByDidSelectItemAtConfigBlock _Nonnull)didSelectItemAt{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(jobsCollectionViewDidSelectItemAtBlock _Nullable block){
        @jobs_strongify(self)
        jobs_collectionViewBlocksProxy(self, YES).didSelectItemAtBlock = block;
        jobs_installCollectionViewDelegateMux(self);
        return self;
    };
}

-(JobsRetCollectionViewByDataSourcePrefetchingBlock _Nonnull)byPrefetchDataSource{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(id<UICollectionViewDataSourcePrefetching> prefetchDataSource){
        @jobs_strongify(self)
        if (@available(iOS 10.0, *)){
            self.prefetchDataSource = prefetchDataSource;
        };return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock _Nonnull)byPrefetchingEnabled{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        if (@available(iOS 10.0, *)){
            self.prefetchingEnabled = flag;
        };return self;
    };
}

-(JobsRetCollectionViewByDragDelegateBlock _Nonnull)byDragDelegate{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(id<UICollectionViewDragDelegate> dragDelegate){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)){
            self.dragDelegate = dragDelegate;
        };return self;
    };
}

-(JobsRetCollectionViewByDropDelegateBlock _Nonnull)byDropDelegate{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(id<UICollectionViewDropDelegate> dropDelegate){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)){
            self.dropDelegate = dropDelegate;
        };return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock _Nonnull)byDragInteractionEnabled{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)){
            self.dragInteractionEnabled = flag;
        };return self;
    };
}

-(JobsRetCollectionViewByNSIntegerBlock _Nonnull)byReorderingCadence{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(UICollectionViewReorderingCadence cadence){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)){
            self.reorderingCadence = cadence;
        };return self;
    };
}

-(JobsRetCollectionViewByNSIntegerBlock _Nonnull)bySelfSizingInvalidation{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(UICollectionViewSelfSizingInvalidation invalidation){
        @jobs_strongify(self)
        if (@available(iOS 16.0, tvOS 16.0, *)){
            self.selfSizingInvalidation = invalidation;
        };return self;
    };
}

-(JobsRetCollectionViewByViewBlock _Nonnull)byBackgroundView{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(UIView *view){
        @jobs_strongify(self)
        self.backgroundView = view;
        return self;
    };
}
/// 选择 / 编辑
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsSelection{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        self.allowsSelection = flag;
        return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsMultipleSelection{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        self.allowsMultipleSelection = flag;
        return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock _Nonnull)byEditing{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        if (@available(iOS 14.0, tvOS 14.0, *)){
            self.editing = flag;
        };return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsSelectionDuringEditing{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        if (@available(iOS 14.0, tvOS 14.0, *)){
            self.allowsSelectionDuringEditing = flag;
        };return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsMultipleSelectionDuringEditing{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        if (@available(iOS 14.0, tvOS 14.0, *)){
            self.allowsMultipleSelectionDuringEditing = flag;
        };return self;
    };
}
/// Focus 相关
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byRemembersLastFocusedIndexPath{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        if (@available(iOS 9.0, *)){
            self.remembersLastFocusedIndexPath = flag;
        };return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock _Nonnull)bySelectionFollowsFocus{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        if (@available(iOS 14.0, *)){
            self.selectionFollowsFocus = flag;
        };return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsFocus{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)){
            self.allowsFocus = flag;
        };return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsFocusDuringEditing{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)){
            self.allowsFocusDuringEditing = flag;
        };return self;
    };
}

@end
