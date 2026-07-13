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
    self.contentView.byHidden(NO);
}

#pragma mark —— Private
-(UIImage *)jobsLogoImage{
    CGSize size = CGSizeMake(JobsWidth(72), JobsWidth(72));
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIBezierPath *path = UIBezierPath.byBezierPathWithRoundedRect(rect, JobsWidth(16));
    [HEXCOLOR(0x1D7FF2) setFill];
    path.byFill();
    NSString *text = @"J";
    NSDictionary<NSAttributedStringKey,id> *attrs = @{NSFontAttributeName:UIFontBoldSystemFontOfSize(JobsWidth(42)),
                                                      NSForegroundColorAttributeName:UIColor.whiteColor};
    CGSize textSize = [text sizeWithAttributes:attrs];
    [text drawAtPoint:CGPointMake((size.width - textSize.width) / 2, (size.height - textSize.height) / 2)
       withAttributes:attrs];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image ?: jobsMakeImage();
}

-(UILabel *)labelWithText:(NSString *)text{
    return jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byText(text.tr)
            .byTextCor(HEXCOLOR(0x263342))
            .byFont(UIFontWeightRegularSize(15))
            .byTextAlignment(NSTextAlignmentCenter)
            .byNumberOfLines(0);
    });
}

#pragma mark —— LazyLoad
-(UIView *)contentView{
    if (!_contentView) {
        @jobs_weakify(self)
        _contentView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(UIColor.whiteColor)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(10))
                        .byMasksToBounds(YES);
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.left.right.equalTo(self.view).inset(JobsWidth(20));
                    make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(JobsWidth(64));
                });
        });
        self.qrImageView.byHidden(NO);
        self.logoQRImageView.byHidden(NO);
        self.barcodeImageView.byHidden(NO);
        self.qrLab.byHidden(NO);
        self.logoQRLab.byHidden(NO);
        self.barcodeLab.byHidden(NO);
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.bottom.equalTo(self.barcodeLab.mas_bottom).offset(JobsWidth(24));
        }];
    };return _contentView;
}

-(UIImageView *)qrImageView{
    if (!_qrImageView) {
        @jobs_weakify(self)
        _qrImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byImage([self.qrContent jobsQRCodeImageByWidth:JobsWidth(180) correctionLevel:@"M"])
                .byContentMode(UIViewContentModeScaleAspectFit)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.contentView).offset(JobsWidth(24));
                    make.centerX.equalTo(self.contentView);
                    make.width.height.mas_equalTo(JobsWidth(180));
                });
        });
    };return _qrImageView;
}

-(UILabel *)qrLab{
    if (!_qrLab) {
        @jobs_weakify(self)
        _qrLab = [self labelWithText:self.qrContent];
        _qrLab.addOn(self.contentView);
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
        _logoQRImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byImage([@"https://www.google.com" jobsQRCodeImageByWidth:JobsWidth(180)
                                                              correctionLevel:@"H"
                                                                   centerLogo:self.jobsLogoImage
                                                                    logoRatio:0.22
                                                             logoCornerRadius:JobsWidth(10)
                                                                  borderWidth:JobsWidth(6)
                                                                  borderColor:UIColor.whiteColor])
                .byContentMode(UIViewContentModeScaleAspectFit)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.qrLab.mas_bottom).offset(JobsWidth(24));
                    make.centerX.equalTo(self.contentView);
                    make.width.height.mas_equalTo(JobsWidth(180));
                });
        });
    };return _logoQRImageView;
}

-(UILabel *)logoQRLab{
    if (!_logoQRLab) {
        @jobs_weakify(self)
        _logoQRLab = [self labelWithText:@"带中心 Logo 的二维码"];
        _logoQRLab.addOn(self.contentView);
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
        _barcodeImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byImage([self.barcodeContent jobsCode128BarcodeImageByWidth:JobsWidth(260)
                                                                   barHeight:JobsWidth(86)
                                                                  quietSpace:7
                                                                     spacing:JobsWidth(6)
                                                                        font:UIFontWeightRegularSize(15)
                                                                   textColor:UIColor.blackColor
                                                             backgroundColor:UIColor.whiteColor])
                .byContentMode(UIViewContentModeScaleAspectFit)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.logoQRLab.mas_bottom).offset(JobsWidth(24));
                    make.centerX.equalTo(self.contentView);
                    make.width.mas_equalTo(JobsWidth(260));
                    make.height.mas_equalTo(JobsWidth(110));
                });
        });
    };return _barcodeImageView;
}

-(UILabel *)barcodeLab{
    if (!_barcodeLab) {
        @jobs_weakify(self)
        _barcodeLab = [self labelWithText:@"Code128 条形码"];
        _barcodeLab.addOn(self.contentView);
        [_barcodeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.barcodeImageView.mas_bottom).offset(JobsWidth(10));
            make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
        }];
    };return _barcodeLab;
}

@end
