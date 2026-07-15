//
//  JobsMosaicBaseDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsMosaicBaseDemoVC.h"

@interface JobsMosaicBaseDemoVC ()

Prop_strong()UIButton *saveButton;

-(NSString *)sampleImageURLString;
-(UIImage *)defaultDemoImage;
-(void)loadDemoImage;
-(void)saveCurrentImage;
-(void)image:(UIImage *)image
didFinishSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo;

@end

@implementation JobsMosaicBaseDemoVC
@synthesize imageView = _imageView;
@synthesize statusLabel = _statusLabel;
@synthesize saveButton = _saveButton;

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
            data.byText(self.pageTitle.tr)
                .byFont(UIFontWeightRegularSize(17))
                .byTextCor(HEXCOLOR(0x3D4A58));
        })
        .byBgCor(HEXCOLOR(0xF4F5F8))
        .byNavBgCor(HEXCOLOR(0xF4F5F8));
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.byBgColor(HEXCOLOR(0xF4F5F8));
    self.makeNavByAlpha(1);
    self.imageView.byAlpha(1);
    self.statusLabel.byAlpha(1);
    self.saveButton.byAlpha(1);
    [self loadDemoImage];
}
#pragma mark —— 子类复写
-(NSString *)pageTitle{
    return @"马赛克".tr;
}

-(UIImage *)imageForSaving{
    return self.imageView.image ?: self.originalImage;
}

-(void)onImageLoaded:(UIImage *)image{
    self.originalImage = image.jobs_mosaicNormalizedImage;
    self.imageView.byImage(self.originalImage);
}

-(void)showStatus:(NSString *)text
 hiddenAfterDelay:(BOOL)hiddenAfterDelay{
    self.statusLabel.byText(text.tr);
    self.statusLabel.byAlpha(1);
    if (!hiddenAfterDelay) return;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIView.jobsAnimate(.25,
            ^{
            self.statusLabel.byAlpha(.58);
        });
    });
}
#pragma mark —— 一些私有方法
-(NSString *)sampleImageURLString{
    return @"https://picsum.photos/1200/800";
}

-(UIImage *)defaultDemoImage{
    CGSize size = CGSizeMake(900, 640);
    UIGraphicsBeginImageContextWithOptions(size,
                                           YES,
                                           0);
    [HEXCOLOR(0x102A43) setFill];
    UIRectFill(CGRectMake(0,
                          0,
                          size.width,
                          size.height));
    NSArray <UIColor *>*colors = @[
        HEXCOLOR(0x1D9BF0),
        HEXCOLOR(0x34C759),
        HEXCOLOR(0xFF9F0A),
        HEXCOLOR(0xFF375F),
        HEXCOLOR(0xAF52DE)
    ];
    for (NSInteger index = 0; index < 14; index++) {
        UIColor *color = colors[index % colors.count];
        [color setFill];
        CGFloat width = 180 + (index % 4) * 36;
        CGFloat height = 80 + (index % 3) * 28;
        CGFloat x = 38 + (index % 5) * 166;
        CGFloat y = 48 + (index / 5) * 170 + (index % 2) * 24;
        UIBezierPath *path = UIBezierPath.byBezierPathWithRoundedRect(CGRectMake(x,
                                                                                y,
                                                                                width,
                                                                                height),
                                                                      22);
        path.byFill();
    }
    NSDictionary *titleAttrs = @{
        NSFontAttributeName: UIFontWeightSemiboldSize(54),
        NSForegroundColorAttributeName: UIColor.whiteColor
    };
    [@"Jobs Mosaic Demo" drawInRect:CGRectMake(64,
                                               252,
                                               size.width - 128,
                                               90)
                     withAttributes:titleAttrs];
    NSDictionary *subAttrs = @{
        NSFontAttributeName: UIFontWeightRegularSize(28),
        NSForegroundColorAttributeName: [UIColor.whiteColor colorWithAlphaComponent:.86]
    };
    [@"拖动涂抹或调节粗细，保存结果到系统相册" drawInRect:CGRectMake(68,
                                                             344,
                                                             size.width - 136,
                                                             60)
                                           withAttributes:subAttrs];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image ?: jobsMakeImage();
}

-(void)loadDemoImage{
    UIImage *image = [self defaultDemoImage];
    [self onImageLoaded:image];
    [self showStatus:@"图片加载中...".tr
    hiddenAfterDelay:YES];
#if JOBS_MOSAIC_HAS_SDWEBIMAGE
    NSURL *url = [NSURL URLWithString:self.sampleImageURLString];
    if (!url) return;
    [SDWebImageManager.sharedManager loadImageWithURL:url
                                              options:SDWebImageRetryFailed
                                             progress:nil
                                            completed:^(UIImage * _Nullable loadedImage,
                                                        NSData * _Nullable data,
                                                        NSError * _Nullable error,
                                                        SDImageCacheType cacheType,
                                                        BOOL finished,
                                                        NSURL * _Nullable imageURL) {
        if (!finished) return;
        dispatch_async(dispatch_get_main_queue(), ^{
            if (loadedImage) {
                [self onImageLoaded:loadedImage.jobs_mosaicNormalizedImage];
                [self showStatus:@"远程图片已载入".tr
                hiddenAfterDelay:YES];
            }else{
                [self showStatus:@"远程图片加载失败，已使用本地演示图".tr
                hiddenAfterDelay:YES];
            }
        });
    }];
#endif
}

-(void)saveCurrentImage{
    UIImage *image = [self imageForSaving];
    if (!image) {
        [self showStatus:@"暂无可保存图片".tr
        hiddenAfterDelay:YES];
        return;
    }
    UIImageWriteToSavedPhotosAlbum(image,
                                   self,
                                   @selector(image:didFinishSavingWithError:contextInfo:),
                                   NULL);
}

-(void)image:(UIImage *)image
didFinishSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo{
    [self showStatus:error ? @"保存失败，请检查相册权限".tr : @"已保存到系统相册".tr
    hiddenAfterDelay:YES];
}
#pragma mark —— LazyLoad
-(JobsMosaicBrushImageView *)imageView{
    if (!_imageView) {
        _imageView = JobsMosaicBrushImageView.new;
        _imageView.brushEnabled = NO;
        _imageView.byBgColor(UIColor.blackColor);
        _imageView.layer
            .byCornerRadius(JobsWidth(8))
            .byMasksToBounds(YES);
        _imageView.addOn(self.view);
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(16));
            make.left.right.equalTo(self.view).inset(JobsWidth(16));
            make.bottom.equalTo(self.statusLabel.mas_top).offset(-JobsWidth(12));
        }];
    };return _imageView;
}

-(UILabel *)statusLabel{
    if (!_statusLabel) {
        _statusLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextAlignment(NSTextAlignmentCenter)
                .byTextCor(HEXCOLOR(0x5A6372))
                .byFont(UIFontWeightRegularSize(13))
                .byNumberOfLines(0)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self.view).inset(JobsWidth(24));
                    make.bottom.equalTo(self.saveButton.mas_top).offset(-JobsWidth(12));
                });
        });
    };return _statusLabel;
}

-(UIButton *)saveButton{
    if (!_saveButton) {
        _saveButton = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(@"保存到相册".tr)
                .jobsResetBtnTitleCor(UIColor.whiteColor)
                .jobsResetBtnTitleFont(UIFontWeightMediumSize(16))
                .jobsResetBtnBgCor(HEXCOLOR(0x1D9BF0))
                .byAddTarget(self, @selector(saveCurrentImage), UIControlEventTouchUpInside)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(8))
                        .byMasksToBounds(YES);
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self.view).inset(JobsWidth(24));
                    make.height.mas_equalTo(JobsWidth(44));
                    make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-JobsWidth(24));
                });
        });
    };return _saveButton;
}

@end
