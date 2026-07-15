//
//  JXCategoryBaseView+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryBaseView+Extra.h"

@implementation JXCategoryBaseView (Extra)
-(JobsRetCategoryBaseViewByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof JXCategoryBaseView *_Nullable(id<JXCategoryViewDelegate> _Nullable delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}

-(JobsRetCategoryBaseViewByCGFloatBlock _Nonnull)byCellSpacing{
    @jobs_weakify(self)
    return ^__kindof JXCategoryBaseView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.cellSpacing = data;
        return self;
    };
}

-(JobsRetCategoryBaseViewByViewBlock _Nonnull)byContentScrollView{
    @jobs_weakify(self)
    return ^__kindof JXCategoryBaseView *_Nullable(__kindof UIView *_Nullable view){
        @jobs_strongify(self)
        self.contentScrollView = view;
        return self;
    };
}

-(JobsRetCategoryTitleViewByNSIntegerBlock _Nonnull)byDefaultSelectedIndex{
    @jobs_weakify(self)
    return ^__kindof JXCategoryBaseView *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.defaultSelectedIndex = data;
        return self;
    };
}

-(JobsRetCategoryBaseViewByListContainerBlock _Nonnull)byListContainer{
    @jobs_weakify(self)
    return ^__kindof JXCategoryBaseView *_Nullable(id<JXCategoryViewListContainer> _Nullable listContainer){
        @jobs_strongify(self)
        self.listContainer = listContainer;
        return self;
    };
}

-(JobsRetCategoryBaseViewByVoidBlock _Nonnull)reloadDatasWithoutListContainer{
    @jobs_weakify(self)
    return ^__kindof JXCategoryBaseView *_Nullable(){
        @jobs_strongify(self)
        [self reloadDataWithoutListContainer];
        return self;
    };
}

@end
