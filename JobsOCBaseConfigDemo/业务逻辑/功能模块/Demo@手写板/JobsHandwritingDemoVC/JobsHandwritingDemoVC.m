//
//  JobsHandwritingDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsHandwritingDemoVC.h"

static NSString *const JobsHandwritingSavedStrokesKey = @"com.jobs.handwriting.savedStrokes.v1";

@interface JobsHandwritingDemoVC ()

Prop_strong()UILabel *tipLabel;
Prop_strong()JobsHandwritingCanvasView *canvasView;
Prop_strong()UIButton *clearButton;
Prop_strong()UIButton *saveButton;
Prop_strong(nullable)UIAlertController *leaveAlertController;
Prop_assign()BOOL hasUnsavedChanges;
Prop_assign()BOOL isLeaveAlertShowing;

-(void)setupRightBarButtonItems;
-(void)loadSavedCanvas;
-(BOOL)saveCanvasWithFeedback:(BOOL)showFeedback;
-(void)requestLeavePage;
-(void)showLeaveAlert;
-(void)discardSavedCanvas;
-(void)leavePage;
-(void)restorePopGesture;

@end

@implementation JobsHandwritingDemoVC
-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if (self.viewModel.pushOrPresent != ComingStyle_Unknown) {
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"手写板".tr);
            data.byTextCor(HEXCOLOR(0x263342));
            data.byFont(UIFontWeightRegularSize(18));
        })
        .byBgCor(HEXCOLOR(0xF4F5F8))
        .byNavBgCor(HEXCOLOR(0xF4F5F8));
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self setupRightBarButtonItems];
    self.makeNavByAlpha(1);
    self.view.byBgColor(HEXCOLOR(0xF4F5F8));
    self.tipLabel.byAlpha(1);
    self.clearButton.byAlpha(1);
    self.canvasView.byAlpha(1);
    [self loadSavedCanvas];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.clzPopGesture();
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.isMovingFromParentViewController ||
        self.isBeingDismissed ||
        self.navigationController.isBeingDismissed) {
        [self restorePopGesture];
    }
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if (self.isMovingFromParentViewController ||
        self.isBeingDismissed ||
        !self.navigationController) {
        [self restorePopGesture];
    }
}

-(jobsByBtnBlock _Nonnull)backBtnClickEvent{
    @jobs_weakify(self)
    return ^(UIButton *_Nullable sender) {
        @jobs_strongify(self)
        [self requestLeavePage];
    };
}
#pragma mark —— Private
-(void)setupRightBarButtonItems{
    self.rightBarButtonItems = jobsMakeMutArr(^(__kindof NSMutableArray<UIBarButtonItem *> * _Nullable data) {
        data.add(self.saveButton.bySize(CGSizeMake(JobsWidth(52),
                                                  JobsWidth(32))).barBtnItem);
    });
}

-(void)loadSavedCanvas{
    NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
    NSData *data = [defaults dataForKey:JobsHandwritingSavedStrokesKey];
    if (!data.length) {
        self.hasUnsavedChanges = NO;
        return;
    }
    NSError *error = nil;
    id strokes = [NSJSONSerialization JSONObjectWithData:data
                                                 options:0
                                                   error:&error];
    if (error || ![strokes isKindOfClass:NSArray.class]) {
        [defaults removeObjectForKey:JobsHandwritingSavedStrokesKey];
        [defaults synchronize];
        self.hasUnsavedChanges = NO;
        return;
    }
    [self.canvasView replaceNormalizedStrokes:(NSArray *)strokes];
    self.hasUnsavedChanges = NO;
}

-(BOOL)saveCanvasWithFeedback:(BOOL)showFeedback{
    NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
    NSArray *strokes = self.canvasView.normalizedStrokes;
    if (strokes.count) {
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:strokes
                                                       options:0
                                                         error:&error];
        if (error || !data.length) {
            @"手写内容保存失败".tr.toast();
            return NO;
        }
        [defaults setObject:data
                    forKey:JobsHandwritingSavedStrokesKey];
    } else {
        [defaults removeObjectForKey:JobsHandwritingSavedStrokesKey];
    }
    [defaults synchronize];
    self.hasUnsavedChanges = NO;
    if (showFeedback) {
        (strokes.count ? @"手写内容已保存" : @"空白手写板已保存").tr.toast();
    };return YES;
}

-(void)requestLeavePage{
    if (!self.hasUnsavedChanges) {
        [self leavePage];
        return;
    }
    if (self.isLeaveAlertShowing) return;
    [self showLeaveAlert];
}

-(void)showLeaveAlert{
    self.isLeaveAlertShowing = YES;
    @jobs_weakify(self)
    self.leaveAlertController = JobsMakeAlertControllerBy(jobsMakeAlertModel(^(__kindof JobsAlertModel * _Nullable data) {
        data.byAlertControllerTitle(@"是否保存手写内容？".tr)
            .byMessage(@"选择“不保存”会清除已持久化的笔迹，下次进入显示空白手写板。".tr)
            .byPreferredStyle(UIAlertControllerStyleAlert);
    }));
    self.leaveAlertController.add(JobsMakeAlertActionBy(jobsMakeAlertModel(^(__kindof JobsAlertModel * _Nullable data) {
        data.byCancelAlertActionTitle(@"继续手写".tr)
            .byAlertActionStyle(UIAlertActionStyleCancel);
        data.alertActionBlock = ^(__kindof UIAlertAction * _Nullable action) {
            weak_self.isLeaveAlertShowing = NO;
        };
    })));
    self.leaveAlertController.add(JobsMakeAlertActionBy(jobsMakeAlertModel(^(__kindof JobsAlertModel * _Nullable data) {
        data.byAlertActionTitle(@"不保存".tr)
            .byAlertActionStyle(UIAlertActionStyleDestructive);
        data.alertActionBlock = ^(__kindof UIAlertAction * _Nullable action) {
            @jobs_strongify(self)
            self.isLeaveAlertShowing = NO;
            [self discardSavedCanvas];
            [self leavePage];
        };
    })));
    self.leaveAlertController.add(JobsMakeAlertActionBy(jobsMakeAlertModel(^(__kindof JobsAlertModel * _Nullable data) {
        data.byAlertActionTitle(@"保存并退出".tr)
            .byAlertActionStyle(UIAlertActionStyleDefault);
        data.alertActionBlock = ^(__kindof UIAlertAction * _Nullable action) {
            @jobs_strongify(self)
            self.isLeaveAlertShowing = NO;
            if ([self saveCanvasWithFeedback:NO]) [self leavePage];
        };
    })));
    self.comingToPresentVC(self.leaveAlertController);
}

-(void)discardSavedCanvas{
    NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
    [defaults removeObjectForKey:JobsHandwritingSavedStrokesKey];
    [defaults synchronize];
    self.hasUnsavedChanges = NO;
}

-(void)leavePage{
    [self restorePopGesture];
    self.backViewControllerCore(self);
}

-(void)restorePopGesture{
    self.openPopGestureBy(nil);
}
#pragma mark —— LazyLoad
-(UILabel *)tipLabel{
    if (!_tipLabel) {
        _tipLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"可使用手指或 Apple Pencil 书写；右上角保存后，下次进入会恢复笔迹。".tr)
                .byTextCor(HEXCOLOR(0x667180))
                .byFont(UIFontWeightRegularSize(14))
                .byNumberOfLines(0)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(16));
                    make.left.right.equalTo(self.view).inset(JobsWidth(20));
                });
        });
    };return _tipLabel;
}

-(JobsHandwritingCanvasView *)canvasView{
    if (!_canvasView) {
        @jobs_weakify(self)
        _canvasView = [JobsHandwritingCanvasView.new byContentDidChange:^{
            weak_self.hasUnsavedChanges = YES;
        }];
        _canvasView
            .byBgColor(JobsWhiteColor)
            .byLayer(^(__kindof CALayer * _Nullable layer) {
                layer
                    .byCornerRadius(JobsWidth(16))
                    .byBorderColorUIColor(HEXCOLOR(0xD6DCE5))
                    .byBorderWidth(JobsWidth(1))
                    .byMasksToBounds(YES);
            })
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.tipLabel.mas_bottom).offset(JobsWidth(16));
                make.left.right.equalTo(self.view).inset(JobsWidth(20));
                make.bottom.equalTo(self.clearButton.mas_top).offset(-JobsWidth(12));
            });
    };return _canvasView;
}

-(UIButton *)clearButton{
    if (!_clearButton) {
        @jobs_weakify(self)
        _clearButton = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(@"清空手写板".tr)
                .jobsResetBtnTitleCor(JobsRedColor)
                .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(16))
                .jobsResetBtnBgCor(JobsClearColor)
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    [weak_self.canvasView clearCanvas];
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self.view);
                    make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-JobsWidth(12));
                    make.height.mas_equalTo(JobsWidth(44));
                });
        });
    };return _clearButton;
}

-(UIButton *)saveButton{
    if (!_saveButton) {
        @jobs_weakify(self)
        _saveButton = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(@"保存".tr)
                .jobsResetBtnTitleCor(HEXCOLOR(0x0A84FF))
                .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(16))
                .jobsResetBtnBgCor(JobsClearColor)
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    [weak_self saveCanvasWithFeedback:YES];
                });
        });
    };return _saveButton;
}

@end
