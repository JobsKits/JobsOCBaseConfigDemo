//
//  UIViewController+JXPagerViewListViewDelegate.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIViewController+JXPagerViewListViewDelegate.h"

@implementation UIViewController (JXPagerViewListViewDelegate)
#pragma mark —— UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([scrollView isKindOfClass:self.scrollViewClass]) {
        CGFloat sectionHeaderHeight = 40;
        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
            scrollView.byContentInset(UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0));
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.byContentInset(UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0));
        }
    }
    if (self.scrollCallback) self.scrollCallback(scrollView);
}
#pragma mark —— JXPagerViewListViewDelegate
-(UIScrollView *)listScrollView{
    JobsRetScrollViewByVoidBlock action = ((JobsRetScrollViewByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIViewController.class, @selector(jobsListScrollView)))(self, @selector(jobsListScrollView));
    return action ? action() : nil;
}

- (JobsRetScrollViewByVoidBlock _Nonnull)jobsListScrollView {
    @jobs_weakify(self)
    return ^UIScrollView *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.scrollView;
    };
}

- (void)listViewDidScrollCallback:(void (^)(UIScrollView *))callback {
    self.byScrollCallback(callback);
}

-(UIView *)listView{
    JobsRetViewByVoidBlock action = ((JobsRetViewByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIViewController.class, @selector(jobsListView)))(self, @selector(jobsListView));
    return action ? action() : nil;
}

- (JobsRetViewByVoidBlock _Nonnull)jobsListView {
    @jobs_weakify(self)
    return ^UIView *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.view;
    };
}
#pragma mark —— Prop_strong()Class scrollViewClass;
JobsKey(_scrollViewClass)
@dynamic scrollViewClass;
-(Class)scrollViewClass{
    return Jobs_getAssociatedObject(_scrollViewClass);
}

-(void)setScrollViewClass:(Class)scrollViewClass{
    Jobs_setAssociatedRETAIN_NONATOMIC(_scrollViewClass, scrollViewClass)
}
#pragma mark —— Prop_strong()UIScrollView *scrollView;
/**
 1、Masonry约束必须以self.scrollView为锚点，不能以self.view。否则无法拖动
 _tableView.addOn(self.scrollView).byAdd(^(MASConstraintMaker *make) {
     make.top.equalTo(self.scrollView);
     make.height.mas_equalTo(JobsMainScreen_HEIGHT());
     make.width.mas_equalTo(JobsMainScreen_WIDTH());
     make.centerX.equalTo(self.scrollView);
 });

 2、必须设置 contentSize。否则无法拖动
 self.scrollView.contentSize = CGSizeMake(JobsMainScreen_WIDTH(), 2*JobsMainScreen_HEIGHT());
 3、加在scrollView上的内容物的相关长度比如超出scrollView容器的相关长度。否则无法拖动
 */
JobsKey(_scrollView)
@dynamic scrollView;
-(UIScrollView *)scrollView{
    UIScrollView *ScrollView = Jobs_getAssociatedObject(_scrollView);
    if (!ScrollView) {
        @jobs_weakify(self)
        ScrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            @jobs_strongify(self)
            scrollView
                .byDelegate(self)
                .addOn(self.view);
        });
        Jobs_setAssociatedRETAIN_NONATOMIC(_scrollView, ScrollView)
        ScrollView.byAdd(^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        });
    };return ScrollView;
}

-(void)setScrollView:(UIScrollView *)scrollView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_scrollView, scrollView)
}
#pragma mark —— Prop_copy()void(^scrollCallback)(UIScrollView *scrollView);
JobsKey(_scrollCallback)
@dynamic scrollCallback;
-(jobsByScrollViewBlock _Nonnull)scrollCallback{
    return Jobs_getAssociatedObject(_scrollCallback);
}

-(void)setScrollCallback:(void (^)(UIScrollView * _Nonnull))scrollCallback{
    Jobs_setAssociatedCOPY_NONATOMIC(_scrollCallback, scrollCallback)
}

@end
