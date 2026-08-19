//
//  JobsProgressVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsProgressVC.h"

@interface JobsProgressVC ()

Prop_strong()PHCycleView *progressView;

@end

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN PHCycleView
@interface PHCycleView (JobsLocalPropertyDSLAutogen_3c99b98136)
-(JobsRetPHCycleViewByNSStringBlock _Nonnull)byDescribeStr;
-(JobsRetPHCycleViewByUIColorBlock _Nonnull)byDescribeTextColor;
-(JobsRetPHCycleViewByUIColorBlock _Nonnull)byOutLayerColor;
-(JobsRetPHCycleViewByUIColorBlock _Nonnull)byProgressColor;
-(JobsRetPHCycleViewByUIColorBlock _Nonnull)byProgressTextColor;
-(JobsRetPHCycleViewByUIFontBlock _Nonnull)byDescribeFont;
-(JobsRetPHCycleViewByUIFontBlock _Nonnull)byProgressFont;
-(void)setDescribeFont:(UIFont * _Nullable)data;
-(void)setDescribeStr:(NSString * _Nullable)data;
-(void)setDescribeTextColor:(UIColor * _Nullable)data;
-(void)setOutLayerColor:(UIColor * _Nullable)data;
-(void)setProgressColor:(UIColor * _Nullable)data;
-(void)setProgressFont:(UIFont * _Nullable)data;
-(void)setProgressTextColor:(UIColor * _Nullable)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END PHCycleView

@implementation JobsProgressVC
- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsProgressVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        if ([self.requestParams isKindOfClass:UIViewModel.class]) {
            self.byViewModel((UIViewModel *)self.requestParams);
            if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byTextCor(JobsLabelColor)
                    .byText(data.attributedTitle.string)
                    .byFont(UIFontWeightRegularSize(16));
            })
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            //    self.viewModel.bgImage = @"启动页SLOGAN".img;
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsProgressVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.makeNavByAlpha(1);
        self.progressView.byAlpha(1);
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsProgressVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsProgressVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsProgressVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
    };
}
#pragma mark —— lazyLoad
-(PHCycleView *)progressView{
    if (!_progressView) {
        _progressView = [PHCycleView.alloc initWithFrame:CGRectMake(0, 0, 130, 130)];
        _progressView.byCenter(self.view.center.x, self.view.center.y);
        _progressView.byBgColor([UIColor clearColor]);
        _progressView.byProgressColor([UIColor blueColor]);
        _progressView.byProgressFont(UIFontSystemFontOfSize(30));
        _progressView.addOn(self.view);
        [_progressView updateProgress:50];
        [_progressView setLinePreAngle:15 lineSize:CGSizeMake(3, 10) color:[UIColor redColor]];
        _progressView.byDescribeFont(UIFontSystemFontOfSize(12));
        _progressView.byDescribeStr(@"历史最高分");
        _progressView.byProgressTextColor([UIColor blackColor]);
        _progressView.byDescribeTextColor([UIColor blackColor]);
        /// 历史 blue = 255 超出 UIKit 归一化范围，最终夹取为 1。
        _progressView.byOutLayerColor(RGBA_COLOR(0, 0, 255, 0.3));
    };return _progressView;
}

@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN PHCycleView
@implementation PHCycleView (JobsLocalPropertyDSLAutogen_3c99b98136)
-(JobsRetPHCycleViewByNSStringBlock _Nonnull)byDescribeStr{
    @jobs_weakify(self)
    return ^__kindof PHCycleView * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setDescribeStr:data];
        return self;
    };
}

-(JobsRetPHCycleViewByUIColorBlock _Nonnull)byDescribeTextColor{
    @jobs_weakify(self)
    return ^__kindof PHCycleView * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setDescribeTextColor:data];
        return self;
    };
}

-(JobsRetPHCycleViewByUIColorBlock _Nonnull)byOutLayerColor{
    @jobs_weakify(self)
    return ^__kindof PHCycleView * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setOutLayerColor:data];
        return self;
    };
}

-(JobsRetPHCycleViewByUIColorBlock _Nonnull)byProgressColor{
    @jobs_weakify(self)
    return ^__kindof PHCycleView * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setProgressColor:data];
        return self;
    };
}

-(JobsRetPHCycleViewByUIColorBlock _Nonnull)byProgressTextColor{
    @jobs_weakify(self)
    return ^__kindof PHCycleView * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setProgressTextColor:data];
        return self;
    };
}

-(JobsRetPHCycleViewByUIFontBlock _Nonnull)byDescribeFont{
    @jobs_weakify(self)
    return ^__kindof PHCycleView * _Nullable(UIFont * _Nullable data){
        @jobs_strongify(self)
        [self setDescribeFont:data];
        return self;
    };
}

-(JobsRetPHCycleViewByUIFontBlock _Nonnull)byProgressFont{
    @jobs_weakify(self)
    return ^__kindof PHCycleView * _Nullable(UIFont * _Nullable data){
        @jobs_strongify(self)
        [self setProgressFont:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END PHCycleView
