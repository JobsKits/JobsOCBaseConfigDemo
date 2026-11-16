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
        self.backgroundColor = JobsClearColor;
        self.clipsToBounds = NO;
        self.layer.masksToBounds = NO;
        self.layer.shadowColor = RGBA_COLOR(32, 58, 86, 0.22).CGColor;
        self.layer.shadowOpacity = 1;
        self.layer.shadowOffset = CGSizeMake(0, JobsWidth(5));
        self.layer.shadowRadius = JobsWidth(10);
        self.contentView.backgroundColor = JobsWhiteColor;
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
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.contentView.frame cornerRadius:cornerRadius].CGPath;
}

-(void)prepareForReuse{
    [super prepareForReuse];
    self.backgroundImageView.image = nil;
    self.logoView.image = nil;
    self.bankNameLabel.text = nil;
    self.cardNumberLabel.text = nil;
    self.expirationLabel.text = nil;
    self.cvcLabel.text = nil;
}

-(void)jobsRichCardModel:(JobsWalletCardModel *)model{
    self.cardModel = model;
    self.backgroundImageView.hidden = !model.backgroundImage;
    self.backgroundImageView.image = model.backgroundImage;
    self.contentView.backgroundColor = model.backgroundImage ? JobsClearColor : (model.backgroundColor ?: HEXCOLOR(0xD9EEFF));
    self.logoView.image = model.bankIcon;
    self.bankNameLabel.text = model.bankName;
    self.cardNumberLabel.text = model.cardNumber;
    self.expirationLabel.text = isValue(model.expirationDate) ? [NSString stringWithFormat:@"EXP %@", model.expirationDate] : nil;
    self.cvcLabel.text = isValue(model.cvc) ? [NSString stringWithFormat:@"CVC %@", model.cvc] : nil;
    self.expirationLabel.hidden = !isValue(model.expirationDate);
    self.cvcLabel.hidden = !isValue(model.cvc);
}

-(UIImageView *)backgroundImageView{
    if (!_backgroundImageView) {
        _backgroundImageView = UIImageView.new;
        _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
        _backgroundImageView.clipsToBounds = YES;
        [self.contentView addSubview:_backgroundImageView];
        [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    };return _backgroundImageView;
}

-(UIView *)logoContainerView{
    if (!_logoContainerView) {
        _logoContainerView = UIView.new;
        _logoContainerView.backgroundColor = RGBA_COLOR(255, 255, 255, 0.82);
        _logoContainerView.layer.cornerRadius = JobsWidth(26);
        _logoContainerView.clipsToBounds = YES;
        [self.contentView addSubview:_logoContainerView];
        [_logoContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(JobsWidth(20));
            make.centerY.equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(JobsWidth(52), JobsWidth(52)));
        }];
    };return _logoContainerView;
}

-(UIImageView *)logoView{
    if (!_logoView) {
        _logoView = UIImageView.new;
        _logoView.contentMode = UIViewContentModeScaleAspectFit;
        _logoView.clipsToBounds = YES;
        [self.logoContainerView addSubview:_logoView];
        [_logoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.logoContainerView).insets(UIEdgeInsetsMake(JobsWidth(7), JobsWidth(7), JobsWidth(7), JobsWidth(7)));
        }];
    };return _logoView;
}

-(UILabel *)bankNameLabel{
    if (!_bankNameLabel) {
        _bankNameLabel = UILabel.new;
        _bankNameLabel.font = UIFontWeightSemiboldSize(17);
        _bankNameLabel.textColor = HEXCOLOR(0x2F3A46);
        _bankNameLabel.numberOfLines = 1;
        _bankNameLabel.adjustsFontSizeToFitWidth = YES;
        _bankNameLabel.minimumScaleFactor = 0.82;
        [self.contentView addSubview:_bankNameLabel];
        [_bankNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.logoContainerView.mas_right).offset(JobsWidth(12));
            make.top.equalTo(self.contentView).offset(JobsWidth(22));
            make.right.lessThanOrEqualTo(self.cardNumberLabel.mas_left).offset(JobsWidth(-12));
        }];
        [_bankNameLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    };return _bankNameLabel;
}

-(UILabel *)cardNumberLabel{
    if (!_cardNumberLabel) {
        _cardNumberLabel = UILabel.new;
        _cardNumberLabel.font = UIFontWeightBoldSize(20);
        _cardNumberLabel.textColor = HEXCOLOR(0x2F3A46);
        _cardNumberLabel.textAlignment = NSTextAlignmentRight;
        _cardNumberLabel.numberOfLines = 1;
        _cardNumberLabel.adjustsFontSizeToFitWidth = YES;
        _cardNumberLabel.minimumScaleFactor = 0.82;
        [self.contentView addSubview:_cardNumberLabel];
        [_cardNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(JobsWidth(-20));
            make.top.equalTo(self.contentView).offset(JobsWidth(20));
        }];
        [_cardNumberLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    };return _cardNumberLabel;
}

-(UILabel *)expirationLabel{
    if (!_expirationLabel) {
        _expirationLabel = UILabel.new;
        _expirationLabel.font = UIFontWeightRegularSize(12);
        _expirationLabel.textColor = HEXCOLOR(0x5D6875);
        _expirationLabel.numberOfLines = 1;
        [self.contentView addSubview:_expirationLabel];
        [_expirationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bankNameLabel);
            make.bottom.equalTo(self.contentView).offset(JobsWidth(-22));
        }];
    };return _expirationLabel;
}

-(UILabel *)cvcLabel{
    if (!_cvcLabel) {
        _cvcLabel = UILabel.new;
        _cvcLabel.font = UIFontWeightRegularSize(12);
        _cvcLabel.textColor = HEXCOLOR(0x5D6875);
        _cvcLabel.textAlignment = NSTextAlignmentRight;
        _cvcLabel.numberOfLines = 1;
        [self.contentView addSubview:_cvcLabel];
        [_cvcLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.cardNumberLabel);
            make.centerY.equalTo(self.expirationLabel);
            make.left.greaterThanOrEqualTo(self.expirationLabel.mas_right).offset(JobsWidth(12));
        }];
    };return _cvcLabel;
}

@end
