//
//  JobsUserHeaderDataViewForHeaderInSection.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsUserHeaderDataViewForHeaderInSection.h"

@interface JobsUserHeaderDataViewForHeaderInSection ()

Prop_strong()UILabel *titleLab;

@end

@implementation JobsUserHeaderDataViewForHeaderInSection
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsSecondarySystemBackgroundColor);
    };return self;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self == [super initWithReuseIdentifier:reuseIdentifier]){
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsUserHeaderDataViewForHeaderInSection.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsUserHeaderDataViewForHeaderInSection.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
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
        self.byViewModel(model ? : jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {}));
        MakeDataNull
        self.titleLab.byAlpha(1);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)viewHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(46);
    };
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(isNull(self.viewModel.textModel.text) ? @"请设置大标题".jobsTr() : self.viewModel.textModel.text)
            .byTextCor(self.viewModel.textModel.textCor)
            .byFont(UIFontWeightRegularSize(JobsWidth(20)))
            .byTextAlignment(NSTextAlignmentCenter)
            .byBgColor(JobsSecondarySystemBackgroundColor)
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.edges.equalTo(self.contentView);
            });
        });
    };return _titleLab;
}

@end
