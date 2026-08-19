//
//  JobsCoreMotionDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#import "JobsCoreMotionDemoVC.h"

@interface JobsCoreMotionDemoVC ()

Prop_strong()CMMotionManager *motionManager;
Prop_strong()UILabel *statusLab;

@end

@implementation JobsCoreMotionDemoVC

-(void)dealloc{
    if (self.motionManager) self.motionManager.byStopAllUpdates();
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCoreMotionDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.viewModel
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byText(@"CoreMotion DSL Demo".jobsTr())
                    .byFont(UIFontWeightRegularSize(18));
            })
            .byBgCor(HEXCOLOR(0xF5F7FA))
            .byNavBgCor(HEXCOLOR(0xF5F7FA));
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCoreMotionDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.makeNavByAlpha(1);
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.statusLab.byHidden(NO);
        self.startGyroscope();
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCoreMotionDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        if (self.motionManager) self.motionManager.byStopAllUpdates();
    };
}

-(jobsByVoidBlock _Nonnull)startGyroscope{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CMMotionManager *manager = CMMotionManager.byMotionManager();
        if (!manager.gyroAvailable) {
            self.statusLab.byText(@"当前设备不支持陀螺仪；请使用真机运行。".jobsTr());
            return;
        }
        @jobs_weakify(self)
        self.motionManager = manager
            .byGyroUpdateInterval(1.0 / 30.0)
            .byStartGyroUpdatesToQueue(NSOperationQueue.mainQueue, ^(CMGyroData * _Nullable data, NSError * _Nullable error) {
                @jobs_strongify(self)
                if (error) {
                    self.statusLab.byText(error.localizedDescription.jobsTr());
                    return;
                }
                if (!data) return;
                CMRotationRate rate = data.rotationRate;
                self.statusLab.byText(([NSString stringWithFormat:@"一链式陀螺仪监听\n\nx: %.4f\ny: %.4f\nz: %.4f",rate.x,rate.y,rate.z]).jobsTr());
            });
    };
}

-(UILabel *)statusLab{
    if (!_statusLab) {
        _statusLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"正在等待陀螺仪数据…".jobsTr())
                .byFont(UIFontMonospacedDigitSystemWeightMediumSize(17))
                .byTextCor(JobsLabelColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(0)
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self.view).inset(JobsWidth(20));
                    make.centerY.equalTo(self.view);
                    make.height.mas_equalTo(JobsWidth(220));
                });
        });
    };return _statusLab;
}

@end
