//
//  JobsQRCodeDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsQRCodeDemoVC.h"

@interface JobsQRCodeDemoVC ()

Prop_strong()UIView *contentView;
Prop_strong()UIImageView *qrImageView;
Prop_strong()UIImageView *logoQRImageView;
Prop_strong()UIImageView *barcodeImageView;
Prop_strong()UILabel *qrLab;
Prop_strong()UILabel *logoQRLab;
Prop_strong()UILabel *barcodeLab;
Prop_copy()NSString *qrContent;
Prop_copy()NSString *barcodeContent;

@end

@implementation JobsQRCodeDemoVC
- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byTextCor(HEXCOLOR(0x263342));
            data.byText(@"二维码 + 条形码".tr);
            data.byFont(UIFontWeightRegularSize(18));
        })
        .byBgCor(HEXCOLOR(0xF5F7FA))
        .byNavBgCor(HEXCOLOR(0xF5F7FA));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.byBgColor(HEXCOLOR(0xF5F7FA));
    self.qrContent = @"https://jobs.dev/hello";
    self.barcodeContent = @"JOBS-2025-10-18";
    self.contentView.hidden = NO;
}

#pragma mark —— Private
-(UIImage *)jobsLogoImage{
    CGSize size = CGSizeMake(JobsWidth(72), JobsWidth(72));
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:JobsWidth(16)];
    [HEXCOLOR(0x1D7FF2) setFill];
    [path fill];
    NSString *text = @"J";
    NSDictionary<NSAttributedStringKey,id> *attrs = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:JobsWidth(42)],
                                                      NSForegroundColorAttributeName:UIColor.whiteColor};
    CGSize textSize = [text sizeWithAttributes:attrs];
    [text drawAtPoint:CGPointMake((size.width - textSize.width) / 2, (size.height - textSize.height) / 2)
       withAttributes:attrs];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image ?: UIImage.new;
}

-(UILabel *)labelWithText:(NSString *)text{
    UILabel *label = UILabel.new;
    label.text = text.tr;
    label.textColor = HEXCOLOR(0x263342);
    label.font = UIFontWeightRegularSize(15);
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    return label;
}

#pragma mark —— LazyLoad
-(UIView *)contentView{
    if (!_contentView) {
        @jobs_weakify(self)
        _contentView = UIView.new;
        _contentView.backgroundColor = UIColor.whiteColor;
        _contentView.layer.cornerRadius = JobsWidth(10);
        _contentView.layer.masksToBounds = YES;
        [self.view addSubview:_contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.left.right.equalTo(self.view).inset(JobsWidth(20));
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(JobsWidth(64));
        }];
        self.qrImageView.hidden = NO;
        self.logoQRImageView.hidden = NO;
        self.barcodeImageView.hidden = NO;
        self.qrLab.hidden = NO;
        self.logoQRLab.hidden = NO;
        self.barcodeLab.hidden = NO;
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.bottom.equalTo(self.barcodeLab.mas_bottom).offset(JobsWidth(24));
        }];
    };return _contentView;
}

-(UIImageView *)qrImageView{
    if (!_qrImageView) {
        @jobs_weakify(self)
        _qrImageView = UIImageView.new;
        _qrImageView.contentMode = UIViewContentModeScaleAspectFit;
        _qrImageView.image = [self.qrContent jobsQRCodeImageByWidth:JobsWidth(180) correctionLevel:@"M"];
        [self.contentView addSubview:_qrImageView];
        [_qrImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.contentView).offset(JobsWidth(24));
            make.centerX.equalTo(self.contentView);
            make.width.height.mas_equalTo(JobsWidth(180));
        }];
    };return _qrImageView;
}

-(UILabel *)qrLab{
    if (!_qrLab) {
        @jobs_weakify(self)
        _qrLab = [self labelWithText:self.qrContent];
        [self.contentView addSubview:_qrLab];
        [_qrLab mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.qrImageView.mas_bottom).offset(JobsWidth(10));
            make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
        }];
    };return _qrLab;
}

-(UIImageView *)logoQRImageView{
    if (!_logoQRImageView) {
        @jobs_weakify(self)
        _logoQRImageView = UIImageView.new;
        _logoQRImageView.contentMode = UIViewContentModeScaleAspectFit;
        _logoQRImageView.image = [@"https://www.google.com" jobsQRCodeImageByWidth:JobsWidth(180)
                                                                    correctionLevel:@"H"
                                                                         centerLogo:self.jobsLogoImage
                                                                          logoRatio:0.22
                                                                   logoCornerRadius:JobsWidth(10)
                                                                        borderWidth:JobsWidth(6)
                                                                        borderColor:UIColor.whiteColor];
        [self.contentView addSubview:_logoQRImageView];
        [_logoQRImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.qrLab.mas_bottom).offset(JobsWidth(24));
            make.centerX.equalTo(self.contentView);
            make.width.height.mas_equalTo(JobsWidth(180));
        }];
    };return _logoQRImageView;
}

-(UILabel *)logoQRLab{
    if (!_logoQRLab) {
        @jobs_weakify(self)
        _logoQRLab = [self labelWithText:@"带中心 Logo 的二维码"];
        [self.contentView addSubview:_logoQRLab];
        [_logoQRLab mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.logoQRImageView.mas_bottom).offset(JobsWidth(10));
            make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
        }];
    };return _logoQRLab;
}

-(UIImageView *)barcodeImageView{
    if (!_barcodeImageView) {
        @jobs_weakify(self)
        _barcodeImageView = UIImageView.new;
        _barcodeImageView.contentMode = UIViewContentModeScaleAspectFit;
        _barcodeImageView.image = [self.barcodeContent jobsCode128BarcodeImageByWidth:JobsWidth(260)
                                                                            barHeight:JobsWidth(86)
                                                                           quietSpace:7
                                                                              spacing:JobsWidth(6)
                                                                                 font:UIFontWeightRegularSize(15)
                                                                            textColor:UIColor.blackColor
                                                                      backgroundColor:UIColor.whiteColor];
        [self.contentView addSubview:_barcodeImageView];
        [_barcodeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.logoQRLab.mas_bottom).offset(JobsWidth(24));
            make.centerX.equalTo(self.contentView);
            make.width.mas_equalTo(JobsWidth(260));
            make.height.mas_equalTo(JobsWidth(110));
        }];
    };return _barcodeImageView;
}

-(UILabel *)barcodeLab{
    if (!_barcodeLab) {
        @jobs_weakify(self)
        _barcodeLab = [self labelWithText:@"Code128 条形码"];
        [self.contentView addSubview:_barcodeLab];
        [_barcodeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.barcodeImageView.mas_bottom).offset(JobsWidth(10));
            make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
        }];
    };return _barcodeLab;
}

@end
