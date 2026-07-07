//
//  JobsWalletCardView.m
//  JobsWallet
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "JobsWalletCardView.h"
#import "JobsWalletCardCollectionViewCell.h"

@interface JobsWalletCardView ()

Prop_strong()UICollectionView *collectionView;
Prop_strong()JobsWalletCollectionViewLayout *walletLayout;

@end

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
        self.backgroundColor = JobsClearColor;
        self.collectionView.alpha = 1;
    };return self;
}

-(void)reloadDataWithCardModels:(NSArray<JobsWalletCardModel *> *)cardModels{
    self.cardModels = cardModels;
}

-(void)expandAllCards{
    [self.walletLayout expandAllIndexPaths];
}

-(void)collapseAllCards{
    [self.walletLayout resetExpandedIndexPathsAnimated:YES];
}

-(void)setCardModels:(NSArray<JobsWalletCardModel *> *)cardModels{
    _cardModels = cardModels.copy ?: @[];
    [self.walletLayout resetExpandedIndexPaths];
    [self.collectionView reloadData];
}

-(void)setExpandStyle:(JobsWalletCardExpandStyle)expandStyle{
    _expandStyle = expandStyle;
    self.walletLayout.expandStyle = expandStyle;
    [self.collectionView reloadData];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section{
    return self.cardModels.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JobsWalletCardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(JobsWalletCardCollectionViewCell.class) forIndexPath:indexPath];
    if (indexPath.item < self.cardModels.count) {
        [cell jobsRichCardModel:self.cardModels[indexPath.item]];
    };return cell;
}

-(void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.item >= self.cardModels.count) return;
    [self.walletLayout toggleIndexPath:indexPath];
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.walletLayout];
        _collectionView.backgroundColor = JobsClearColor;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:JobsWalletCardCollectionViewCell.class forCellWithReuseIdentifier:NSStringFromClass(JobsWalletCardCollectionViewCell.class)];
        [self addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    };return _collectionView;
}

-(JobsWalletCollectionViewLayout *)walletLayout{
    if (!_walletLayout) {
        _walletLayout = JobsWalletCollectionViewLayout.new;
        _walletLayout.padding = JobsWidth(15);
        _walletLayout.itemHeight = JobsWidth(96);
        _walletLayout.overlapRatio = 0.5;
        _walletLayout.expandedItemSpacing = JobsWidth(10);
        _walletLayout.expandStyle = self.expandStyle;
    };return _walletLayout;
}

@end
