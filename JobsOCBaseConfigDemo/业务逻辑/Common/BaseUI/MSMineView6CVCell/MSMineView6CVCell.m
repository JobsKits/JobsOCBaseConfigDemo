//
//  MSMineView6CVCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "MSMineView6CVCell.h"

@interface MSMineView6CVCell ()

@end

@implementation MSMineView6CVCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    };return self;
}
#pragma mark —— BaseViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    JobsRetViewModelByVoidBlock action = ((JobsRetViewModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(MSMineView6CVCell.class, @selector(jobsGetViewModel)))(self, @selector(jobsGetViewModel));
    return action ? action() : nil;
}

-(JobsRetViewModelByVoidBlock _Nonnull)jobsGetViewModel{
    @jobs_weakify(self)
    return ^UIViewModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.viewModel;
    };
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    MSMineView6CVCell *cell = JobsRegisterDequeueCollectionViewCell(MSMineView6CVCell);
    cell.byIndexPath(indexPath);
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        model.byButtonEdgeInsetsStyle(NSDirectionalRectEdgeTop);
        model.byBgSelectedCor(model.bgCor = JobsClearColor);
        super.jobsRichElementsCollectionViewCellBy(model);
        self.byBgColor(JobsSecondarySystemBackgroundColor);
        self.contentView.byBgColor(JobsSecondarySystemBackgroundColor);
        return self;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)cellSizeByModel{
    return ^CGSize(id _Nullable data){
//        if([model.cls isEqual:MSMySocialTitleView.class]){
//            return CGSizeMake(JobsWidth(40), JobsWidth(60));
//        }else if ([model.cls isEqual:MSMineVC.class]){
//            return CGSizeMake(JobsWidth(70), JobsWidth(70));
//        }else return CGSizeZero;
        return CGSizeMake(JobsWidth(70), JobsWidth(70));
    };
}
#pragma mark —— lazyLoad

@end
