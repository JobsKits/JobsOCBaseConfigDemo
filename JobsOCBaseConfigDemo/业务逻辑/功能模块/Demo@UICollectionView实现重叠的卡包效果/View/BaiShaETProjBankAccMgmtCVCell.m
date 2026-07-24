//
//  BaiShaETProjBankAccMgmtCVCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BaiShaETProjBankAccMgmtCVCell.h"

@interface BaiShaETProjBankAccMgmtCVCell ()
/// UI
Prop_strong()UIView *logoContainerView;
Prop_strong()UIImageView *logoView;
Prop_strong()UILabel *titleLab;
Prop_strong()UILabel *detailLab;

@end

@implementation BaiShaETProjBankAccMgmtCVCell
- (instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        self
            .byBgColor(JobsClearColor)
            .byClipsToBounds(NO)
            .byLayer(^(CALayer *layer) {
                layer
                    .byMasksToBounds(NO)
                    .byShadowColor(RGBA_COLOR(32, 58, 86, 0.22).CGColor)
                    .byShadowOpacity(1)
                    .byShadowOffset(CGSizeMake(0, JobsWidth(5)))
                    .byShadowRadius(JobsWidth(10));
            });
        self.contentView
            .byBgColor(JobsWhiteColor)
            .byCornerRadius(JobsWidth(16))
            .byClipsToBounds(YES)
            .byLayer(^(CALayer *layer) {
                layer
                    .byBorderWidth(JobsWidth(1))
                    .byBorderColor(RGBA_COLOR(255, 255, 255, 0.86).CGColor);
            });
    };return self;
}
#pragma mark —— 复写父类相关方法和属性
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat cornerRadius = JobsWidth(16);
    self.contentView.byFrame(UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(JobsWidth(2), JobsWidth(4), JobsWidth(2), JobsWidth(4))));
    self.contentView.layer
        .byCornerRadius(cornerRadius)
        .byBorderWidth(JobsWidth(1))
        .byBorderColor(RGBA_COLOR(255, 255, 255, 0.86).CGColor);
    self.layer
        .byShadowPath([UIBezierPath bezierPathWithRoundedRect:self.contentView.frame cornerRadius:cornerRadius].CGPath);
}
#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    BaiShaETProjBankAccMgmtCVCell *cell = JobsRegisterDequeueCollectionViewCell(BaiShaETProjBankAccMgmtCVCell);
    cell.indexPath = indexPath;
    return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetCollectionViewCellByIDBlock _Nonnull)jobsRichElementsCollectionViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model ? : jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {});
        self.logoContainerView.byAlpha(1);
        self.logoView.byImage(self.viewModel.image);
        self.titleLab.byText(self.viewModel.textModel.text);
        self.detailLab.byText(self.viewModel.subTextModel.text);
        self.byBgColor(JobsClearColor);
        CGRect gradientRect = self.bounds;
        if (CGRectIsEmpty(gradientRect)) {
            gradientRect = CGRectMake(0, 0, JobsMainScreen_WIDTH() - JobsWidth(30), JobsWidth(96));
        }
        switch (self.viewModel.item % 4) {
            /// 处理 数值 0 分支
            case 0:
                self.contentView.byBgColor([UIColor gradientCorDataMutArr:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
                    data.add(HEXCOLOR(0xD9EEFF))
                        .add(HEXCOLOR(0xBFE2FF));
                })
                                            startPoint:CGPointZero
                                              endPoint:CGPointMake(1, 1)
                                                opaque:NO
                                        targetViewRect:gradientRect]);
                break;
            /// 处理 数值 1 分支
            case 1:
                self.contentView.byBgColor([UIColor gradientCorDataMutArr:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
                    data.add(HEXCOLOR(0xE8F7EF))
                        .add(HEXCOLOR(0xCFEFDF));
                })
                                            startPoint:CGPointZero
                                              endPoint:CGPointMake(1, 1)
                                                opaque:NO
                                        targetViewRect:gradientRect]);
                break;
            /// 处理 数值 2 分支
            case 2:
                self.contentView.byBgColor([UIColor gradientCorDataMutArr:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
                    data.add(HEXCOLOR(0xFFF2D0))
                        .add(HEXCOLOR(0xFFE2A8));
                })
                                            startPoint:CGPointZero
                                              endPoint:CGPointMake(1, 1)
                                                opaque:NO
                                        targetViewRect:gradientRect]);
                break;
            /// 未匹配已知分支时执行兜底处理
            default:
                self.contentView.byBgColor([UIColor gradientCorDataMutArr:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
                    data.add(HEXCOLOR(0xF0ECFF))
                        .add(HEXCOLOR(0xDCD5FF));
                })
                                            startPoint:CGPointZero
                                              endPoint:CGPointMake(1, 1)
                                                opaque:NO
                                        targetViewRect:gradientRect]);
                break;
        };return self;
    };
}
#pragma mark —— lazyLoad
-(UIView *)logoContainerView{
    if (!_logoContainerView) {
        @jobs_weakify(self)
        _logoContainerView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view
                .byBgColor(RGBA_COLOR(255, 255, 255, 0.82))
                .byCornerRadius(JobsWidth(26))
                .byClipsToBounds(YES)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.contentView).offset(JobsWidth(20));
                    make.centerY.equalTo(self.contentView);
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(52), JobsWidth(52)));
                });
        });
    };return _logoContainerView;
}

-(UIImageView *)logoView{
    if (!_logoView) {
        @jobs_weakify(self)
        _logoView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView
                .byImage(self.viewModel.image)
                .byContentMode(UIViewContentModeScaleAspectFit)
                .byClipsToBounds(YES)
                .addOn(self.logoContainerView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self.logoContainerView).insets(UIEdgeInsetsMake(JobsWidth(7), JobsWidth(7), JobsWidth(7), JobsWidth(7)));
                });
        });
    };return _logoView;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(self.viewModel.textModel.text)
                .byFont(UIFontWeightSemiboldSize(17))
                .byTextCor(HEXCOLOR(0x2F3A46))
                .byNumberOfLines(1)
                .byLineBreakMode(NSLineBreakByTruncatingTail)
                .byAdjustsFontSizeToFitWidth(YES)
                .byMinimumScaleFactor(0.82)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.logoContainerView.mas_right).offset(JobsWidth(12));
                    make.centerY.equalTo(self.contentView);
                    make.right.lessThanOrEqualTo(self.detailLab.mas_left).offset(JobsWidth(-12));
                });
            [label setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        });
    };return _titleLab;
}

-(UILabel *)detailLab{
    if (!_detailLab) {
        @jobs_weakify(self)
        _detailLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(self.viewModel.subTextModel.text)
                .byFont(UIFontWeightBoldSize(20))
                .byTextCor(HEXCOLOR(0x2F3A46))
                .byTextAlignment(NSTextAlignmentRight)
                .byNumberOfLines(1)
                .byAdjustsFontSizeToFitWidth(YES)
                .byMinimumScaleFactor(0.82)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.right.equalTo(self.contentView).offset(JobsWidth(-20));
                    make.centerY.equalTo(self.contentView);
                });
            [label setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        });
    };return _detailLab;
}

@end
