//
//  JobsFiltrationView.m
//  JobsFiltrationView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsFiltrationView.h"
#import <JobsFiltrationView/NSMutableArray+Extra.h>
#import <JobsFiltrationView/UIView+Extra.h>

@interface JobsFiltrationView ()
/// UI
Prop_strong()JobsHotLabelByMultiLine *hotLabel;

@end

@implementation JobsFiltrationView
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_filtrationViewOnceToken = 0;
    static_filtrationView = nil;
}

static JobsFiltrationView *static_filtrationView = nil;
static dispatch_once_t static_filtrationViewOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_filtrationViewOnceToken, ^{
        static_filtrationView = JobsFiltrationView.new;
    });return static_filtrationView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsWhiteColor);

    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.byBgColor(JobsWhiteColor);

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
        self.viewModel = model;
        MakeDataNull
        self.hotLabel.byAlpha(1);

    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(134));
    };
}
#pragma mark —— lazyLoad
-(JobsHotLabelByMultiLine *)hotLabel{
    if (!_hotLabel) {
        _hotLabel = JobsHotLabelByMultiLine.JobsRichViewByModel(jobsMakeViewModel(^(JobsHotLabelWithMultiLineModel * _Nullable data) {
            data.bgCor = HEXCOLOR(0xFDFCF9);
            data.footerViewModel = jobsMakeViewModel(^(JobsHeaderFooterViewModel * _Nullable data) {
                data.byUseFooterView(NO);
                data.textModel.byText(@"查看详情".tr)
                              .byTextAlignment(NSTextAlignmentLeft)
                              .byTextCor(HEXCOLOR(0x3D4A58))
                              .byFont(UIFontWeightBoldSize(14));
                data.byBgCor(HEXCOLOR(0xFDFCF9))
                    .byJobsSize(CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(20)));
            });
            data.viewModels = jobsMakeMutArr(^(__kindof NSMutableArray<NSString *> * _Nullable data) {
                for (NSString *str in jobsMakeMutArr(^(__kindof NSMutableArray<NSString *> * _Nullable arr) {
                    arr.add(@"全部".tr)
                    .add(@"充值".tr)
                    .add(@"取款".tr)
                    .add(@"转账".tr)
                    .add(@"返水".tr)
                    .add((@"会员活动".tr))
                    .add(@"VIP福利".tr)
                    .add(@"其他".tr);
                })) {
                    data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable vm) {
                        vm.textModel.byText(str)
                                    .byFont(UIFontWeightRegularSize(12))
                                    .byTextCor(HEXCOLOR(0x757575));
                        vm.byBgCor(HEXCOLOR(0xF3F3F3))
                          .byJobsSize(CGSizeMake(JobsWidth(80), JobsWidth(30)));
                    }));
                }
            });
            data.headerViewModel = jobsMakeViewModel(^(JobsHeaderFooterViewModel * _Nullable data) {
                data.byUseHeaderView(YES);
                data.textModel.byText(@"交易类型".tr)
                              .byTextCor(HEXCOLOR(0x3D4A58))
                              .byFont(UIFontWeightBoldSize(14))
                              .byTextAlignment(NSTextAlignmentLeft);
                data.byBgCor(HEXCOLOR(0xFDFCF9))
                    .byJobsSize(CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(20)));
            });
        }))
        .JobsBlock1(^(id _Nullable data) {
            
        });

        _hotLabel.byAddTo(self, ^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        });
    };return _hotLabel;
}

@end
