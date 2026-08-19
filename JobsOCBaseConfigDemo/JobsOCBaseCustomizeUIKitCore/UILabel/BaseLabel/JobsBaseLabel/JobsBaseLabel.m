//
//  JobsBaseLabel.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsBaseLabel.h"

#import "NSObject+Extra.h"
#import "UIView+Extra.h"

@interface JobsBaseLabel ()
/// UI
Prop_strong()UIImageView *bgImageView;
Prop_strong()BaseLabel *label;
/// Data
Prop_assign()CGRect thisFrame;

@end

@implementation JobsBaseLabel
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsBaseLabel.class, @selector(jobsDestroySingleton)))(self, @selector(jobsDestroySingleton));
    if (action) action();
}

+(jobsByVoidBlock _Nonnull)jobsDestroySingleton{
    return ^{
        static_baseLabelOnceToken = 0;
        static_baseLabel = nil;
    };
}

static JobsBaseLabel *static_baseLabel = nil;
static dispatch_once_t static_baseLabelOnceToken;
+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsBaseLabel.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id{
        dispatch_once(&static_baseLabelOnceToken, ^{
            static_baseLabel = JobsBaseLabel.new;
        });return static_baseLabel;
    };
}

-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsClearColor);
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.thisFrame = frame;
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsBaseLabel.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsBaseLabel.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
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
#pragma mark —— 一些公有方法
-(JobsRetImageViewByVoidBlock _Nonnull)getBgImageView{
    @jobs_weakify(self)
    return ^UIImageView *{
        @jobs_strongify(self)
        if (!self) return nil;
        return _bgImageView;
    };
}

-(JobsRetLabelByVoidBlock _Nonnull)getLabel{
    @jobs_weakify(self)
    return ^BaseLabel *{
        @jobs_strongify(self)
        if (!self) return nil;
        return _label;
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
        self.byViewModel(model ? : jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {}));
        MakeDataNull
        self.bgImageView.byAlpha(1);
        self.label.byAlpha(1);
    };
}
#pragma mark —— lazyLoad
-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        @jobs_weakify(self)
        _bgImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.addOn(self).byAdd(^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            });
        });
    };return _bgImageView;
}

-(BaseLabel *)label{
    if (!_label) {
        @jobs_weakify(self)
        _label = jobsMakeBaseLabel(^(__kindof BaseLabel * _Nullable label) {
            @jobs_strongify(self)
            label.actionRetIDByGestureRecognizerBlock(^id(UIGestureRecognizer *data) {
                JobsLog(@"JobsBaseLabel的Tap手势");
                return @1;
            });
            label.actionRetIDByGestureRecognizerBlock(^id(UIGestureRecognizer *data) {
                JobsLog(@"JobsBaseLabel的LongPress手势");
                return @1;
            });
            label.addOn(self.bgImageView).byAdd(^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            });
        });
    };return _label;
}

@end
