//
//  UITableView+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UITableView+DSL.h"
#import <objc/runtime.h>

JobsKey(_jobsTableViewBlocksProxy)
JobsKey(_jobsTableViewDataSourceMux)
JobsKey(_jobsTableViewDelegateMux)

@interface JobsTableViewBlocksProxy : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak, nullable) id target;
@property (nonatomic, copy, nullable) jobsTableViewNumberOfSectionsBlock numberOfSectionsBlock;
@property (nonatomic, copy, nullable) jobsTableViewNumberOfRowsInSectionBlock numberOfRowsInSectionBlock;
@property (nonatomic, copy, nullable) jobsTableViewCellForRowAtBlock cellForRowAtBlock;
@property (nonatomic, copy, nullable) jobsTableViewDidSelectRowAtBlock didSelectRowAtBlock;

@end

@implementation JobsTableViewBlocksProxy

-(id)resolvedTarget{
    return self.target ?: self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.numberOfSectionsBlock ? self.numberOfSectionsBlock(self.resolvedTarget, tableView) : 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.numberOfRowsInSectionBlock ? self.numberOfRowsInSectionBlock(self.resolvedTarget, tableView, section) : 0;
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.cellForRowAtBlock ? self.cellForRowAtBlock(self.resolvedTarget, tableView, indexPath) : UITableViewCell.alloc.init;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.didSelectRowAtBlock){
        self.didSelectRowAtBlock(self.resolvedTarget, tableView, indexPath);
    }
}

@end

@interface JobsTableViewDataSourceMux : NSObject <UITableViewDataSource>

@property (nonatomic, weak, nullable) NSObject<UITableViewDataSource> *primary;
@property (nonatomic, weak, nullable) NSObject<UITableViewDataSource> *secondary;

@end

@implementation JobsTableViewDataSourceMux

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

@interface JobsTableViewDelegateMux : NSObject <UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic, weak, nullable) NSObject<UITableViewDelegate> *primary;
@property (nonatomic, weak, nullable) NSObject<UITableViewDelegate> *secondary;

@end

@implementation JobsTableViewDelegateMux

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

static inline JobsTableViewBlocksProxy *jobs_tableViewBlocksProxy(UITableView *tableView, BOOL createIfNeeded){
    JobsTableViewBlocksProxy *proxy = Jobs_getAssociatedObjectByTargetRawKey(tableView, &_jobsTableViewBlocksProxy);
    if (!proxy && createIfNeeded){
        proxy = JobsTableViewBlocksProxy.alloc.init;
        Jobs_setAssociatedRETAIN_NONATOMICByTargetRawKey(tableView, &_jobsTableViewBlocksProxy, proxy)
    };return proxy;
}

static inline JobsTableViewDataSourceMux *jobs_tableViewDataSourceMux(UITableView *tableView, BOOL createIfNeeded){
    JobsTableViewDataSourceMux *mux = Jobs_getAssociatedObjectByTargetRawKey(tableView, &_jobsTableViewDataSourceMux);
    if (!mux && createIfNeeded){
        mux = JobsTableViewDataSourceMux.alloc.init;
        Jobs_setAssociatedRETAIN_NONATOMICByTargetRawKey(tableView, &_jobsTableViewDataSourceMux, mux)
    };return mux;
}

static inline JobsTableViewDelegateMux *jobs_tableViewDelegateMux(UITableView *tableView, BOOL createIfNeeded){
    JobsTableViewDelegateMux *mux = Jobs_getAssociatedObjectByTargetRawKey(tableView, &_jobsTableViewDelegateMux);
    if (!mux && createIfNeeded){
        mux = JobsTableViewDelegateMux.alloc.init;
        Jobs_setAssociatedRETAIN_NONATOMICByTargetRawKey(tableView, &_jobsTableViewDelegateMux, mux)
    };return mux;
}

static inline void jobs_installTableViewDataSourceMux(UITableView *tableView){
    JobsTableViewBlocksProxy *proxy = jobs_tableViewBlocksProxy(tableView, YES);
    JobsTableViewDataSourceMux *mux = jobs_tableViewDataSourceMux(tableView, YES);
    id<UITableViewDataSource> current = tableView.dataSource;
    mux.primary = proxy;
    if (current && current != (id<UITableViewDataSource>)mux && current != (id<UITableViewDataSource>)proxy){
        mux.secondary = (NSObject<UITableViewDataSource> *)current;
    }
    tableView.dataSource = (id<UITableViewDataSource>)mux;
}

static inline void jobs_installTableViewDelegateMux(UITableView *tableView){
    JobsTableViewBlocksProxy *proxy = jobs_tableViewBlocksProxy(tableView, YES);
    JobsTableViewDelegateMux *mux = jobs_tableViewDelegateMux(tableView, YES);
    id<UITableViewDelegate> current = tableView.delegate;
    mux.primary = proxy;
    if (current && current != (id<UITableViewDelegate>)mux && current != (id<UITableViewDelegate>)proxy){
        mux.secondary = (NSObject<UITableViewDelegate> *)current;
    }
    tableView.delegate = (id<UITableViewDelegate>)mux;
}

@implementation UITableView (DSL)

-(JobsRetTableViewByDataSourceBlock _Nonnull)byDataSource{
    @jobs_weakify(self)
    return ^__kindof UITableView * (id<UITableViewDataSource> _Nullable ds){
        @jobs_strongify(self)
        JobsTableViewDataSourceMux *mux = jobs_tableViewDataSourceMux(self, NO);
        if (mux){
            mux.secondary = (NSObject<UITableViewDataSource> *)ds;
            self.dataSource = (id<UITableViewDataSource>)mux;
        } else{
            self.dataSource = ds;
        };return self;
    };
}

-(JobsRetTableViewByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof UITableView * (id<UITableViewDelegate> _Nullable dg){
        @jobs_strongify(self)
        JobsTableViewDelegateMux *mux = jobs_tableViewDelegateMux(self, NO);
        if (mux){
            mux.secondary = (NSObject<UITableViewDelegate> *)dg;
            self.delegate = (id<UITableViewDelegate>)mux;
        } else{
            self.delegate = dg;
        };return self;
    };
}

-(JobsRetTableViewByIDBlock _Nonnull)byTarget{
    @jobs_weakify(self)
    return ^__kindof UITableView * _Nullable(id _Nullable target){
        @jobs_strongify(self)
        JobsTableViewBlocksProxy *proxy = jobs_tableViewBlocksProxy(self, YES);
        proxy.target = target;
        jobs_installTableViewDataSourceMux(self);
        jobs_installTableViewDelegateMux(self);
        return self;
    };
}

-(JobsRetTableViewByNumberOfSectionsConfigBlock _Nonnull)byNumberOfSections{
    @jobs_weakify(self)
    return ^__kindof UITableView * _Nullable(jobsTableViewNumberOfSectionsBlock _Nullable block){
        @jobs_strongify(self)
        jobs_tableViewBlocksProxy(self, YES).numberOfSectionsBlock = block;
        jobs_installTableViewDataSourceMux(self);
        return self;
    };
}

-(JobsRetTableViewByNumberOfRowsInSectionConfigBlock _Nonnull)byNumberOfRowsInSection{
    @jobs_weakify(self)
    return ^__kindof UITableView * _Nullable(jobsTableViewNumberOfRowsInSectionBlock _Nullable block){
        @jobs_strongify(self)
        jobs_tableViewBlocksProxy(self, YES).numberOfRowsInSectionBlock = block;
        jobs_installTableViewDataSourceMux(self);
        return self;
    };
}

-(JobsRetTableViewByCellForRowAtConfigBlock _Nonnull)cellForRowAt{
    @jobs_weakify(self)
    return ^__kindof UITableView * _Nullable(jobsTableViewCellForRowAtBlock _Nullable block){
        @jobs_strongify(self)
        jobs_tableViewBlocksProxy(self, YES).cellForRowAtBlock = block;
        jobs_installTableViewDataSourceMux(self);
        return self;
    };
}

-(JobsRetTableViewByDidSelectRowAtConfigBlock _Nonnull)didSelectRowAt{
    @jobs_weakify(self)
    return ^__kindof UITableView * _Nullable(jobsTableViewDidSelectRowAtBlock _Nullable block){
        @jobs_strongify(self)
        jobs_tableViewBlocksProxy(self, YES).didSelectRowAtBlock = block;
        jobs_installTableViewDelegateMux(self);
        return self;
    };
}

-(JobsRetTableViewByDataSourcePrefetchingBlock _Nonnull)byPrefetchDataSource{
    @jobs_weakify(self)
    return ^__kindof UITableView * (id<UITableViewDataSourcePrefetching> _Nullable pds){
        @jobs_strongify(self) 
        if (@available(iOS 10.0, *)){
            self.prefetchDataSource = pds;
        };return self;
    };
}

-(JobsRetTableViewByBOOLBlock _Nonnull)byPrefetchingEnabled{
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL enabled){
        @jobs_strongify(self) 
        if (@available(iOS 15.0, tvOS 15.0, *)){
            self.prefetchingEnabled = enabled;
        };return self;
    };
}

-(JobsRetTableViewByDragDelegateBlock _Nonnull)byDragDelegate{
    @jobs_weakify(self)
    return ^__kindof UITableView * (id<UITableViewDragDelegate> _Nullable dd){
        @jobs_strongify(self) 
        if (@available(iOS 11.0, *)){
            self.dragDelegate = dd;
        };return self;
    };
}

-(JobsRetTableViewByDropDelegateBlock _Nonnull)byDropDelegate{
    @jobs_weakify(self)
    return ^__kindof UITableView * (id<UITableViewDropDelegate> _Nullable dp){
        @jobs_strongify(self) 
        if (@available(iOS 11.0, *)){
            self.dropDelegate = dp;
        };return self;
    };
}
#pragma mark —— Heights & Estimations
-(JobsRetTableViewByCGFloatBlock _Nonnull)byRowHeight{
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v){
        @jobs_strongify(self) 
        self.rowHeight = v;
        return self;
    };
}

-(JobsRetTableViewByCGFloatBlock _Nonnull)bySectionHeaderHeight{
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v){
        @jobs_strongify(self) 
        self.sectionHeaderHeight = v;
        return self;
    };
}

-(JobsRetTableViewByCGFloatBlock _Nonnull)bySectionFooterHeight{
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v){
        @jobs_strongify(self) 
        self.sectionFooterHeight = v;
        return self;
    };
}

-(JobsRetTableViewByCGFloatBlock _Nonnull)byEstimatedRowHeight{
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v){
        @jobs_strongify(self) 
        if (@available(iOS 7.0, *)){
            self.estimatedRowHeight = v;
        };return self;
    };
}

-(JobsRetTableViewByCGFloatBlock _Nonnull)byEstimatedSectionHeaderHeight{
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v){
        @jobs_strongify(self) 
        if (@available(iOS 7.0, *)){
            self.estimatedSectionHeaderHeight = v;
        };return self;
    };
}

-(JobsRetTableViewByCGFloatBlock _Nonnull)byEstimatedSectionFooterHeight{
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v){
        @jobs_strongify(self) 
        if (@available(iOS 7.0, *)){
            self.estimatedSectionFooterHeight = v;
        };return self;
    };
}

-(JobsRetTableViewByCGFloatBlock _Nonnull)byFillerRowHeight{
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v){
        @jobs_strongify(self) 
        if (@available(iOS 15.0, tvOS 15.0, *)){
            self.fillerRowHeight = v;
        };return self;
    };
}

-(JobsRetTableViewByCGFloatBlock _Nonnull)bySectionHeaderTopPadding{
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v){
        @jobs_strongify(self) 
        if (@available(iOS 15.0, tvOS 15.0, *)){
            self.sectionHeaderTopPadding = v;
        };return self;
    };
}
#pragma mark —— Separators & Insets
-(JobsRetTableViewByEdgeInsetsBlock _Nonnull)bySeparatorInset{
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIEdgeInsets insets){
        @jobs_strongify(self) 
        if (@available(iOS 7.0, *)){
            self.separatorInset = insets;
        };return self;
    };
}

-(JobsRetTableViewByNSIntegerBlock _Nonnull)bySeparatorInsetReference{
    @jobs_weakify(self)
    return ^__kindof UITableView * (UITableViewSeparatorInsetReference ref){
        @jobs_strongify(self) 
        if (@available(iOS 11.0, tvOS 11.0, *)){
            self.separatorInsetReference = ref;
        };return self;
    };
}

-(JobsRetTableViewByNSIntegerBlock _Nonnull)bySeparatorStyle{
    @jobs_weakify(self)
    return ^__kindof UITableView * (UITableViewCellSeparatorStyle style){
        @jobs_strongify(self) 
        self.separatorStyle = style; // tvOS 已在 .h 层标注不可用
        return self;
    };
}

-(JobsRetTableViewByCorBlock _Nonnull)bySeparatorColor{
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIColor * _Nullable color){
        @jobs_strongify(self) 
        self.separatorColor = color; // tvOS 已在 .h 层标注不可用
        return self;
    };
}

-(JobsRetTableViewByVisualEffectBlock _Nonnull)bySeparatorEffect{
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIVisualEffect * _Nullable effect){
        @jobs_strongify(self) 
        if (@available(iOS 8.0, *)){
            self.separatorEffect = effect; // tvOS 不可用，.h 已标注
        };return self;
    };
}
#pragma mark —— Self-Sizing invalidation
-(JobsRetTableViewByNSIntegerBlock _Nonnull)bySelfSizingInvalidation API_AVAILABLE(ios(16.0), tvos(16.0)) API_UNAVAILABLE(watchos){
    @jobs_weakify(self)
    return ^__kindof UITableView * (UITableViewSelfSizingInvalidation v){
        @jobs_strongify(self)
        self.selfSizingInvalidation = v;
        return self;
    };
}
#pragma mark —— Background
-(JobsRetTableViewByViewBlock _Nonnull)byBackgroundView{
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIView * _Nullable v){
        @jobs_strongify(self) 
        if (@available(iOS 3.2, *)){
            self.backgroundView = v;
        };return self;
    };
}
#pragma mark —— Appearance / Index
-(JobsRetTableViewByNSIntegerBlock _Nonnull)bySectionIndexMinimumDisplayRowCount{
    @jobs_weakify(self)
    return ^__kindof UITableView * (NSInteger v){
        @jobs_strongify(self) 
        self.sectionIndexMinimumDisplayRowCount = v;
        return self;
    };
}

-(JobsRetTableViewByCorBlock _Nonnull)bySectionIndexColor{
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIColor * _Nullable color){
        @jobs_strongify(self) 
        if (@available(iOS 6.0, *)){
            self.sectionIndexColor = color;
        };return self;
    };
}

-(JobsRetTableViewByCorBlock _Nonnull)bySectionIndexBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIColor * _Nullable color){
        @jobs_strongify(self) 
        if (@available(iOS 7.0, *)){
            self.sectionIndexBackgroundColor = color;
        };return self;
    };
}

-(JobsRetTableViewByCorBlock _Nonnull)bySectionIndexTrackingBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIColor * _Nullable color){
        @jobs_strongify(self) 
        if (@available(iOS 6.0, *)){
            self.sectionIndexTrackingBackgroundColor = color;
        };return self;
    };
}
#pragma mark —— Layout behavior
-(JobsRetTableViewByBOOLBlock _Nonnull)byCellLayoutMarginsFollowReadableWidth{
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on){
        @jobs_strongify(self) 
        if (@available(iOS 9.0, *)){
            self.cellLayoutMarginsFollowReadableWidth = on;
        };return self;
    };
}

-(JobsRetTableViewByBOOLBlock _Nonnull)byInsetsContentViewsToSafeArea{
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on){
        @jobs_strongify(self) 
        if (@available(iOS 11.0, tvOS 11.0, *)){
            self.insetsContentViewsToSafeArea = on;
        };return self;
    };
}
#pragma mark —— Header / Footer views
-(JobsRetTableViewByViewBlock _Nonnull)byTableHeaderView{
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIView * _Nullable v){
        @jobs_strongify(self) 
        self.tableHeaderView = v;
        return self;
    };
}

-(JobsRetTableViewByViewBlock _Nonnull)byTableFooterView{
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIView * _Nullable v){
        @jobs_strongify(self) 
        self.tableFooterView = v;
        return self;
    };
}
#pragma mark —— Editing / Selection
-(JobsRetTableViewByBOOLBlock _Nonnull)byEditing{
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL editing){
        @jobs_strongify(self) 
        self.editing = editing;
        return self;
    };
}

-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsSelection{
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on){
        @jobs_strongify(self) 
        if (@available(iOS 3.0, *)){
            self.allowsSelection = on;
        };return self;
    };
}

-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsSelectionDuringEditing{
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on){
        @jobs_strongify(self) 
        self.allowsSelectionDuringEditing = on;
        return self;
    };
}

-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsMultipleSelection{
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on){
        @jobs_strongify(self) 
        if (@available(iOS 5.0, *)){
            self.allowsMultipleSelection = on;
        };return self;
    };
}

-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsMultipleSelectionDuringEditing{
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on){
        @jobs_strongify(self) 
        if (@available(iOS 5.0, *)){
            self.allowsMultipleSelectionDuringEditing = on;
        };return self;
    };
}
#pragma mark —— Focus
-(JobsRetTableViewByBOOLBlock _Nonnull)byRemembersLastFocusedIndexPath{
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on){
        @jobs_strongify(self) 
        if (@available(iOS 9.0, *)){
            self.remembersLastFocusedIndexPath = on;
        };return self;
    };
}

-(JobsRetTableViewByBOOLBlock _Nonnull)bySelectionFollowsFocus{
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on){
        @jobs_strongify(self) 
        if (@available(iOS 14.0, *)){
            self.selectionFollowsFocus = on; // watchOS/tvOS 限制已在 .h 标
        };return self;
    };
}

-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsFocus{
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on){
        @jobs_strongify(self) 
        if (@available(iOS 15.0, tvOS 15.0, *)){
            self.allowsFocus = on;
        };return self;
    };
}

-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsFocusDuringEditing{
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on){
        @jobs_strongify(self) 
        if (@available(iOS 15.0, tvOS 15.0, *)){
            self.allowsFocusDuringEditing = on;
        };return self;
    };
}
#pragma mark —— Drag & Drop
-(JobsRetTableViewByBOOLBlock _Nonnull)byDragInteractionEnabled{
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on){
        @jobs_strongify(self) 
        if (@available(iOS 11.0, *)){
            self.dragInteractionEnabled = on;
        };return self;
    };
}
#pragma mark —— Content Hugging Elements (iOS 18+)
#if defined(__IPHONE_18_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_18_0)
-(JobsRetTableViewByNSIntegerBlock _Nonnull)byContentHuggingElements
    API_AVAILABLE(ios(18.0), tvos(18.0), visionos(2.0)) API_UNAVAILABLE(watchos){
    @jobs_weakify(self)
    return ^__kindof UITableView * (UITableViewContentHuggingElements v){
        @jobs_strongify(self)
        self.contentHuggingElements = v;
        return self;
    };
}

#endif

@end
