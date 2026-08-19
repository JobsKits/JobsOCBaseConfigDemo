//
//  JobsMosaicBrushDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsMosaicBrushDemoVC.h"

@interface JobsMosaicBrushDemoVC ()

Prop_strong()UIView *controlView;
Prop_strong()UIImage *mosaicImage;
Prop_strong()NSMutableArray <NSValue *>*brushPointValueMutArr;
Prop_strong()UILabel *controlTitleLabel;
Prop_strong()UISwitch *brushSwitch;
Prop_strong()UIButton *clearButton;
Prop_assign()CGFloat brushDiameter;
Prop_assign()NSUInteger renderVersion;

-(jobsBySwitchBlock _Nonnull)switchValueChanged;
-(jobsByVoidBlock _Nonnull)clearBrush;
-(jobsByVoidBlock _Nonnull)renderBrushImage;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsMosaicBrushDemoVC
@interface JobsMosaicBrushDemoVC (JobsPropertyDSLSetterAutogen_2e05a95f79)
-(void)setBrushDiameter:(CGFloat)data;
-(void)setHasEdited:(BOOL)data;
-(void)setMosaicImage:(UIImage * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsMosaicBrushDemoVC

@implementation JobsMosaicBrushDemoVC
-(JobsRetStrByVoidBlock _Nonnull)jobsPageTitle{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"手势涂抹马赛克".jobsTr();
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMosaicBrushDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.imageView.byBrushDelegate(self);
        self.imageView.byBrushEnabled(YES);
        self.byBrushDiameter(42);
        self.controlView.byAlpha(1);
        [self showStatus:@"手指在图片上拖动即可局部打码".jobsTr()
        hiddenAfterDelay:YES];
    };
}

-(jobsByImageBlock _Nonnull)onImageLoaded{
    @jobs_weakify(self)
    return ^(UIImage * image){
        @jobs_strongify(self)
        if (!self) return;
        jobsByImageBlock action = [super onImageLoaded];
        if (action) action(image);
        self.byMosaicImage(self.originalImage.jobs_mosaicPixelatedImageWithBlockSize(18));
    };
}
#pragma mark —— JobsMosaicBrushImageViewDelegate
-(void)mosaicBrushImageView:(JobsMosaicBrushImageView *)imageView
        didPaintAtViewPoint:(CGPoint)viewPoint{
    BOOL valid = NO;
    CGPoint imagePoint = [imageView jobs_mosaicImagePointFromViewPoint:viewPoint
                                                             imageSize:self.originalImage.size
                                                                 valid:&valid];
    if (!valid) return;
    [self.brushPointValueMutArr addObject:[NSValue valueWithCGPoint:imagePoint]];
    self.renderBrushImage();
}
#pragma mark —— Action
-(jobsBySwitchBlock _Nonnull)switchValueChanged{
    @jobs_weakify(self)
    return ^(UISwitch * sender){
        @jobs_strongify(self)
        if (!self) return;
        self.imageView.byBrushEnabled(sender.isOn);
        [self showStatus:sender.isOn ? @"已开启涂抹".jobsTr() : @"已暂停涂抹".jobsTr()
        hiddenAfterDelay:YES];
    };
}

-(jobsByVoidBlock _Nonnull)clearBrush{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.brushPointValueMutArr removeAllObjects];
        self.imageView.byImage(self.originalImage);
        self.byHasEdited(NO);
        [self showStatus:@"已清除涂抹区域".jobsTr()
        hiddenAfterDelay:YES];
    };
}

-(jobsByVoidBlock _Nonnull)renderBrushImage{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIImage *sourceImage = self.originalImage;
        UIImage *mosaicImage = self.mosaicImage;
        NSArray <NSValue *>*centers = self.brushPointValueMutArr.copy;
        if (!sourceImage || !mosaicImage || !centers.count) return;
        CGFloat diameter = self.brushDiameter;
        NSUInteger currentVersion = ++self.renderVersion;
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
            UIImage *resultImage = [sourceImage jobs_mosaicPaintedImageWithMosaicImage:mosaicImage
                                                                               centers:centers
                                                                         brushDiameter:diameter];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (currentVersion != self.renderVersion) return;
                self.imageView.byImage(resultImage);
                self.byHasEdited(YES);
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
                    make.height.mas_equalTo(JobsWidth(54));
                    make.bottom.equalTo(self.statusLabel.mas_top).offset(-JobsWidth(12));
                });
        });
        self.controlTitleLabel.addOn(_controlView).byAdd(^(MASConstraintMaker *make) {
            make.left.equalTo(_controlView).offset(JobsWidth(14));
            make.centerY.equalTo(_controlView);
        });
        self.brushSwitch.byAlpha(1);
        self.clearButton.byAlpha(1);
        [self.imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(16));
            make.left.right.equalTo(self.view).inset(JobsWidth(16));
            make.bottom.equalTo(self.controlView.mas_top).offset(-JobsWidth(12));
        }];
    };return _controlView;
}

-(UILabel *)controlTitleLabel{
    if (!_controlTitleLabel) {
        _controlTitleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"涂抹".jobsTr())
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightMediumSize(15));
        });
    };return _controlTitleLabel;
}

-(UISwitch *)brushSwitch{
    if (!_brushSwitch) {
        @jobs_weakify(self)
        _brushSwitch = jobsMakeSwitch(^(__kindof UISwitch * _Nullable Switch) {
            Switch
                .byOn(YES)
                .onJobsChange(^(__kindof UIControl * _Nullable control) {
                    weak_self.switchValueChanged((UISwitch *)control);
                })
                .addOn(_controlView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(_controlView).offset(JobsWidth(74));
                    make.centerY.equalTo(_controlView);
                });
        });
    };return _brushSwitch;
}

-(UIButton *)clearButton{
    if (!_clearButton) {
        @jobs_weakify(self)
        _clearButton = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(@"清除".jobsTr())
                .jobsResetBtnTitleCor(JobsLabelColor)
                .jobsResetBtnTitleFont(UIFontWeightRegularSize(14))
                .jobsResetBtnBgCor(HEXCOLOR(0xEEF2F7))
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    weak_self.clearBrush();
                })
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(7))
                        .byMasksToBounds(YES);
                })
                .addOn(_controlView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.right.equalTo(_controlView).offset(-JobsWidth(14));
                    make.centerY.equalTo(_controlView);
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(74), JobsWidth(34)));
                });
        });
    };return _clearButton;
}

-(NSMutableArray<NSValue *> *)brushPointValueMutArr{
    if (!_brushPointValueMutArr) {
        _brushPointValueMutArr = NSMutableArray.array;
    };return _brushPointValueMutArr;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsMosaicBrushDemoVC
-(JobsRetJobsMosaicBrushDemoVCByBOOLBlock _Nonnull)byHasEdited{
    @jobs_weakify(self)
    return ^__kindof JobsMosaicBrushDemoVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setHasEdited:data];
        return self;
    };
}

-(JobsRetJobsMosaicBrushDemoVCByCGFloatBlock _Nonnull)byBrushDiameter{
    @jobs_weakify(self)
    return ^__kindof JobsMosaicBrushDemoVC * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setBrushDiameter:data];
        return self;
    };
}

-(JobsRetJobsMosaicBrushDemoVCByUIImageBlock _Nonnull)byMosaicImage{
    @jobs_weakify(self)
    return ^__kindof JobsMosaicBrushDemoVC * _Nullable(UIImage * _Nullable data){
        @jobs_strongify(self)
        [self setMosaicImage:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsMosaicBrushDemoVC
@end
