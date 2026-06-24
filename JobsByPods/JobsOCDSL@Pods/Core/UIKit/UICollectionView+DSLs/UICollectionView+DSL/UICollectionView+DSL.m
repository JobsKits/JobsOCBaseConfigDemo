//
//  UICollectionView+DSL.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UICollectionView+DSL.h"

static void *JobsCollectionViewBlocksProxyKey = &JobsCollectionViewBlocksProxyKey;
static void *JobsCollectionViewDataSourceMuxKey = &JobsCollectionViewDataSourceMuxKey;
static void *JobsCollectionViewDelegateMuxKey = &JobsCollectionViewDelegateMuxKey;

@interface JobsCollectionViewBlocksProxy : NSObject <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak, nullable) id target;
@property (nonatomic, copy, nullable) jobsCollectionViewNumberOfSectionsBlock numberOfSectionsBlock;
@property (nonatomic, copy, nullable) jobsCollectionViewNumberOfItemsInSectionBlock numberOfItemsInSectionBlock;
@property (nonatomic, copy, nullable) jobsCollectionViewCellForItemAtBlock cellForItemAtBlock;
@property (nonatomic, copy, nullable) jobsCollectionViewDidSelectItemAtBlock didSelectItemAtBlock;

@end

@implementation JobsCollectionViewBlocksProxy

-(id)resolvedTarget{
    return self.target ?: self;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.numberOfSectionsBlock ? self.numberOfSectionsBlock(self.resolvedTarget, collectionView) : 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.numberOfItemsInSectionBlock ? self.numberOfItemsInSectionBlock(self.resolvedTarget, collectionView, section) : 0;
}

-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return self.cellForItemAtBlock ? self.cellForItemAtBlock(self.resolvedTarget, collectionView, indexPath) : UICollectionViewCell.alloc.init;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.didSelectItemAtBlock){
        self.didSelectItemAtBlock(self.resolvedTarget, collectionView, indexPath);
    }
}

@end

@interface JobsCollectionViewDataSourceMux : NSObject <UICollectionViewDataSource>

@property (nonatomic, weak, nullable) NSObject<UICollectionViewDataSource> *primary;
@property (nonatomic, weak, nullable) NSObject<UICollectionViewDataSource> *secondary;

@end

@implementation JobsCollectionViewDataSourceMux

-(BOOL)respondsToSelector:(SEL)aSelector{
    if ([super respondsToSelector:aSelector]) return YES;
    if ([(id)self.primary respondsToSelector:aSelector]) return YES;
    if ([(id)self.secondary respondsToSelector:aSelector]) return YES;
    return NO;
}

-(id)forwardingTargetForSelector:(SEL)aSelector{
    if ([(id)self.primary respondsToSelector:aSelector]) return self.primary;
    if ([(id)self.secondary respondsToSelector:aSelector]) return self.secondary;
    return [super forwardingTargetForSelector:aSelector];
}

-(BOOL)conformsToProtocol:(Protocol *)aProtocol{
    if ([super conformsToProtocol:aProtocol]) return YES;
    if ([(id)self.primary conformsToProtocol:aProtocol]) return YES;
    if ([(id)self.secondary conformsToProtocol:aProtocol]) return YES;
    return NO;
}

@end

@interface JobsCollectionViewDelegateMux : NSObject <UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak, nullable) NSObject<UICollectionViewDelegate> *primary;
@property (nonatomic, weak, nullable) NSObject<UICollectionViewDelegate> *secondary;

@end

@implementation JobsCollectionViewDelegateMux

-(BOOL)respondsToSelector:(SEL)aSelector{
    if ([super respondsToSelector:aSelector]) return YES;
    if ([(id)self.primary respondsToSelector:aSelector]) return YES;
    if ([(id)self.secondary respondsToSelector:aSelector]) return YES;
    return NO;
}

-(id)forwardingTargetForSelector:(SEL)aSelector{
    if ([(id)self.primary respondsToSelector:aSelector]) return self.primary;
    if ([(id)self.secondary respondsToSelector:aSelector]) return self.secondary;
    return [super forwardingTargetForSelector:aSelector];
}

-(BOOL)conformsToProtocol:(Protocol *)aProtocol{
    if ([super conformsToProtocol:aProtocol]) return YES;
    if ([(id)self.primary conformsToProtocol:aProtocol]) return YES;
    if ([(id)self.secondary conformsToProtocol:aProtocol]) return YES;
    return NO;
}

@end

static inline JobsCollectionViewBlocksProxy *jobs_collectionViewBlocksProxy(UICollectionView *collectionView, BOOL createIfNeeded){
    JobsCollectionViewBlocksProxy *proxy = objc_getAssociatedObject(collectionView, JobsCollectionViewBlocksProxyKey);
    if (!proxy && createIfNeeded){
        proxy = JobsCollectionViewBlocksProxy.alloc.init;
        objc_setAssociatedObject(collectionView, JobsCollectionViewBlocksProxyKey, proxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    };return proxy;
}

static inline JobsCollectionViewDataSourceMux *jobs_collectionViewDataSourceMux(UICollectionView *collectionView, BOOL createIfNeeded){
    JobsCollectionViewDataSourceMux *mux = objc_getAssociatedObject(collectionView, JobsCollectionViewDataSourceMuxKey);
    if (!mux && createIfNeeded){
        mux = JobsCollectionViewDataSourceMux.alloc.init;
        objc_setAssociatedObject(collectionView, JobsCollectionViewDataSourceMuxKey, mux, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    };return mux;
}

static inline JobsCollectionViewDelegateMux *jobs_collectionViewDelegateMux(UICollectionView *collectionView, BOOL createIfNeeded){
    JobsCollectionViewDelegateMux *mux = objc_getAssociatedObject(collectionView, JobsCollectionViewDelegateMuxKey);
    if (!mux && createIfNeeded){
        mux = JobsCollectionViewDelegateMux.alloc.init;
        objc_setAssociatedObject(collectionView, JobsCollectionViewDelegateMuxKey, mux, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    };return mux;
}

static inline void jobs_installCollectionViewDataSourceMux(UICollectionView *collectionView){
    JobsCollectionViewBlocksProxy *proxy = jobs_collectionViewBlocksProxy(collectionView, YES);
    JobsCollectionViewDataSourceMux *mux = jobs_collectionViewDataSourceMux(collectionView, YES);
    id<UICollectionViewDataSource> current = collectionView.dataSource;
    mux.primary = proxy;
    if (current && current != (id<UICollectionViewDataSource>)mux && current != (id<UICollectionViewDataSource>)proxy){
        mux.secondary = (NSObject<UICollectionViewDataSource> *)current;
    }
    collectionView.dataSource = (id<UICollectionViewDataSource>)mux;
}

static inline void jobs_installCollectionViewDelegateMux(UICollectionView *collectionView){
    JobsCollectionViewBlocksProxy *proxy = jobs_collectionViewBlocksProxy(collectionView, YES);
    JobsCollectionViewDelegateMux *mux = jobs_collectionViewDelegateMux(collectionView, YES);
    id<UICollectionViewDelegate> current = collectionView.delegate;
    mux.primary = proxy;
    if (current && current != (id<UICollectionViewDelegate>)mux && current != (id<UICollectionViewDelegate>)proxy){
        mux.secondary = (NSObject<UICollectionViewDelegate> *)current;
    }
    collectionView.delegate = (id<UICollectionViewDelegate>)mux;
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
        self.collectionViewLayout = layout;
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
        proxy.target = target;
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
