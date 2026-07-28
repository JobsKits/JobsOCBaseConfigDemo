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
    [super loadView];
    self.viewModel
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data
                .byText(@"CoreMotion DSL Demo".tr)
                .byFont(UIFontWeightRegularSize(18));
        })
        .byBgCor(HEXCOLOR(0xF5F7FA))
        .byNavBgCor(HEXCOLOR(0xF5F7FA));
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.byBgColor(JobsSystemBackgroundColor);
    self.statusLab.byHidden(NO);
    [self startGyroscope];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.motionManager) self.motionManager.byStopAllUpdates();
}

-(void)startGyroscope{
    CMMotionManager *manager = CMMotionManager.byMotionManager();
    if (!manager.gyroAvailable) {
        self.statusLab.byText(@"当前设备不支持陀螺仪；请使用真机运行。".tr);
        return;
    }
    @jobs_weakify(self)
    self.motionManager = manager
        .byGyroUpdateInterval(1.0 / 30.0)
        .byStartGyroUpdatesToQueue(NSOperationQueue.mainQueue, ^(CMGyroData * _Nullable data, NSError * _Nullable error) {
            @jobs_strongify(self)
            if (error) {
                self.statusLab.byText(error.localizedDescription.tr);
                return;
            }
            if (!data) return;
            CMRotationRate rate = data.rotationRate;
            self.statusLab.byText(([NSString stringWithFormat:@"一链式陀螺仪监听\n\nx: %.4f\ny: %.4f\nz: %.4f",rate.x,rate.y,rate.z]).tr);
        });
}

-(UILabel *)statusLab{
    if (!_statusLab) {
        _statusLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"正在等待陀螺仪数据…".tr)
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
