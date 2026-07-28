//
//  CustomBtnDemoBaseVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "CustomBtnDemoBaseVC.h"

@interface CustomBtnDemoBaseVC ()

Prop_strong()UILabel *titleLab;
Prop_strong()UILabel *subTitleLab;
Prop_strong()UIView *previewView;
Prop_strong()UIButton *demoBtn;

@end

@implementation CustomBtnDemoBaseVC
@synthesize titleLab = _titleLab;
@synthesize subTitleLab = _subTitleLab;
@synthesize previewView = _previewView;
@synthesize demoBtn = _demoBtn;

- (void)dealloc{
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
            data
                .byTextCor(JobsLabelColor)
                .byText(self.demoTitle)
                .byFont(UIFontWeightRegularSize(16));
        })
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(JobsSystemBackgroundColor);
    self.makeNavByAlpha(1);
    self.titleLab.byAlpha(1);
    self.subTitleLab.byAlpha(1);
    self.previewView.byAlpha(1);
    self.demoBtn.byAlpha(1);
}
#pragma mark —— Demo
-(NSString *)demoTitle{
    return @"UIButton子控件的排布".tr;
}

-(NSString *)demoSubTitle{
    return @"单个页面只展示当前这一种 image/title 排布效果".tr;
}

-(NSDirectionalRectEdge)imagePlacement{
    return NSDirectionalRectEdgeLeading;
}
#pragma mark —— LazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(self.demoTitle)
                .byFont(UIFontWeightSemiboldSize(JobsWidth(18)))
                .byTextCor(JobsLabelColor)
                .byNumberOfLines(0)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(24));
                    make.left.equalTo(self.view).offset(JobsWidth(24));
                    make.right.equalTo(self.view).offset(-JobsWidth(24));
                });
        });
    };return _titleLab;
}

-(UILabel *)subTitleLab{
    if (!_subTitleLab) {
        @jobs_weakify(self)
        _subTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(self.demoSubTitle)
                .byFont(UIFontWeightRegularSize(JobsWidth(13)))
                .byTextCor(JobsSecondaryLabelColor)
                .byNumberOfLines(0)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(8));
                    make.left.right.equalTo(self.titleLab);
                });
        });
    };return _subTitleLab;
}

-(UIView *)previewView{
    if (!_previewView) {
        @jobs_weakify(self)
        _previewView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.subTitleLab.mas_bottom).offset(JobsWidth(28));
                    make.left.equalTo(self.view).offset(JobsWidth(24));
                    make.right.equalTo(self.view).offset(-JobsWidth(24));
                    make.height.mas_equalTo(JobsWidth(220));
                });
            view.layer.byCornerRadius(JobsWidth(8));
            view.layer.byMasksToBounds(YES);
        });
    };return _previewView;
}

-(UIButton *)demoBtn{
    if (!_demoBtn) {
        @jobs_weakify(self)
        _demoBtn = UIButton.jobsInit()
            .jobsResetBtnTitle(self.demoTitle)
            .jobsResetBtnImage(@"Lock".img)
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(14))
            .byImageView(^(UIImageView *imageView) {
                imageView.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable model) {
                    model
                        .byJobsWidth(1)
                        .byLayerCor(HEXCOLOR(0xEEE2C8))
                        .byCornerRadiusValue(1);
                }));
            })
            .makeBtnTitleByShowingType(UILabelShowingType_03)
            .jobsResetImagePlacement_Padding(self.imagePlacement,JobsWidth(8))
            .byBgColor(JobsCyanColor)
            .addOn(self.previewView)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.center.equalTo(self.previewView);
                make.left.greaterThanOrEqualTo(self.previewView).offset(JobsWidth(16));
                make.right.lessThanOrEqualTo(self.previewView).offset(-JobsWidth(16));
                make.height.mas_equalTo(JobsWidth(50));
            });
    };return _demoBtn;
}

@end
