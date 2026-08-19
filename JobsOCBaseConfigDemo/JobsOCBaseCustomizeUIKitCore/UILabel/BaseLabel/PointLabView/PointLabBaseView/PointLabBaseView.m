//
//  PointLabBaseView.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "PointLabBaseView.h"

#import "NSString+Sys.h"
#import "UIView+Extra.h"
#import "UIView+Refresh.h"

@interface PointLabBaseView ()
/// UI
Prop_strong()UIView *pointView;

@end

@implementation PointLabBaseView
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsSecondarySystemBackgroundColor);
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(PointLabBaseView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(PointLabBaseView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
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
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.byBgColor(JobsSecondarySystemBackgroundColor);
    };return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.pointView.byAlpha(1);
        self.label.byAlpha(1);
    };
}
#pragma mark —— 一些公有方法
-(jobsByCGFloatBlock _Nonnull)updatePointViewPositionWithOffsetY{
    @jobs_weakify(self)
    return ^(CGFloat y){
        @jobs_strongify(self)
        [self.pointView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(y);
        }];self.refresh();
    };
}

-(jobsByCGFloatBlock _Nonnull)updateLabelPositionWithOffsetX{
    @jobs_weakify(self)
    return ^(CGFloat x){
        @jobs_strongify(self)
        [self.label mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.pointView.mas_right).offset(x);
        }];self.refresh();
    };
}
#pragma mark —— lazyLoad
-(UIView *)pointView{
    if(!_pointView){
        @jobs_weakify(self)
        _pointView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(8), JobsWidth(8)));
                    make.left.top.equalTo(self);
                });
        });
    };return _pointView;
}
@synthesize label = _label;
-(UILabel *)label{
    if (!_label) {
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.pointView.mas_right);
                    make.top.bottom.right.equalTo(self);
                });
        });
    };return _label;
}

@end
