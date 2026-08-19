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

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsWalletCardCollectionViewCell
@interface JobsWalletCardCollectionViewCell (JobsPropertyDSLSetterAutogen_6851592337)
-(void)setCardModel:(JobsWalletCardModel * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsWalletCardCollectionViewCell

@implementation JobsWalletCardCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if ((self = [super initWithFrame:frame])) {
        self.byBgColor(JobsClearColor);
        self.byClipsToBounds(NO);
        self.layer.byMasksToBounds(NO);
        self.layer.byShadowColor(RGBA_COLOR(32, 58, 86, 0.22).CGColor);
        self.layer.byShadowOpacity(1);
        self.layer.byShadowOffset(CGSizeMake(0, JobsWidth(5)));
        self.layer.byShadowRadius(JobsWidth(10));
        self.contentView.byBgColor(JobsSecondarySystemBackgroundColor);
        self.contentView.layer.byCornerRadius(JobsWidth(16));
        self.contentView.layer.byMasksToBounds(YES);
        self.contentView.layer.byBorderWidth(JobsWidth(1));
        self.contentView.layer.byBorderColor(RGBA_COLOR(255, 255, 255, 0.86).CGColor);
        self.backgroundImageView.byAlpha(1);
        self.logoView.byAlpha(1);
        self.bankNameLabel.byAlpha(1);
        self.cardNumberLabel.byAlpha(1);
        self.expirationLabel.byAlpha(1);
        self.cvcLabel.byAlpha(1);
    };return self;
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsWalletCardCollectionViewCell.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        CGFloat cornerRadius = JobsWidth(16);
        self.contentView.byFrame(UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(JobsWidth(2), JobsWidth(4), JobsWidth(2), JobsWidth(4))));
        self.contentView.layer.byCornerRadius(cornerRadius);
        self.layer.byShadowPath(UIBezierPath.byBezierPathWithRoundedRect(self.contentView.frame, cornerRadius).CGPath);
    };
}

-(void)prepareForReuse{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsWalletCardCollectionViewCell.class, @selector(jobsPrepareForReuse)))(self, @selector(jobsPrepareForReuse));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsPrepareForReuse{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super prepareForReuse];
        self.backgroundImageView.byImage(nil);
        self.logoView.byImage(nil);
        self.bankNameLabel.byText(nil);
        self.cardNumberLabel.byText(nil);
        self.expirationLabel.byText(nil);
        self.cvcLabel.byText(nil);
    };
}

-(jobsByJobsWalletCardModelBlock _Nonnull)jobsRichCardModel{
    @jobs_weakify(self)
    return ^(JobsWalletCardModel * model){
        @jobs_strongify(self)
        if (!self) return;
        self.byCardModel(model);
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
    };
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
                .byTextCor(JobsLabelColor)
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
                .byTextCor(JobsLabelColor)
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
                .byTextCor(JobsSecondaryLabelColor)
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
                .byTextCor(JobsSecondaryLabelColor)
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

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsWalletCardCollectionViewCell
-(JobsRetJobsWalletCardCollectionViewCellByJobsWalletCardModelBlock _Nonnull)byCardModel{
    @jobs_weakify(self)
    return ^__kindof JobsWalletCardCollectionViewCell * _Nullable(JobsWalletCardModel * _Nullable data){
        @jobs_strongify(self)
        [self setCardModel:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsWalletCardCollectionViewCell
@end
