//
//  JobsCustomView.m
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsCustomView.h"
#import <JobsCustomView/NSObject+Extra.h>
#import <JobsCustomView/NSMutableArray+Extra.h>
#import <JobsCustomView/UIButton+SimplyMake.h>
#import <JobsCustomView/UIButton+UI.h>
#import <JobsCustomView/UIColor+Extra.h>
#import <JobsCustomView/UIView+Extra.h>

@interface JobsCustomView ()
/// UI
Prop_strong()UIImageView *indicatorIMGV;
Prop_strong()UILabel *tipsLab;
Prop_strong()UIButton *cancelBtn;
Prop_strong()UIButton *sureBtn;
Prop_strong()BaseView *containFromView;/// fromDatePickerView的承接视图
Prop_strong()BaseView *containToView;/// toDatePickerView的承接视图
Prop_strong()BRDatePickerView *fromDatePickerView;
Prop_strong()BRDatePickerView *toDatePickerView;
Prop_strong()UILabel *segmentationLine;
Prop_assign()CGSize btnSize;
/// Data

@end

@implementation JobsCustomView
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_customViewOnceToken = 0;
    static_customView = nil;
}

static JobsCustomView *static_customView = nil;
static dispatch_once_t static_customViewOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_customViewOnceToken, ^{
        static_customView = JobsCustomView.new;
    });return static_customView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsWhiteColor);
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.byBgColor(JobsRedColor);
    };return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.byBgColor(JobsWhiteColor);
    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.btnSize = CGSizeMake(JobsWidth(160), JobsWidth(40));
        self.viewModel = model;
        MakeDataNull
        self.indicatorIMGV.byAlpha(1);
        self.segmentationLine.byAlpha(1);
        [self.fromDatePickerView addPickerToView:self.containFromView];
        [self.toDatePickerView addPickerToView:self.containToView];
        self.tipsLab.byAlpha(1);
        self.cancelBtn.byAlpha(1);
        self.sureBtn.byAlpha(1);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(100 + 28 + 199));
    };
}
#pragma mark —— lazyLoad
-(UIImageView *)indicatorIMGV{
    if (!_indicatorIMGV) {
        @jobs_weakify(self)
        _indicatorIMGV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView
                .byImage(@"起止".img)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(56), JobsWidth(196)));
                    make.left.equalTo(self).offset(JobsWidth(16));
                    make.top.equalTo(self).offset(JobsWidth(27));
                });
        });
    };return _indicatorIMGV;
}

-(UILabel *)segmentationLine{
    if (!_segmentationLine) {
        @jobs_weakify(self)
        _segmentationLine = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byBgColor(HEXCOLOR(0xEAEBED))
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerY.equalTo(self.indicatorIMGV);
                    make.right.equalTo(self).offset(-JobsWidth(16));
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(263), JobsWidth(1)));
                });
        });
    };return _segmentationLine;
}

-(BaseView *)containFromView{
    if (!_containFromView) {
        @jobs_weakify(self)
        _containFromView = jobsMakeBaseView(^(__kindof BaseView * _Nullable view) {
            @jobs_strongify(self)
            view
                .byBgColor(JobsRandomColor)
                .byFrame(CGRectMake(JobsWidth(100),
                                    JobsWidth(44),
                                    JobsWidth(263),
                                    JobsWidth(196 / 2)))
                .addOn(self);
            // view.byAutoresizingMask(UIViewAutoresizingFlexibleWidth);
        });
    };return _containFromView;
}

-(BaseView *)containToView{
    if (!_containToView) {
        @jobs_weakify(self)
        _containToView = jobsMakeBaseView(^(__kindof BaseView * _Nullable view) {
            @jobs_strongify(self)
            view
                .byBgColor(JobsRandomColor)
                .byFrame(CGRectMake(JobsWidth(100),
                                    JobsWidth(44 + 196 / 2),
                                    JobsWidth(263),
                                    JobsWidth(196 / 2)))
                .addOn(self);
            // view.byAutoresizingMask(UIViewAutoresizingFlexibleWidth);
        });
    };return _containToView;
}

-(BRDatePickerView *)fromDatePickerView{
    if (!_fromDatePickerView) {
        _fromDatePickerView = self.makeDatePickerView(nil);
    };return _fromDatePickerView;
}

-(BRDatePickerView *)toDatePickerView{
    if (!_toDatePickerView) {
        _toDatePickerView = self.makeDatePickerView(nil);
    };return _toDatePickerView;
}

-(UILabel *)tipsLab{
    if (!_tipsLab) {
        @jobs_weakify(self)
        _tipsLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(@"當前支持查詢最近30天的投注記錄".tr)
                .byFont(UIFontWeightRegularSize(12))
                .byTextCor(HEXCOLOR(0x757575))
                .makeLabelByShowingType(UILabelShowingType_03)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.indicatorIMGV.mas_bottom).offset(JobsWidth(20));
                    make.left.equalTo(self).offset(JobsWidth(19));
                });
        });
    };return _tipsLab;
}

-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        @jobs_weakify(self)
        _cancelBtn = UIButton.jobsInit()
            .bgColorBy([UIColor gradientCorDataMutArr:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
                arr
                    .add(HEXCOLOR(0xE7E7E7))
                    .add(HEXCOLOR(0xDDDADA));
            })
                                           startPoint:CGPointZero
                                             endPoint:CGPointZero
                                               opaque:NO
                                       targetViewRect:CGRectMake(0,
                                                                 0,
                                                                 self.btnSize.width,
                                                                 self.btnSize.height)])
            .jobsResetBtnTitle(@"取消".tr)
            .jobsResetBtnTitleCor(HEXCOLOR(0xB0B0B0))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                x.byToggleSelected();
                toastBy(x.titleForNormalState);
                if (self.objBlock) self.objBlock(x);
            })
            .onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .byCornerRadius(self.btnSize.height / 2)
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.size.mas_equalTo(self.btnSize);
                make.bottom.equalTo(self).offset(JobsWidth(-16));
                make.left.equalTo(self).offset(JobsWidth(16));
            });
    };return _cancelBtn;
}

-(UIButton *)sureBtn{
    if (!_sureBtn) {
        @jobs_weakify(self)
        _sureBtn = UIButton.jobsInit()
            .bgColorBy([UIColor gradientCorDataMutArr:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
                arr
                    .add(HEXCOLOR(0xF2E4A3))
                    .add(HEXCOLOR(0xF2CC78));
            })
                                           startPoint:CGPointZero
                                             endPoint:CGPointZero
                                               opaque:NO
                                       targetViewRect:CGRectMake(0,
                                                                 0,
                                                                 self.btnSize.width,
                                                                 self.btnSize.height)])
            .jobsResetBtnTitle(@"确定".tr)
            .jobsResetBtnTitleCor(HEXCOLOR(0xB0B0B0))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                x.byToggleSelected();
                toastBy(x.titleForNormalState);
                if (self.objBlock) self.objBlock(x);
            })
            .onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .byCornerRadius(self.btnSize.height / 2)
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.size.mas_equalTo(self.btnSize);
                make.bottom.equalTo(self).offset(JobsWidth(-16));
                make.right.equalTo(self).offset(JobsWidth(-16));
            });
    };return _sureBtn;
}

@end
