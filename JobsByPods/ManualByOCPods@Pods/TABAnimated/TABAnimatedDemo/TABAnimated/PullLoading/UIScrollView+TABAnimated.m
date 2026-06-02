//
//  UIScrollView+TABAnimated.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIScrollView+TABAnimated.h"
#import "TABAnimatedPullLoadingComponent.h"
#import <TABAnimated/TABFormAnimated.h>
#import <TABAnimated/UIView+TABControlModel.h>
#import <TABAnimated/TABTableAnimated.h>
#import <TABAnimated/TABCollectionAnimated.h>

@implementation UIScrollView (TABAnimated)

#pragma mark -

- (void)tab_addPullLoadingActionHandler:(void (^)(void))actionHandler {
    Class targetClass = [self tab_getClass];
    CGFloat viewHeight = [self tab_getViewHeight];
    [self tab_addPullLoadingClass:targetClass viewHeight:viewHeight actionHandler:actionHandler];
}

- (void)tab_addPullLoadingClass:(nonnull Class)pullLoadingClass viewHeight:(CGFloat)viewHeight actionHandler:(void (^)(void))actionHandler {
    TABFormAnimated *tabAnimated = (TABFormAnimated *)self.tabAnimated;
    if (tabAnimated.pullLoadingComponent == nil) {
        tabAnimated.pullLoadingComponent = [[TABAnimatedPullLoadingComponent alloc] initWithScrollView:self
                                                                                           targetClass:pullLoadingClass
                                                                                            viewHeight:viewHeight
                                                                                         actionHandler:actionHandler];
        [self insertSubview:tabAnimated.pullLoadingComponent atIndex:0];
    }
}

- (void)tab_addPullLoadinTarget:(id)target selector:(SEL)selector {
    Class targetClass = [self tab_getClass];
    CGFloat viewHeight = [self tab_getViewHeight];
    [self tab_addPullLoadingClass:targetClass viewHeight:viewHeight target:target selector:selector];
}

- (void)tab_addPullLoadingClass:(nonnull Class)pullLoadingClass viewHeight:(CGFloat)viewHeight target:(id)target selector:(SEL)selector {
    TABFormAnimated *tabAnimated = (TABFormAnimated *)self.tabAnimated;
    if (tabAnimated.pullLoadingComponent == nil) {
        tabAnimated.pullLoadingComponent = [[TABAnimatedPullLoadingComponent alloc] initWithScrollView:self
                                                                                           targetClass:pullLoadingClass
                                                                                            viewHeight:viewHeight
                                                                                                target:target
                                                                                                action:selector];
        
        [self insertSubview:tabAnimated.pullLoadingComponent atIndex:0];
    }
}

- (void)tab_stopPullLoading {
    TABFormAnimated *tabAnimated = (TABFormAnimated *)self.tabAnimated;
    tabAnimated.pullLoadingComponent.state = TABAnimatedPullLoadingStateStopped;
}

- (void)tab_stopPullLoadingNoMoreData {
    TABFormAnimated *tabAnimated = (TABFormAnimated *)self.tabAnimated;
    tabAnimated.pullLoadingComponent.state = TABAnimatedPullLoadingStateNoMoreData;
}

- (void)tab_resetPullLoadingState {
    TABFormAnimated *tabAnimated = (TABFormAnimated *)self.tabAnimated;
    tabAnimated.pullLoadingComponent.state = TABAnimatedPullLoadingStateNormal;
}

#pragma mark - Private

- (Class)tab_getClass {
    return ((TABFormAnimated *)self.tabAnimated).cellClassArray.lastObject;
}

- (CGFloat)tab_getViewHeight {
    CGFloat viewHeight = 0.;
    if ([self isKindOfClass:UITableView.class]) {
        viewHeight = ((TABTableAnimated *)self.tabAnimated).cellHeightArray.lastObject.floatValue;
    }else if ([self isKindOfClass:UICollectionView.class]) {
        viewHeight = ((TABCollectionAnimated *)self.tabAnimated).cellSizeArray.lastObject.CGSizeValue.height;
    }
    return viewHeight;
}

@end
