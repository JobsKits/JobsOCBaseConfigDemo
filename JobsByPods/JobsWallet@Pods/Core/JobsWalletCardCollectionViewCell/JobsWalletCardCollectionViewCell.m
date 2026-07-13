//
//  JobsWalletCardCollectionViewCell.m
//  JobsWallet
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "JobsWalletCardCollectionViewCell.h"

@interface JobsWalletCardCollectionViewCell ()

Prop_strong()UIImageView *backgroundImageView;
Prop_strong()UIView *logoContainerView;
Prop_strong()UIImageView *logoView;
Prop_strong()UILabel *bankNameLabel;
Prop_strong()UILabel *cardNumberLabel;
Prop_strong()UILabel *expirationLabel;
Prop_strong()UILabel *cvcLabel;
Prop_strong()JobsWalletCardModel *cardModel;

@end

@implementation JobsWalletCardCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if ((self = [super initWithFrame:frame])) {
        self.byBgColor(JobsClearColor);
        self.clipsToBounds = NO;
        self.layer.masksToBounds = NO;
        self.layer.shadowColor = RGBA_COLOR(32, 58, 86, 0.22).CGColor;
        self.layer.shadowOpacity = 1;
        self.layer.shadowOffset = CGSizeMake(0, JobsWidth(5));
        self.layer.shadowRadius = JobsWidth(10);
        self.contentView.byBgColor(JobsWhiteColor);
        self.contentView.layer.cornerRadius = JobsWidth(16);
        self.contentView.layer.masksToBounds = YES;
        self.contentView.layer.borderWidth = JobsWidth(1);
        self.contentView.layer.borderColor = RGBA_COLOR(255, 255, 255, 0.86).CGColor;
        self.backgroundImageView.alpha = 1;
        self.logoView.alpha = 1;
        self.bankNameLabel.alpha = 1;
        self.cardNumberLabel.alpha = 1;
        self.expirationLabel.alpha = 1;
        self.cvcLabel.alpha = 1;
    };return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat cornerRadius = JobsWidth(16);
    self.contentView.frame = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(JobsWidth(2), JobsWidth(4), JobsWidth(2), JobsWidth(4)));
    self.contentView.layer.cornerRadius = cornerRadius;
    self.layer.shadowPath = UIBezierPath.byBezierPathWithRoundedRect(self.contentView.frame, cornerRadius).CGPath;
}

-(void)prepareForReuse{
    [super prepareForReuse];
    self.backgroundImageView.byImage(nil);
    self.logoView.byImage(nil);
    self.bankNameLabel.byText(nil);
    self.cardNumberLabel.byText(nil);
    self.expirationLabel.byText(nil);
    self.cvcLabel.byText(nil);
}

-(void)jobsRichCardModel:(JobsWalletCardModel *)model{
    self.cardModel = model;
    self.backgroundImageView.byHidden(!model.backgroundImage);
    self.backgroundImageView.byImage(model.backgroundImage);
    self.contentView.byBgColor(model.backgroundImage ? JobsClearColor : (model.backgroundColor ?: HEXCOLOR(0xD9EEFF)));
    self.logoView.byImage(model.bankIcon);
    self.bankNameLabel.byText(model.bankName);
    self.cardNumberLabel.byText(model.cardNumber);
    self.expirationLabel.byText(isValue(model.expirationDate) ? [NSString stringWithFormat:@"EXP %@", model.expirationDate] : nil);
    self.cvcLabel.byText(isValue(model.cvc) ? [NSString stringWithFormat:@"CVC %@", model.cvc] : nil);
    self.expirationLabel.byHidden(!isValue(model.expirationDate));
    self.cvcLabel.byHidden(!isValue(model.cvc));
}

-(UIImageView *)backgroundImageView{
    if (!_backgroundImageView) {
        _backgroundImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byContentMode(UIViewContentModeScaleAspectFill)
                .byUserInteractionEnabled(NO)
                .byClipsToBounds(YES)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self.contentView);
                });
        });
    };return _backgroundImageView;
}

-(UIView *)logoContainerView{
    if (!_logoContainerView) {
        _logoContainerView = jobsMakeView(^(__kindof UIView * _Nullable view) {
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
        _logoView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byContentMode(UIViewContentModeScaleAspectFit)
                .byUserInteractionEnabled(NO)
                .byClipsToBounds(YES)
                .addOn(self.logoContainerView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self.logoContainerView).insets(UIEdgeInsetsMake(JobsWidth(7), JobsWidth(7), JobsWidth(7), JobsWidth(7)));
                });
        });
    };return _logoView;
}

-(UILabel *)bankNameLabel{
    if (!_bankNameLabel) {
        _bankNameLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightSemiboldSize(17))
                .byTextCor(HEXCOLOR(0x2F3A46))
                .byNumberOfLines(1)
                .byAdjustsFontSizeToFitWidth(YES)
                .byMinimumScaleFactor(0.82)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.logoContainerView.mas_right).offset(JobsWidth(12));
                    make.top.equalTo(self.contentView).offset(JobsWidth(22));
                    make.right.lessThanOrEqualTo(self.cardNumberLabel.mas_left).offset(JobsWidth(-12));
                });
        });
        [_bankNameLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    };return _bankNameLabel;
}

-(UILabel *)cardNumberLabel{
    if (!_cardNumberLabel) {
        _cardNumberLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightBoldSize(20))
                .byTextCor(HEXCOLOR(0x2F3A46))
                .byTextAlignment(NSTextAlignmentRight)
                .byNumberOfLines(1)
                .byAdjustsFontSizeToFitWidth(YES)
                .byMinimumScaleFactor(0.82)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.right.equalTo(self.contentView).offset(JobsWidth(-20));
                    make.top.equalTo(self.contentView).offset(JobsWidth(20));
                });
        });
        [_cardNumberLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    };return _cardNumberLabel;
}

-(UILabel *)expirationLabel{
    if (!_expirationLabel) {
        _expirationLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightRegularSize(12))
                .byTextCor(HEXCOLOR(0x5D6875))
                .byNumberOfLines(1)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.bankNameLabel);
                    make.bottom.equalTo(self.contentView).offset(JobsWidth(-22));
                });
        });
    };return _expirationLabel;
}

-(UILabel *)cvcLabel{
    if (!_cvcLabel) {
        _cvcLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightRegularSize(12))
                .byTextCor(HEXCOLOR(0x5D6875))
                .byTextAlignment(NSTextAlignmentRight)
                .byNumberOfLines(1)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.right.equalTo(self.cardNumberLabel);
                    make.centerY.equalTo(self.expirationLabel);
                    make.left.greaterThanOrEqualTo(self.expirationLabel.mas_right).offset(JobsWidth(12));
                });
        });
    };return _cvcLabel;
}

@end
