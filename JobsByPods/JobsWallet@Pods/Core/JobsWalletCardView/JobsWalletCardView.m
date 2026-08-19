//
//  JobsWalletCardView.m
//  JobsWallet
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "JobsWalletCardView.h"

#import <JobsWallet/JobsWalletCardCollectionViewCell.h>

@interface JobsWalletCardView ()

Prop_strong()UICollectionView *collectionView;
Prop_strong()JobsWalletCollectionViewLayout *walletLayout;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsWalletCardView
@interface JobsWalletCardView (JobsPropertyDSLSetterAutogen_f6c4547d7d)
-(void)setCardModels:(NSArray<JobsWalletCardModel *> * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsWalletCardView

@implementation JobsWalletCardView
@synthesize collectionView = _collectionView;

-(instancetype)initWithFrame:(CGRect)frame{
    return [self initWithFrame:frame
                   expandStyle:JobsWalletCardExpandStyleOnlySelected
                    cardModels:@[]];
}

-(instancetype)initWithFrame:(CGRect)frame
                 expandStyle:(JobsWalletCardExpandStyle)expandStyle
                  cardModels:(NSArray<JobsWalletCardModel *> *)cardModels{
    if ((self = [super initWithFrame:frame])) {
        _expandStyle = expandStyle;
        _cardModels = cardModels.copy ?: @[];
        self.byBgColor(JobsClearColor);
        self.collectionView.byAlpha(1);
    };return self;
}

-(jobsByNSArrayJobsWalletCardModelBlock _Nonnull)reloadDataWithCardModels{
    @jobs_weakify(self)
    return ^(NSArray<JobsWalletCardModel *> * cardModels){
        @jobs_strongify(self)
        if (!self) return;
        self.byCardModels(cardModels);
    };
}

-(jobsByVoidBlock _Nonnull)expandAllCards{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.walletLayout.expandAllIndexPaths();
    };
}

-(jobsByVoidBlock _Nonnull)collapseAllCards{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.walletLayout.resetExpandedIndexPathsAnimated(YES);
    };
}

-(void)setCardModels:(NSArray<JobsWalletCardModel *> *)cardModels{
    _cardModels = cardModels.copy ?: @[];
    self.walletLayout.resetExpandedIndexPaths();
    [self.collectionView reloadData];
}

-(void)setExpandStyle:(JobsWalletCardExpandStyle)expandStyle{
    _expandStyle = expandStyle;
    self.walletLayout.expandStyle = expandStyle;
    [self.collectionView reloadData];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    JobsRetNSIntegerByUICollectionViewBlock action = ((JobsRetNSIntegerByUICollectionViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsWalletCardView.class, @selector(jobsNumberOfSectionsInCollectionView)))(self, @selector(jobsNumberOfSectionsInCollectionView));
    return action ? action(collectionView) : (NSInteger){0};
}

-(JobsRetNSIntegerByUICollectionViewBlock _Nonnull)jobsNumberOfSectionsInCollectionView{
    @jobs_weakify(self)
    return ^NSInteger(UICollectionView * collectionView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return 1;
    };
}

-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section{
    return self.cardModels.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JobsWalletCardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(JobsWalletCardCollectionViewCell.class) forIndexPath:indexPath];
    if (indexPath.item < self.cardModels.count) {
        cell.jobsRichCardModel(self.cardModels[indexPath.item]);
    };return cell;
}

-(void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.item >= self.cardModels.count) return;
    self.walletLayout.toggleIndexPath(indexPath);
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = jobsMakeCollectionView(^(__kindof UICollectionView * _Nullable collectionView) {
            collectionView
                .byCollectionViewLayout(self.walletLayout)
                .byDelegate(self)
                .byDataSource(self)
                .byShowsVerticalScrollIndicator(NO)
                .byAlwaysBounceVertical(YES)
                .byBgColor(JobsClearColor)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                });
        });
        [_collectionView registerClass:JobsWalletCardCollectionViewCell.class forCellWithReuseIdentifier:NSStringFromClass(JobsWalletCardCollectionViewCell.class)];
    };return _collectionView;
}

-(JobsWalletCollectionViewLayout *)walletLayout{
    if (!_walletLayout) {
        _walletLayout = JobsWalletCollectionViewLayout.new;
        _walletLayout.byPadding(JobsWidth(15));
        _walletLayout.byItemHeight(JobsWidth(96));
        _walletLayout.byOverlapRatio(0.5);
        _walletLayout.byExpandedItemSpacing(JobsWidth(10));
        _walletLayout.byExpandStyle(self.expandStyle);
    };return _walletLayout;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsWalletCardView
-(JobsRetJobsWalletCardViewByNSArrayJobsWalletCardModelBlock _Nonnull)byCardModels{
    @jobs_weakify(self)
    return ^__kindof JobsWalletCardView * _Nullable(NSArray<JobsWalletCardModel *> * _Nullable data){
        @jobs_strongify(self)
        [self setCardModels:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsWalletCardView
@end
