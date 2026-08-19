//
//  TreeClassItemCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TreeClassItemCell.h"

@interface TreeClassItemCell ()
/// UI
Prop_strong()UIImageView *logoImgView;
Prop_strong()UILabel *nameLabel;
Prop_strong()BaseButton *btn;
/// Data
Prop_assign()CGFloat imageWidth;
Prop_strong()GoodsClassModel *dataModel;

@end

@implementation TreeClassItemCell
#pragma mark —— UILocationProtocol
UILocationProtocol_synthesize
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    TreeClassItemCell *cell = JobsRegisterDequeueCollectionViewCell(TreeClassItemCell);
    cell.byIndexPath(indexPath);
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        self.byJobsRect(frame);
        self.byBgColor(ThreeClassCellBgCor);
        self.contentView.byBgColor(ThreeClassCellBgCor);
    };return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(GoodsClassModel *_Nullable model) {
        @jobs_strongify(self)
        self.dataModel = model;
        self.logoImgView.byAlpha(1);
        self.nameLabel.byAlpha(1);
        self.btn.byAlpha(1);
        return self;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)cellSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(74), TreeClassItemCell_Height);
    };
}
#pragma mark —— lazyLoad
-(CGFloat)imageWidth{
    CGFloat imageWidth = JobsWidth(68.f);
    if (self.jobsRect.size.width < imageWidth){
        imageWidth = self.jobsRect.size.width;
    };return imageWidth;
}

-(UIImageView *)logoImgView{
    if (!_logoImgView) {
        @jobs_weakify(self)
        _logoImgView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView
                .byContentMode(UIViewContentModeScaleAspectFill)
                .byClipsToBounds(YES)
                .byCornerRadius(JobsWidth(8))
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(self.imageWidth, self.imageWidth));
                    make.centerX.equalTo(self.contentView);
                    make.top.equalTo(self.contentView);
                });
        });
    }
    if (self.dataModel.bgImage) {
        _logoImgView.byImage(self.dataModel.bgImage).byBgColor(JobsClearColor);
    } else {
        _logoImgView.byImage(nil).byBgColor(HEXCOLOR(0xF2E6CD));
    };return _logoImgView;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        @jobs_weakify(self)
        _nameLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byTextAlignment(NSTextAlignmentCenter)
                .byFont(UIFontWeightRegularSize(12))
                .byTextCor(JobsLabelColor)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self.contentView);
                    make.top.equalTo(self.logoImgView.mas_bottom).offset(JobsWidth(5));
                    make.height.mas_equalTo(JobsWidth(10));
                });
        });
    }_nameLabel.byText(self.dataModel.textModel.text);
    return _nameLabel;
}

-(BaseButton *)btn{
    if (!_btn) {
        @jobs_weakify(self)
        _btn = BaseButton.jobsInit()
            .bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0))
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(self.dataModel.imagePadding)// JobsWidth(5)
            .jobsResetBtnImage(self.dataModel.normalImage)
            .jobsResetBtnBgImage(self.dataModel.backgroundImage)
            .jobsResetBtnBgCor(self.dataModel.baseBackgroundColor)
            .jobsResetBtnTitleCor(self.dataModel.titleCor)// HEXCOLOR(0xC4C4C4)
            .jobsResetBtnTitleFont(self.dataModel.titleFont)// UIFontWeightRegularSize(12)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                x.bySelected(!x.selected);
                if(x.selected){
                    x.jobsResetBtnImage(self.dataModel.highlightImage);
                    self.dataModel.byJobsSelected(x.selected);
                }
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.height.mas_equalTo(JobsWidth(12));
                make.centerX.equalTo(self.contentView);
                make.bottom.equalTo(self.contentView).offset(JobsWidth(-5));
            });
    }
    _btn
        .jobsResetBtnTitle(self.dataModel.title)
        .makeBtnTitleByShowingType(UILabelShowingType_03)
        .bySelected(self.dataModel.jobsSelected);
    return _btn;
}

@end
