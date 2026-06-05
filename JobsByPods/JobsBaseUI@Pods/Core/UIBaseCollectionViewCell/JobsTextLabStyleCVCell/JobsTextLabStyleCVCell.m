//
//  JobsTextLabStyleCVCell.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsTextLabStyleCVCell.h"
#import <JobsBaseUI/CALayer+Extra.h>
#import <JobsBaseUI/UIView+Extra.h>
#import <JobsBaseUI/UICollectionView+JobsRegisterClass.h>

@interface JobsTextLabStyleCVCell ()

@end

@implementation JobsTextLabStyleCVCell
/// UIViewModelProtocol
UIViewModelProtocol_synthesize_part1
UIViewModelProtocol_synthesize_part2
/// BaseLayerProtocol
BaseLayerProtocol_synthesize_part3
-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    JobsTextLabStyleCVCell *cell = JobsRegisterDequeueCollectionViewCell(JobsTextLabStyleCVCell);
    cell.contentView.layer
        .cornerRadiusBy(JobsWidth(8))
        .borderWidthBy(JobsWidth(1))
        .borderColorBy(RGBA_COLOR(255, 225, 144, 1))
        .masksToBoundsBy(YES);
    cell.layer
        .cornerRadiusBy(JobsWidth(8))
        .borderWidthBy(JobsWidth(1))
        .borderColorBy(RGBA_COLOR(255, 225, 144, 1))
        .masksToBoundsBy(YES);
    cell.indexPath = indexPath;
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(UIViewModel __kindof *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        self.label.alpha = 1;
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
-(UIViewModel *)getViewModel{
    return self.viewModel;
}
#pragma mark —— lazyLoad
@synthesize label = _label;
-(UILabel *)label{
    if(!_label){
        @jobs_weakify(self)
        _label = self.contentView.addSubview(jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
            @jobs_strongify(self)
            /// 富文本的优先级大于普通文本
            if(self.viewModel.attributedTitle){
                label.byAttributedString(self.viewModel.attributedTitle);
            }else{
                label.byText(self.viewModel.text);
                label.byNumberOfLines(0);
                label.lineBreakMode = NSLineBreakByWordWrapping;
                label.byTextAlignment(self.viewModel.textAlignment);
                label.byTextCor(self.viewModel.textCor);
                label.byFont(self.viewModel.font);
            }
        })).byAdd(^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.edges.equalTo(self.contentView);
        });
    }return _label;
}

@end
