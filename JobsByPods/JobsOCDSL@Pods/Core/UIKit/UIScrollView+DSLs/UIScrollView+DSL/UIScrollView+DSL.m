//
//  UIScrollView+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIScrollView+DSL.h"

@implementation UIScrollView (DSL)
#pragma mark —— UIScrollViewProtocol
-(JobsRetScrollViewByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(id <UIScrollViewDelegate>_Nullable delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byShowsVerticalScrollIndicator{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.showsVerticalScrollIndicator = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byShowsHorizontalScrollIndicator{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.showsHorizontalScrollIndicator = data;
        return self;
    };
}

-(JobsRetScrollViewBySizeBlock _Nonnull)byContentSize{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGSize size){
        @jobs_strongify(self)
        self.contentSize = size;
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)byContentWidth{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.contentSize = CGSizeMake(data ? : CGRectGetWidth(self.bounds),
                                      self.contentSize.height ? : CGRectGetHeight(self.bounds));
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)byContentHeight{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.contentSize = CGSizeMake(self.contentSize.width ? : CGRectGetWidth(self.bounds),
                                      data ? : CGRectGetHeight(self.bounds));
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byScrollEnabled{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.scrollEnabled = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byBounces{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.bounces = data;
        return self;
    };
}

-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byContentInset{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIEdgeInsets insets){
        @jobs_strongify(self)
        self.contentInset = insets;
        return self;
    };
}

-(JobsReturnScrollViewByMJRefreshHeaderBlock _Nonnull)byMJRefreshHeader{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(__kindof MJRefreshHeader * _Nullable header){
        @jobs_strongify(self)
        self.mj_header = header;
        self.mj_header.automaticallyChangeAlpha = YES; // 根据拖拽比例自动切换透明度
        return self;
    };
}

-(JobsReturnScrollViewByMJRefreshFooterBlock _Nonnull)byMJRefreshFooter{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(__kindof MJRefreshFooter * _Nullable header){
        @jobs_strongify(self)
        self.mj_footer = header;
        self.mj_footer.automaticallyChangeAlpha = YES; // 根据拖拽比例自动切换透明度
        return self;
    };
}

-(JobsReturnScrollViewByMJRefreshHeaderBlock _Nonnull)byMJ_header{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(__kindof MJRefreshHeader *_Nullable header){
        @jobs_strongify(self)
        self.mj_header = header;
        self.mj_header.automaticallyChangeAlpha = YES; // 根据拖拽比例自动切换透明度
        return self;
    };
}

-(JobsReturnScrollViewByMJRefreshFooterBlock _Nonnull)byMJ_footer{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(__kindof MJRefreshFooter *_Nullable footer){
        @jobs_strongify(self)
        self.mj_footer = footer;
        self.mj_footer.automaticallyChangeAlpha = YES; // 根据拖拽比例自动切换透明度
        return self;
    };
}
/// Content
-(JobsRetScrollViewByPointBlock _Nonnull)byContentOffset{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGPoint point){
        @jobs_strongify(self)
        self.contentOffset = point;
        return self;
    };
}

-(JobsRetScrollViewByPointBlock _Nonnull)setContentOffsetByYES{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGPoint point){
        @jobs_strongify(self)
        [self setContentOffset:point animated:YES];
        return self;
    };
}

-(JobsRetScrollViewByPointBlock _Nonnull)setContentOffsetByNO{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGPoint point){
        @jobs_strongify(self)
        [self setContentOffset:point animated:NO];
        return self;
    };
}

#if defined(__IPHONE_17_4) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_17_4)
-(JobsRetScrollViewByPointBlock _Nonnull)byContentAlignmentPoint{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGPoint alignmentPoint){
        @jobs_strongify(self)
        if (@available(iOS 17.4, *)){
            self.contentAlignmentPoint = alignmentPoint;
        };return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byTransfersHorizontalScrollingToParent
    API_AVAILABLE(ios(17.4)){
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 17.4, *)){
            self.transfersHorizontalScrollingToParent = data;
        };return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byTransfersVerticalScrollingToParent
    API_AVAILABLE(ios(17.4)){
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 17.4, *)){
            self.transfersVerticalScrollingToParent = data;
        };return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byBouncesHorizontally{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 17.4, *)){
            self.bouncesHorizontally = data;
        };return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byBouncesVertically{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 17.4, *)){
            self.bouncesVertically = data;
        };return self;
    };
}
#endif

-(JobsRetScrollViewByNSIntegerBlock _Nonnull)byContentInsetAdjustmentBehavior{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIScrollViewContentInsetAdjustmentBehavior behavior){
        @jobs_strongify(self)
        if (@available(iOS 11.0, tvOS 11.0, *)){
            self.contentInsetAdjustmentBehavior = behavior;
        };return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byAutomaticallyAdjustsScrollIndicatorInsets{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (@available(iOS 13.0, tvOS 13.0, *)){
            self.automaticallyAdjustsScrollIndicatorInsets = data;
        };return self;
    };
}/// Scroll Behavior / Bounce
-(JobsRetScrollViewByBOOLBlock _Nonnull)byDirectionalLockEnabled{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.directionalLockEnabled = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byAlwaysBounceVertical{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.alwaysBounceVertical = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byAlwaysBounceHorizontal{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.alwaysBounceHorizontal = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byPagingEnabled{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.pagingEnabled = data;
        return self;
    };
}
/// Indicator / Deceleration
-(JobsRetScrollViewByNSIntegerBlock _Nonnull)byIndicatorStyle{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIScrollViewIndicatorStyle style){
        @jobs_strongify(self)
        self.indicatorStyle = style;
        return self;
    };
}

-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byVerticalScrollIndicatorInsets{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIEdgeInsets insets){
        @jobs_strongify(self)
        if (@available(iOS 11.1, tvOS 11.1, *)){
            self.verticalScrollIndicatorInsets = insets;
        };return self;
    };
}

-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byHorizontalScrollIndicatorInsets{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIEdgeInsets insets){
        @jobs_strongify(self)
        if (@available(iOS 11.1, tvOS 11.1, *)){
            self.horizontalScrollIndicatorInsets = insets;
        };return self;
    };
}

-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byScrollIndicatorInsets{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIEdgeInsets insets){
        @jobs_strongify(self)
        self.scrollIndicatorInsets = insets;
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)byDecelerationRate{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIScrollViewDecelerationRate rate){
        @jobs_strongify(self)
        self.decelerationRate = rate;
        return self;
    };
}
/// Touch Behavior
-(JobsRetScrollViewByBOOLBlock _Nonnull)byDelaysContentTouches{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.delaysContentTouches = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byCanCancelContentTouches{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.canCancelContentTouches = data;
        return self;
    };
}
/// Zoom
-(JobsRetScrollViewByCGFloatBlock _Nonnull)byMinimumZoomScale{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.minimumZoomScale = data;
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)byMaximumZoomScale{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.maximumZoomScale = data;
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)byZoomScale{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        if (@available(iOS 3.0, *)){
            self.zoomScale = data;
        };return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byBouncesZoom{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.bouncesZoom = data;
        return self;
    };
}
/// StatusBar / Keyboard
-(JobsRetScrollViewByBOOLBlock _Nonnull)byScrollsToTop{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
#if !TARGET_OS_TV
        self.scrollsToTop = data;
#endif
        return self;
    };
}

-(JobsRetScrollViewByNSIntegerBlock _Nonnull)byKeyboardDismissMode{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIScrollViewKeyboardDismissMode mode){
        @jobs_strongify(self)
        if (@available(iOS 7.0, *)){
            self.keyboardDismissMode = mode;
        };return self;
    };
}
/// Refresh / Keyboard Scrolling
-(JobsRetScrollViewByUIRefreshControlBlock _Nonnull)byRefreshControl{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIRefreshControl * _Nullable refreshControl){
        @jobs_strongify(self)
#if !TARGET_OS_TV && !TARGET_OS_WATCH
        if (@available(iOS 10.0, *)){
            self.refreshControl = refreshControl;
        }
#endif
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byAllowsKeyboardScrolling{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
#if !TARGET_OS_TV && !TARGET_OS_WATCH
        if (@available(iOS 17.0, *)){
            self.allowsKeyboardScrolling = data;
        }
#endif
        return self;
    };
}
/// tvOS / visionOS
-(JobsRetScrollViewByNSIntegerBlock _Nonnull)byIndexDisplayMode{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIScrollViewIndexDisplayMode mode){
        @jobs_strongify(self)
#if TARGET_OS_TV
        if (@available(tvOS 10.2, *)){
            self.indexDisplayMode = mode;
        }
#endif
        return self;
    };
}

-(JobsRetScrollViewByNSUIntegerBlock _Nonnull)byLookToScrollAxes{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIAxis axis){
        @jobs_strongify(self)
#if TARGET_OS_VISION
        if (@available(visionOS 26.0, *)){
            self.lookToScrollAxes = axis;
        }
#endif
        return self;
    };
}


#pragma mark —— UIScrollView.contentSize
-(JobsRetScrollViewBySizeBlock _Nonnull)resetContentSize{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGSize data) {
        @jobs_strongify(self)
        self.contentSize = data;
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentSizeWidth{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentSize = CGSizeMake(data, self.contentSize.height);
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentSizeHeight{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentSize = CGSizeMake(self.contentSize.width, data);
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentSizeOffsetWidth{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentSize = CGSizeMake(self.contentSize.width + data,
                                      self.contentSize.height);
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentSizeOffsetHeight{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentSize = CGSizeMake(self.contentSize.width,
                                      self.contentSize.height + data);
        return self;
    };
}
#pragma mark —— UIScrollView.contentOffset
-(JobsRetScrollViewByPointBlock _Nonnull)resetContentOffset{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGPoint data) {
        @jobs_strongify(self)
        self.contentOffset = data;
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentOffsetX{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentOffset = CGPointMake(data, self.contentOffset.y);
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentOffsetY{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentOffset = CGPointMake(self.contentOffset.x, data);
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentOffsetX_offset{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentOffset = CGPointMake(self.contentOffset.x + data,
                                         self.contentOffset.y);
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentOffsetY_offset{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentOffset = CGPointMake(self.contentOffset.x,
                                         self.contentOffset.y + data);
        return self;
    };
}
#pragma mark —— UIScrollView.contentInset
-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)resetContentInset{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIEdgeInsets data) {
        @jobs_strongify(self)
        self.contentInset = data;
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentInsetTop{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentInset = UIEdgeInsetsMake(data,
                                             self.contentInset.left,
                                             self.contentInset.bottom,
                                             self.contentInset.right);
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentInsetLeft{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentInset = UIEdgeInsetsMake(self.contentInset.top,
                                             data,
                                             self.contentInset.bottom,
                                             self.contentInset.right);
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentInsetBottom{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentInset = UIEdgeInsetsMake(self.contentInset.top,
                                             self.contentInset.left,
                                             data,
                                             self.contentInset.right);
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentInsetRight{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentInset = UIEdgeInsetsMake(self.contentInset.top,
                                             self.contentInset.left,
                                             self.contentInset.bottom,
                                             data);
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentInsetOffsetTop{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentInset = UIEdgeInsetsMake(self.contentInset.top + data,
                                             self.contentInset.left,
                                             self.contentInset.bottom,
                                             self.contentInset.right);
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentInsetOffsetLeft{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentInset = UIEdgeInsetsMake(self.contentInset.top,
                                             self.contentInset.left + data,
                                             self.contentInset.bottom,
                                             self.contentInset.right);
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentInsetOffsetBottom{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentInset = UIEdgeInsetsMake(self.contentInset.top,
                                             self.contentInset.left,
                                             self.contentInset.bottom + data,
                                             self.contentInset.right);
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)resetContentInsetOffsetRight{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.contentInset = UIEdgeInsetsMake(self.contentInset.top,
                                             self.contentInset.left,
                                             self.contentInset.bottom,
                                             self.contentInset.right + data);
        return self;
    };
}

@end
