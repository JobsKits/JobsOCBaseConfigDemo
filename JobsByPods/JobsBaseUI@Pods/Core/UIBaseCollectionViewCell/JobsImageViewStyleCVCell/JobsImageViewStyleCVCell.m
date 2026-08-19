//
//  JobsImageViewStyleCVCell.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsImageViewStyleCVCell.h"

#import <JobsBaseUI/CALayer+Extra.h>
#import <JobsBaseUI/UIView+Extra.h>
#import <JobsBaseUI/UICollectionView+JobsRegisterClass.h>

@interface JobsImageViewStyleCVCell ()

@end

@implementation JobsImageViewStyleCVCell
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    };return self;
}
#pragma mark —— BaseViewProtocol
-(UIViewModel *_Nullable)getViewModel{
    JobsRetViewModelByVoidBlock action = ((JobsRetViewModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsImageViewStyleCVCell.class, @selector(jobsGetViewModel)))(self, @selector(jobsGetViewModel));
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
    JobsImageViewStyleCVCell *cell = JobsRegisterDequeueCollectionViewCell(JobsImageViewStyleCVCell);
    return (JobsImageViewStyleCVCell *)cell
        .byContentView(^(__kindof UIView * _Nullable view) {
            view.byLayer(^(CALayer * _Nullable layer) {
                layer
                    .cornerRadiusBy(JobsWidth(8))
                    .borderWidthBy(JobsWidth(1))
                    .borderColorBy(RGBA_COLOR(255, 225, 144, 1))
                    .masksToBoundsBy(YES);
            });
        })
        .byIndexPath(indexPath)
        .byLayer(^(CALayer * _Nullable layer) {
            layer
                .cornerRadiusBy(JobsWidth(8))
                .borderWidthBy(JobsWidth(1))
                .borderColorBy(RGBA_COLOR(255, 225, 144, 1))
                .masksToBoundsBy(YES);
        });
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.byViewModel(model);
        self.imageView.byImage(self.viewModel.image);
        return self;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)cellSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(106), JobsWidth(30));
    };
}
#pragma mark —— 一些公有方法
-(JobsRetImageViewByVoidBlock _Nonnull)getImageView{
    @jobs_weakify(self)
    return ^UIImageView *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.imageView;
    };
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize imageView = _imageView;
-(UIImageView *)imageView{
    if(!_imageView){
        @jobs_weakify(self)
        _imageView = self.contentView
            .addSubview(jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
                @jobs_strongify(self)
            })).byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.edges.equalTo(self.contentView);
            });
    };return _imageView;
}

@end
