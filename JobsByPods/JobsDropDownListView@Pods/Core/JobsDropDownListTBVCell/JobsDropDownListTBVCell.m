//
//  JobsDropDownListTBVCell.m
//  JobsDropDownListView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsDropDownListTBVCell.h"
#import <JobsBaseUI/NSObject+image.h>
#import <JobsDropDownListView/UIView+Extra.h>
#import <JobsDropDownListView/UITableView+RegisterClass.h>

@interface JobsDropDownListTBVCell ()
/// UI
Prop_strong()UIImageView *iconImgV;
Prop_strong()UILabel *titleLab;
Prop_strong()UILabel *subTitleLab;
Prop_strong()UIImageView *arrowImgV;

@end

@implementation JobsDropDownListTBVCell
/// UITableViewCellProtocol
UITableViewCellProtocol_Synthesize
#pragma mark —— UITableViewCellProtocol
+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleValue1ByTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsDropDownListTBVCell *cell = (JobsDropDownListTBVCell *)tableView.tableViewCellClass(JobsDropDownListTBVCell.class,@"");
        if (!cell) {
            cell = JobsDropDownListTBVCell.initTableViewCellWithStyle(UITableViewCellStyleValue1);
        };return cell;
    };
}
#pragma mark —— BaseCellProtocol
- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        self.jobsRichElementsTableViewCellBy(nil);
        self
            .bySelectionStyle(UITableViewCellSelectionStyleNone)// 取消点击效果 【不能在cellStyleValue1ByTableView里面写】
            .byContentView(^(__kindof UIView * _Nullable view) {
                view.byBgColor(HEXCOLOR(0xFBFCFE));
                view.layer.cornerRadius = JobsWidth(12);
                view.layer.masksToBounds = YES;
            })
            .bySelectedBackgroundView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                view
                    .byFrame(self.frame)// 这句不可省略
                    .byBgColor(HEXCOLOR(0xFFF5D8));
            }))
            .byBgColor(JobsClearColor);
        self.textLabel.byHidden(YES);
        self.detailTextLabel.byHidden(YES);
        self.accessoryType = UITableViewCellAccessoryNone;
        self.accessoryView = self.arrowImgV;
        self.layoutMargins = UIEdgeInsetsMake(0, JobsWidth(16), 0, JobsWidth(12));
        self.separatorInset = UIEdgeInsetsMake(0, JobsWidth(16), 0, JobsWidth(16));
        self.iconImgV.byAlpha(1);
        self.titleLab.byAlpha(1);
        self.subTitleLab.byAlpha(1);
    };return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.contentView.frame = CGRectInset(self.bounds, JobsWidth(6), JobsWidth(3));
    CGFloat centerY = CGRectGetMidY(self.contentView.bounds);
    CGFloat left = JobsWidth(16);
    CGFloat iconSide = self.iconImgV.hidden ? 0 : JobsWidth(28);
    if (self.iconImgV.hidden) {
        self.iconImgV.frame = CGRectZero;
    }else{
        self.iconImgV.frame = CGRectIntegral(CGRectMake(left,
                                                        centerY - iconSide / 2,
                                                        iconSide,
                                                        iconSide));
    }
    CGFloat textX = left + (self.iconImgV.hidden ? 0 : iconSide + JobsWidth(10));
    CGFloat textW = MAX(0, CGRectGetWidth(self.contentView.bounds) - textX - JobsWidth(34));
    BOOL hasSubTitle = self.subTitleLab.text.length > 0;
    CGFloat titleH = JobsWidth(hasSubTitle ? 20 : 24);
    CGFloat subTitleH = JobsWidth(18);
    CGFloat spacing = hasSubTitle ? JobsWidth(2) : 0;
    CGFloat groupH = titleH + spacing + (hasSubTitle ? subTitleH : 0);
    CGFloat groupY = centerY - groupH / 2;
    self.titleLab.frame = CGRectIntegral(CGRectMake(textX, groupY, textW, titleH));
    self.subTitleLab.byHidden(!hasSubTitle);
    self.subTitleLab.frame = hasSubTitle ? CGRectIntegral(CGRectMake(textX,
                                                                     CGRectGetMaxY(self.titleLab.frame) + spacing,
                                                                     textW,
                                                                     subTitleH)) : CGRectZero;
    CGRect arrowFrame = self.arrowImgV.frame;
    arrowFrame.origin.y = CGRectGetMidY(self.bounds) - CGRectGetHeight(arrowFrame) / 2;
    self.arrowImgV.frame = CGRectIntegral(arrowFrame);
}

-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        if (model) {
            self.viewModel = model;
            self.iconImgV
                .byImage(model.image)
                .byTintColor(HEXCOLOR(0xC96E42));
            self.iconImgV.byHidden(!model.image);
            self.titleLab
                .byText([NSString stringWithFormat:@"%@",model.textModel.text])
                .byFont(UIFontWeightMediumSize(14))
                .byTextCor(HEXCOLOR(0x2F3645));
            self.subTitleLab
                .byText([NSString stringWithFormat:@"%@",model.subTextModel.text])
                .byFont(UIFontWeightRegularSize(12))
                .byTextCor(HEXCOLOR(0x8A93A1));
            [self setNeedsLayout];
        };return self;
    };
}

-(UIImageView *)iconImgV{
    if (!_iconImgV) {
        _iconImgV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byContentMode(UIViewContentModeScaleAspectFit)
                .byTintColor(HEXCOLOR(0xC96E42))
                .addOn(self.contentView);
            imageView.layer.cornerRadius = JobsWidth(7);
            imageView.layer.masksToBounds = YES;
        });
    };return _iconImgV;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightMediumSize(14))
                .byTextAlignment(NSTextAlignmentLeft)
                .byNumberOfLines(1)
                .byTextCor(HEXCOLOR(0x2F3645))
                .byBgColor(JobsClearColor)
                .addOn(self.contentView);
        });
    };return _titleLab;
}

-(UILabel *)subTitleLab{
    if (!_subTitleLab) {
        _subTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightRegularSize(12))
                .byTextAlignment(NSTextAlignmentLeft)
                .byNumberOfLines(1)
                .byTextCor(HEXCOLOR(0x8A93A1))
                .byBgColor(JobsClearColor)
                .addOn(self.contentView);
        });
    };return _subTitleLab;
}

-(UIImageView *)arrowImgV{
    if (!_arrowImgV) {
        _arrowImgV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            UIImage *image = nil;
            if (@available(iOS 13.0, *)) {
                image = [@"chevron.right".sys_img
                         imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            }
            imageView
                .byImage(image)
                .byFrame(CGRectMake(0, 0, JobsWidth(8), JobsWidth(13)))
                .byTintColor(HEXCOLOR(0xB6BEC9));
            imageView.contentMode = UIViewContentModeScaleAspectFit;
        });
    };return _arrowImgV;
}

+(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(UIViewModel *_Nullable model){
        return model.image ? JobsWidth(56) : JobsWidth(48);
    };
}

@end
