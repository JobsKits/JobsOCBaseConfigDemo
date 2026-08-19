//
//  JobsTitleView01.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsTitleView01.h"

@interface JobsTitleView01 ()
/// UI
Prop_strong()UILabel *leftLab;
Prop_strong()UILabel *rightLab;
Prop_strong()UILabel *titleLab;
/// Data

@end

@implementation JobsTitleView01
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsTitleView01.class, @selector(jobsDestroySingleton)))(self, @selector(jobsDestroySingleton));
    if (action) action();
}

+(jobsByVoidBlock _Nonnull)jobsDestroySingleton{
    return ^{
        static_titleView01OnceToken = 0;
        static_titleView01 = nil;
    };
}

static JobsTitleView01 *static_titleView01 = nil;
static dispatch_once_t static_titleView01OnceToken;
+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsTitleView01.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id{
        dispatch_once(&static_titleView01OnceToken, ^{
            static_titleView01 = JobsTitleView01.new;
        });return static_titleView01;
    };
}

-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsSecondarySystemBackgroundColor);
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    };return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.byBgColor(JobsSecondarySystemBackgroundColor);
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTitleView01.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTitleView01.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
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
        self.leftLab.byAlpha(1);
        self.rightLab.byAlpha(1);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeZero;
    };
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(isNull(self.viewModel.textModel.text) ? @"我是标题".jobsTr() : self.viewModel.textModel.text)
                .byFont([UIFont systemFontOfSize:JobsWidth(12) weight:UIFontWeightRegular])
                .byTextCor(HEXCOLOR(0xAE8330))
                .byTextAlignment(NSTextAlignmentCenter)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.center.equalTo(self);
                })
                .makeLabelByShowingType(UILabelShowingType_03);
        });
    };return _titleLab;
}

-(UILabel *)leftLab{
    if (!_leftLab) {
        @jobs_weakify(self)
        _leftLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byBgColor(HEXCOLOR(0xEEE2C8))
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerY.equalTo(self);
                    make.height.mas_equalTo(JobsWidth(1.5));
                    make.left.equalTo(self).offset(JobsWidth(16));
                    make.right.equalTo(self.titleLab.mas_left).offset(JobsWidth(-30));
                });
        });
    };return _leftLab;
}

-(UILabel *)rightLab{
    if (!_rightLab) {
        @jobs_weakify(self)
        _rightLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byBgColor(HEXCOLOR(0xEEE2C8))
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerY.equalTo(self);
                    make.height.mas_equalTo(JobsWidth(1.5));
                    make.right.equalTo(self).offset(JobsWidth(-16));
                    make.left.equalTo(self.titleLab.mas_right).offset(JobsWidth(30));
                });
        });
    };return _rightLab;
}

@end
