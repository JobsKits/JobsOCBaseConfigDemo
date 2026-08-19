//
//  UICollectionView+Func.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UICollectionView+Func.h"

@implementation UICollectionView (Func)
+(JobsRetCollectionViewByLayoutBlock _Nonnull)initByLayout{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(__kindof UICollectionViewLayout *_Nullable data){
        @jobs_strongify(self)
        return [self.class.alloc initWithFrame:CGRectZero collectionViewLayout:data];
    };
}
/// 对系统方法 cellForItemAtIndexPath 的二次封装
-(JobsRetCollectionViewCellByIndexPathBlock _Nonnull)cellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(NSIndexPath *_Nullable indexPath){
        @jobs_strongify(self)
        return [self cellForItemAtIndexPath:indexPath];
    };
}

-(JobsRetCollectionViewByMJRefreshHeaderBlock _Nonnull)byMJRefreshHeader{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(__kindof MJRefreshHeader * _Nullable header){
        @jobs_strongify(self)
        self.mj_header = header;
        self.mj_header.byAutomaticallyChangeAlpha(YES);
        return self;
    };
}

-(JobsRetCollectionViewByMJRefreshFooterBlock _Nonnull)byMJRefreshFooter{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(__kindof MJRefreshFooter * _Nullable header){
        @jobs_strongify(self)
        self.mj_footer = header;
        self.mj_footer.byAutomaticallyChangeAlpha(YES);
        return self;
    };
}

-(JobsRetScrollViewByIDBlock _Nonnull)dataLink{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(id _Nonnull target) {
        @jobs_strongify(self)
        self.byDelegate(target)
            .byDataSource(target);
        return self;
    };
}
/// 用于显示 UICollectionView
-(JobsRetScrollViewByIDBlock _Nonnull)byShow{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(id _Nonnull target) {
        @jobs_strongify(self)
        self.dataLink(target);
        self.reloadDatas();
        return self;
    };
}

-(__kindof UICollectionViewCell *)didSelectItemAtIndexPath:(NSIndexPath *)indexPath
                                   collectionViewCellClass:(Class _Nullable)collectionViewCellClass{
    JobsLog(@"%s", __FUNCTION__);
    if (collectionViewCellClass) {
        for (UICollectionViewCell *cell in self.visibleCells) {
            if ([cell isKindOfClass:collectionViewCellClass]) {
                cell.bySelected(NO);
            }
        }
    };return self.cellBy(indexPath).bySelected(YES);;
}

-(__kindof UICollectionViewCell *)didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
                                     collectionViewCellClass:(Class _Nullable)collectionViewCellClass{
    JobsLog(@"%s", __FUNCTION__);
    return self.cellBy(indexPath).bySelected(YES);
}

@end
