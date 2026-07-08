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
    self.controlView.alpha = 1;
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
    self.valueLabel.text = [NSString stringWithFormat:@"像素块：%.0f", blockSize];
    NSUInteger currentVersion = ++self.renderVersion;
    [self showStatus:@"正在生成整图马赛克".tr
    hiddenAfterDelay:NO];
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        UIImage *resultImage = [sourceImage jobs_mosaicPixelatedImageWithBlockSize:blockSize];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (currentVersion != self.renderVersion) return;
            self.imageView.image = resultImage;
            self.hasEdited = YES;
            [self showStatus:@"拖动滑块可调节马赛克粗细".tr
            hiddenAfterDelay:YES];
        });
    });
}
#pragma mark —— LazyLoad
-(UIView *)controlView{
    if (!_controlView) {
        _controlView = UIView.new;
        _controlView.backgroundColor = UIColor.whiteColor;
        _controlView.layer.cornerRadius = JobsWidth(8);
        _controlView.layer.masksToBounds = YES;
        [self.view addSubview:_controlView];
        [_controlView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view).inset(JobsWidth(16));
            make.height.mas_equalTo(JobsWidth(64));
            make.bottom.equalTo(self.statusLabel.mas_top).offset(-JobsWidth(12));
        }];
        self.valueLabel.alpha = 1;
        self.blockSizeSlider.alpha = 1;
        [self.imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(16));
            make.left.right.equalTo(self.view).inset(JobsWidth(16));
            make.bottom.equalTo(self.controlView.mas_top).offset(-JobsWidth(12));
        }];
    };return _controlView;
}

-(UILabel *)valueLabel{
    if (!_valueLabel) {
        _valueLabel = UILabel.new;
        _valueLabel.textColor = HEXCOLOR(0x3D4A58);
        _valueLabel.font = UIFontWeightMediumSize(14);
        [_controlView addSubview:_valueLabel];
        [_valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_controlView).offset(JobsWidth(14));
            make.top.equalTo(_controlView).offset(JobsWidth(8));
        }];
    };return _valueLabel;
}

-(UISlider *)blockSizeSlider{
    if (!_blockSizeSlider) {
        _blockSizeSlider = UISlider.new;
        _blockSizeSlider.minimumValue = 6;
        _blockSizeSlider.maximumValue = 46;
        _blockSizeSlider.value = 18;
        [_blockSizeSlider addTarget:self
                             action:@selector(sliderValueChanged:)
                   forControlEvents:UIControlEventValueChanged];
        [_controlView addSubview:_blockSizeSlider];
        [_blockSizeSlider mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(_controlView).inset(JobsWidth(14));
            make.bottom.equalTo(_controlView).offset(-JobsWidth(8));
        }];
    };return _blockSizeSlider;
}

@end
