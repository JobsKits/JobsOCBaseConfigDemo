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

-(void)switchValueChanged:(UISwitch *)sender;
-(void)clearBrush;
-(void)renderBrushImage;

@end

@implementation JobsMosaicBrushDemoVC
-(NSString *)pageTitle{
    return @"手势涂抹马赛克".tr;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.imageView.brushDelegate = self;
    self.imageView.brushEnabled = YES;
    self.brushDiameter = 42;
    self.controlView.byAlpha(1);
    [self showStatus:@"手指在图片上拖动即可局部打码".tr
    hiddenAfterDelay:YES];
}

-(void)onImageLoaded:(UIImage *)image{
    [super onImageLoaded:image];
    self.mosaicImage = [self.originalImage jobs_mosaicPixelatedImageWithBlockSize:18];
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
    [self renderBrushImage];
}
#pragma mark —— Action
-(void)switchValueChanged:(UISwitch *)sender{
    self.imageView.brushEnabled = sender.isOn;
    [self showStatus:sender.isOn ? @"已开启涂抹".tr : @"已暂停涂抹".tr
    hiddenAfterDelay:YES];
}

-(void)clearBrush{
    [self.brushPointValueMutArr removeAllObjects];
    self.imageView.byImage(self.originalImage);
    self.hasEdited = NO;
    [self showStatus:@"已清除涂抹区域".tr
    hiddenAfterDelay:YES];
}

-(void)renderBrushImage{
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
            self.hasEdited = YES;
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
                .byText(@"涂抹".tr)
                .byTextCor(HEXCOLOR(0x3D4A58))
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
                    [weak_self switchValueChanged:(UISwitch *)control];
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
                .jobsResetBtnTitle(@"清除".tr)
                .jobsResetBtnTitleCor(HEXCOLOR(0x3D4A58))
                .jobsResetBtnTitleFont(UIFontWeightRegularSize(14))
                .jobsResetBtnBgCor(HEXCOLOR(0xEEF2F7))
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    [weak_self clearBrush];
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

@end
