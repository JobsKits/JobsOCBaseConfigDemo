//
//  JobsMosaicWholeImageDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsMosaicWholeImageDemoVC.h"

@interface JobsMosaicWholeImageDemoVC ()

Prop_strong()UIView *controlView;
Prop_strong()UILabel *valueLabel;
Prop_strong()UISlider *blockSizeSlider;
Prop_assign()NSUInteger renderVersion;

-(void)sliderValueChanged:(UISlider *)slider;
-(void)applyCurrentMosaic;

@end

@implementation JobsMosaicWholeImageDemoVC
-(NSString *)pageTitle{
    return @"整图粗细马赛克".tr;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.controlView.byAlpha(1);
    [self applyCurrentMosaic];
}

-(void)onImageLoaded:(UIImage *)image{
    [super onImageLoaded:image];
    if (_controlView) [self applyCurrentMosaic];
}

-(void)sliderValueChanged:(UISlider *)slider{
    [self applyCurrentMosaic];
}

-(void)applyCurrentMosaic{
    UIImage *sourceImage = self.originalImage;
    if (!sourceImage) return;
    CGFloat blockSize = self.blockSizeSlider.value;
    self.valueLabel.byText([NSString stringWithFormat:@"像素块：%.0f", blockSize]);
    NSUInteger currentVersion = ++self.renderVersion;
    [self showStatus:@"正在生成整图马赛克".tr
    hiddenAfterDelay:NO];
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        UIImage *resultImage = [sourceImage jobs_mosaicPixelatedImageWithBlockSize:blockSize];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (currentVersion != self.renderVersion) return;
            self.imageView.byImage(resultImage);
            self.hasEdited = YES;
            [self showStatus:@"拖动滑块可调节马赛克粗细".tr
            hiddenAfterDelay:YES];
        });
    });
}
#pragma mark —— LazyLoad
-(UIView *)controlView{
    if (!_controlView) {
        _controlView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(UIColor.whiteColor)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(8))
                        .byMasksToBounds(YES);
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self.view).inset(JobsWidth(16));
                    make.height.mas_equalTo(JobsWidth(64));
                    make.bottom.equalTo(self.statusLabel.mas_top).offset(-JobsWidth(12));
                });
        });
        self.valueLabel.byAlpha(1);
        self.blockSizeSlider.byAlpha(1);
        [self.imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(16));
            make.left.right.equalTo(self.view).inset(JobsWidth(16));
            make.bottom.equalTo(self.controlView.mas_top).offset(-JobsWidth(12));
        }];
    };return _controlView;
}

-(UILabel *)valueLabel{
    if (!_valueLabel) {
        _valueLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextCor(HEXCOLOR(0x3D4A58))
                .byFont(UIFontWeightMediumSize(14))
                .addOn(_controlView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(_controlView).offset(JobsWidth(14));
                    make.top.equalTo(_controlView).offset(JobsWidth(8));
                });
        });
    };return _valueLabel;
}

-(UISlider *)blockSizeSlider{
    if (!_blockSizeSlider) {
        @jobs_weakify(self)
        _blockSizeSlider = jobsMakeSlider(^(__kindof UISlider * _Nullable slider) {
            slider
                .byMinimumValue(6)
                .byMaximumValue(46)
                .byValue(18)
                .onJobsChange(^(__kindof UIControl * _Nullable control) {
                    [weak_self sliderValueChanged:(UISlider *)control];
                })
                .addOn(_controlView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(_controlView).inset(JobsWidth(14));
                    make.bottom.equalTo(_controlView).offset(-JobsWidth(8));
                });
        });
    };return _blockSizeSlider;
}

@end
