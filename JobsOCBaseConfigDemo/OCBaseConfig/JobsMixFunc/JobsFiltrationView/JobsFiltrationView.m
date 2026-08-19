//
//  JobsFiltrationView.m
//  JobsFiltrationView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsFiltrationView.h"

#import "NSMutableArray+Extra.h"
#import "UIView+Extra.h"

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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsFiltrationView.class, @selector(jobsDestroySingleton)))(self, @selector(jobsDestroySingleton));
    if (action) action();
}

+(jobsByVoidBlock _Nonnull)jobsDestroySingleton{
    return ^{
        static_filtrationViewOnceToken = 0;
        static_filtrationView = nil;
    };
}

static JobsFiltrationView *static_filtrationView = nil;
static dispatch_once_t static_filtrationViewOnceToken;
+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsFiltrationView.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id{
        dispatch_once(&static_filtrationViewOnceToken, ^{
            static_filtrationView = JobsFiltrationView.new;
        });return static_filtrationView;
    };
}

-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsSecondarySystemBackgroundColor);
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.byBgColor(JobsSecondarySystemBackgroundColor);
    };return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.byBgColor(JobsSecondarySystemBackgroundColor);
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsFiltrationView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
    };
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsFiltrationView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
    };
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.byViewModel(model);
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
        JobsHotLabelWithMultiLineModel *model = JobsHotLabelWithMultiLineModel.new;
        model.byBgCor(HEXCOLOR(0xFDFCF9));
        model.footerViewModel = jobsMakeHeaderFooterViewModel(^(JobsHeaderFooterViewModel * _Nullable data) {
            data.byUseFooterView(NO);
            data.textModel.byText(@"查看详情".jobsTr())
                          .byTextAlignment(NSTextAlignmentLeft)
                          .byTextCor(JobsLabelColor)
                          .byFont(UIFontWeightBoldSize(14));
            data.byBgCor(HEXCOLOR(0xFDFCF9))
                .byJobsSize(CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(20)));
        });
        model.viewModels = jobsMakeMutArr(^(__kindof NSMutableArray<UIViewModel *> * _Nullable data) {
            for (NSString *str in jobsMakeMutArr(^(__kindof NSMutableArray<NSString *> * _Nullable arr) {
                arr.add(@"全部".jobsTr())
                .add(@"充值".jobsTr())
                .add(@"取款".jobsTr())
                .add(@"转账".jobsTr())
                .add(@"返水".jobsTr())
                .add((@"会员活动".jobsTr()))
                .add(@"VIP福利".jobsTr())
                .add(@"其他".jobsTr());
            })) {
                data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable vm) {
                    vm.textModel.byText(str)
                                .byFont(UIFontWeightRegularSize(12))
                                .byTextCor(JobsSecondaryLabelColor);
                    vm.byBgCor(HEXCOLOR(0xF3F3F3))
                      .byJobsSize(CGSizeMake(JobsWidth(80), JobsWidth(30)));
                }));
            }
        });
        model.headerViewModel = jobsMakeHeaderFooterViewModel(^(JobsHeaderFooterViewModel * _Nullable data) {
            data.byUseHeaderView(YES);
            data.textModel.byText(@"交易类型".jobsTr())
                          .byTextCor(JobsLabelColor)
                          .byFont(UIFontWeightBoldSize(14))
                          .byTextAlignment(NSTextAlignmentLeft);
            data.byBgCor(HEXCOLOR(0xFDFCF9))
                .byJobsSize(CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(20)));
        });
        _hotLabel = JobsHotLabelByMultiLine.JobsRichViewByModel(model)
        .JobsBlock1(^(id _Nullable data) {;
        });
        _hotLabel.addOn(self).byAdd(^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        });
    };return _hotLabel;
}

@end
