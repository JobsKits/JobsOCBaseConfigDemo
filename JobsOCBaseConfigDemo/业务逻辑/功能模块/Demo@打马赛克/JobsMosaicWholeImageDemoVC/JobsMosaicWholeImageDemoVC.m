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

-(jobsBySliderBlock _Nonnull)sliderValueChanged;
-(jobsByVoidBlock _Nonnull)applyCurrentMosaic;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsMosaicWholeImageDemoVC
@interface JobsMosaicWholeImageDemoVC (JobsPropertyDSLSetterAutogen_18ccf6b4d1)
-(void)setHasEdited:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsMosaicWholeImageDemoVC

@implementation JobsMosaicWholeImageDemoVC
-(JobsRetStrByVoidBlock _Nonnull)jobsPageTitle{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"整图粗细马赛克".jobsTr();
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMosaicWholeImageDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.controlView.byAlpha(1);
        self.applyCurrentMosaic();
    };
}

-(jobsByImageBlock _Nonnull)onImageLoaded{
    @jobs_weakify(self)
    return ^(UIImage * image){
        @jobs_strongify(self)
        if (!self) return;
        jobsByImageBlock action = [super onImageLoaded];
        if (action) action(image);
        if (_controlView) self.applyCurrentMosaic();
    };
}

-(jobsBySliderBlock _Nonnull)sliderValueChanged{
    @jobs_weakify(self)
    return ^(UISlider * slider){
        @jobs_strongify(self)
        if (!self) return;
        self.applyCurrentMosaic();
    };
}

-(jobsByVoidBlock _Nonnull)applyCurrentMosaic{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIImage *sourceImage = self.originalImage;
        if (!sourceImage) return;
        CGFloat blockSize = self.blockSizeSlider.value;
        self.valueLabel.byText([NSString stringWithFormat:@"像素块：%.0f", blockSize]);
        NSUInteger currentVersion = ++self.renderVersion;
        [self showStatus:@"正在生成整图马赛克".jobsTr()
        hiddenAfterDelay:NO];
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
            UIImage *resultImage = sourceImage.jobs_mosaicPixelatedImageWithBlockSize(blockSize);
            dispatch_async(dispatch_get_main_queue(), ^{
                if (currentVersion != self.renderVersion) return;
                self.imageView.byImage(resultImage);
                self.byHasEdited(YES);
                [self showStatus:@"拖动滑块可调节马赛克粗细".jobsTr()
                hiddenAfterDelay:YES];
            });
        });
    };
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
                .byTextCor(JobsLabelColor)
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
                    weak_self.sliderValueChanged((UISlider *)control);
                })
                .addOn(_controlView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(_controlView).inset(JobsWidth(14));
                    make.bottom.equalTo(_controlView).offset(-JobsWidth(8));
                });
        });
    };return _blockSizeSlider;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsMosaicWholeImageDemoVC
-(JobsRetJobsMosaicWholeImageDemoVCByBOOLBlock _Nonnull)byHasEdited{
    @jobs_weakify(self)
    return ^__kindof JobsMosaicWholeImageDemoVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setHasEdited:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsMosaicWholeImageDemoVC
@end
