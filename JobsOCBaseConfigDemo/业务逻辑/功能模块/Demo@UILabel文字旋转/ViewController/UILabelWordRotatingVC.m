//
//  UILabelWordRotatingVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UILabelWordRotatingVC.h"

@interface UILabelWordRotatingVC ()

Prop_strong()UIView *previewView;
Prop_strong()UILabel *hintLab;

@end

@implementation UILabelWordRotatingVC

-(void)loadView{
    [super loadView];
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byTextCor(HEXCOLOR(0x3D4A58));
            data.byText(@"UILabel文字旋转".tr);
            data.byFont(UIFontWeightRegularSize(18));
        })
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(RGBA_COLOR(255, 238, 221, 1));
    self.makeNavByAlpha(1);
    self.previewView.byAlpha(1);
    self.label.byAlpha(1);
    self.hintLab.byAlpha(1);
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.label.byTextCor(JobsBlueColor).transformLayer(JobsDirectionLeft);
}
#pragma mark —— LazyLoad
-(UIView *)previewView{
    if (!_previewView) {
        @jobs_weakify(self)
        _previewView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view
                .byBgColor(JobsWhiteColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(36));
                    make.left.right.equalTo(self.view).inset(JobsWidth(24));
                    make.height.mas_equalTo(JobsWidth(260));
                });
            view.layer
                .byCornerRadius(JobsWidth(10))
                .byMasksToBounds(YES)
                .byBorderWidth(JobsWidth(1))
                .byBorderColor(RGBA_COLOR(61, 74, 88, 0.12).CGColor);
        });
    };return _previewView;
}

@synthesize label = _label;
-(UILabel *)label{
    if (!_label) {
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
            @jobs_strongify(self)
            label
                .byText(@"输入的内容".tr)
                .byFont(UIFontWeightBoldSize(JobsWidth(22)))
                .byTextCor(JobsBlueColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(1)
                .byBgColor(RGBA_COLOR(239, 246, 255, 1))
                .addOn(self.previewView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.center.equalTo(self.previewView);
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(160), JobsWidth(160)));
                });
            label.layer
                .byCornerRadius(JobsWidth(12))
                .byMasksToBounds(YES)
                .byBorderWidth(JobsWidth(1))
                .byBorderColor(RGBA_COLOR(25, 118, 210, 0.22).CGColor);
        });
    };return _label;
}

-(UILabel *)hintLab{
    if (!_hintLab) {
        @jobs_weakify(self)
        _hintLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(@"文字方向：朝左".tr)
                .byFont(UIFontWeightRegularSize(JobsWidth(13)))
                .byTextCor(HEXCOLOR(0x6E7783))
                .byTextAlignment(NSTextAlignmentCenter)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.previewView.mas_bottom).offset(JobsWidth(16));
                    make.left.right.equalTo(self.previewView);
                });
        });
    };return _hintLab;
}

@end
