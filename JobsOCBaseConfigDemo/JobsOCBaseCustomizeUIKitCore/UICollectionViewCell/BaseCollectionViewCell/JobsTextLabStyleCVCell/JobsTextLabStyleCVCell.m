//
//  JobsTextLabStyleCVCell.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsTextLabStyleCVCell.h"

#import "CALayer+Extra.h"
#import "UIView+Extra.h"
#import "UICollectionView+JobsRegisterClass.h"

@interface JobsTextLabStyleCVCell ()

@end

@implementation JobsTextLabStyleCVCell
/// UIViewModelProtocol
UIViewModelProtocol_synthesize_part1
UIViewModelProtocol_synthesize_part2
/// BaseLayerProtocol
BaseLayerProtocol_synthesize_part3
-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTextLabStyleCVCell.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
    };
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    JobsTextLabStyleCVCell *cell = JobsRegisterDequeueCollectionViewCell(JobsTextLabStyleCVCell);
    return (JobsTextLabStyleCVCell *)cell
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
    return ^__kindof UICollectionViewCell *_Nullable(UIViewModel __kindof *_Nullable model) {
        @jobs_strongify(self)
        self.byViewModel(model);
        self.label.byAlpha(1);
        return self;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(55);
    };
}
#pragma mark —— BaseViewProtocol
/// 获取绑定的数据源
-(UIViewModel *_Nullable)getViewModel{
    JobsRetViewModelByVoidBlock action = ((JobsRetViewModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTextLabStyleCVCell.class, @selector(jobsGetViewModel)))(self, @selector(jobsGetViewModel));
    return action ? action() : nil;
}

-(JobsRetViewModelByVoidBlock _Nonnull)jobsGetViewModel{
    @jobs_weakify(self)
    return ^UIViewModel *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.viewModel;
    };
}
#pragma mark —— lazyLoad
@synthesize label = _label;
-(UILabel *)label{
    if (!_label) {
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
            @jobs_strongify(self)
            label
                .byLabelBlock(^(__kindof UILabel * _Nullable data) {
                    /// 富文本的优先级大于普通文本
                    if (self.viewModel.attributedTitle) {
                        data.byAttributedString(self.viewModel.attributedTitle);
                    } else {
                        data
                            .byText(self.viewModel.text)
                            .byNumberOfLines(0)
                            .byLineBreakMode(NSLineBreakByWordWrapping)
                            .byTextAlignment(self.viewModel.textAlignment)
                            .byTextCor(self.viewModel.textCor)
                            .byFont(self.viewModel.font);
                    }
                })
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self.contentView);
                });
        });
    };return _label;
}

@end
