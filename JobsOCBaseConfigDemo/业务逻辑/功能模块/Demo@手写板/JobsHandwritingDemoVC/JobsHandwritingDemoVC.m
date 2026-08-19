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

-(jobsByVoidBlock _Nonnull)setupRightBarButtonItems;
-(jobsByVoidBlock _Nonnull)loadSavedCanvas;
-(JobsRetBOOLByBOOLBlock _Nonnull)saveCanvasWithFeedback;
-(jobsByVoidBlock _Nonnull)requestLeavePage;
-(jobsByVoidBlock _Nonnull)showLeaveAlert;
-(jobsByVoidBlock _Nonnull)discardSavedCanvas;
-(jobsByVoidBlock _Nonnull)leavePage;
-(jobsByVoidBlock _Nonnull)restorePopGesture;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsHandwritingDemoVC
@interface JobsHandwritingDemoVC (JobsPropertyDSLSetterAutogen_c713d9ea61)
-(void)setHasUnsavedChanges:(BOOL)data;
-(void)setIsLeaveAlertShowing:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsHandwritingDemoVC

@implementation JobsHandwritingDemoVC
-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsHandwritingDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
            if (self.viewModel.pushOrPresent != ComingStyle_Unknown) {
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byText(@"手写板".jobsTr())
                    .byTextCor(JobsLabelColor)
                    .byFont(UIFontWeightRegularSize(18));
            })
            .byBgCor(HEXCOLOR(0xF4F5F8))
            .byNavBgCor(HEXCOLOR(0xF4F5F8));
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsHandwritingDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.setupRightBarButtonItems();
        self.makeNavByAlpha(1);
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.tipLabel.byAlpha(1);
        self.clearButton.byAlpha(1);
        self.canvasView.byAlpha(1);
        self.loadSavedCanvas();
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsHandwritingDemoVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
        self.clzPopGesture();
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsHandwritingDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        if (self.isMovingFromParentViewController ||
            self.isBeingDismissed ||
            self.navigationController.isBeingDismissed) {
            self.restorePopGesture();
        }
    };
}

-(void)viewDidDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsHandwritingDemoVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidDisappear:animated];
        if (self.isMovingFromParentViewController ||
            self.isBeingDismissed ||
            !self.navigationController) {
            self.restorePopGesture();
        }
    };
}

-(jobsByBtnBlock _Nonnull)backBtnClickEvent{
    @jobs_weakify(self)
    return ^(UIButton *_Nullable sender) {
        @jobs_strongify(self)
        self.requestLeavePage();
    };
}
#pragma mark —— Private
-(jobsByVoidBlock _Nonnull)setupRightBarButtonItems{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byRightBarButtonItems(jobsMakeMutArr(^(__kindof NSMutableArray<UIBarButtonItem *> * _Nullable data) {
            data.add(self.saveButton.bySize(CGSizeMake(JobsWidth(52),
                                                      JobsWidth(32))).barBtnItem());
        }));
    };
}

-(jobsByVoidBlock _Nonnull)loadSavedCanvas{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
        NSData *data = [defaults dataForKey:JobsHandwritingSavedStrokesKey];
        if (!data.length) {
            self.byHasUnsavedChanges(NO);
            return;
        }
        NSError *error = nil;
        id strokes = [NSJSONSerialization JSONObjectWithData:data
                                                     options:0
                                                       error:&error];
        if (error || ![strokes isKindOfClass:NSArray.class]) {
            [defaults removeObjectForKey:JobsHandwritingSavedStrokesKey];
            [defaults synchronize];
            self.byHasUnsavedChanges(NO);
            return;
        }
        self.canvasView.replaceNormalizedStrokes((NSArray *)strokes);
        self.byHasUnsavedChanges(NO);
    };
}

-(JobsRetBOOLByBOOLBlock _Nonnull)saveCanvasWithFeedback{
    @jobs_weakify(self)
    return ^BOOL(BOOL showFeedback){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
        NSArray *strokes = self.canvasView.normalizedStrokes();
        if (strokes.count) {
            NSError *error = nil;
            NSData *data = [NSJSONSerialization dataWithJSONObject:strokes
                                                           options:0
                                                             error:&error];
            if (error || !data.length) {
                @"手写内容保存失败".jobsTr().toast();
                return NO;
            }
            [defaults setObject:data
                        forKey:JobsHandwritingSavedStrokesKey];
        } else {
            [defaults removeObjectForKey:JobsHandwritingSavedStrokesKey];
        }
        [defaults synchronize];
        self.byHasUnsavedChanges(NO);
        if (showFeedback) {
            (strokes.count ? @"手写内容已保存" : @"空白手写板已保存").jobsTr().toast();
        };return YES;
    };
}

-(jobsByVoidBlock _Nonnull)requestLeavePage{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.hasUnsavedChanges) {
            self.leavePage();
            return;
        }
        if (self.isLeaveAlertShowing) return;
        self.showLeaveAlert();
    };
}

-(jobsByVoidBlock _Nonnull)showLeaveAlert{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byLeaveAlertShowing(YES);
        @jobs_weakify(self)
        self.leaveAlertController = JobsMakeAlertControllerBy(jobsMakeAlertModel(^(__kindof JobsAlertModel * _Nullable data) {
            data.byAlertControllerTitle(@"是否保存手写内容？".jobsTr())
                .byMessage(@"选择“不保存”会清除已持久化的笔迹，下次进入显示空白手写板。".jobsTr())
                .byPreferredStyle(UIAlertControllerStyleAlert);
        }));
        self.leaveAlertController.add(JobsMakeAlertActionBy(jobsMakeAlertModel(^(__kindof JobsAlertModel * _Nullable data) {
            data.byCancelAlertActionTitle(@"继续手写".jobsTr())
                .byAlertActionStyle(UIAlertActionStyleCancel);
            data.alertActionBlock = ^(__kindof UIAlertAction * _Nullable action) {
                weak_self.byLeaveAlertShowing(NO);
            };
        })));
        self.leaveAlertController.add(JobsMakeAlertActionBy(jobsMakeAlertModel(^(__kindof JobsAlertModel * _Nullable data) {
            data.byAlertActionTitle(@"不保存".jobsTr())
                .byAlertActionStyle(UIAlertActionStyleDestructive);
            data.alertActionBlock = ^(__kindof UIAlertAction * _Nullable action) {
                @jobs_strongify(self)
                self.byLeaveAlertShowing(NO);
                self.discardSavedCanvas();
                self.leavePage();
            };
        })));
        self.leaveAlertController.add(JobsMakeAlertActionBy(jobsMakeAlertModel(^(__kindof JobsAlertModel * _Nullable data) {
            data.byAlertActionTitle(@"保存并退出".jobsTr())
                .byAlertActionStyle(UIAlertActionStyleDefault);
            data.alertActionBlock = ^(__kindof UIAlertAction * _Nullable action) {
                @jobs_strongify(self)
                self.byLeaveAlertShowing(NO);
                if (self.saveCanvasWithFeedback(NO)) self.leavePage();
            };
        })));
        self.comingToPresentVC(self.leaveAlertController);
    };
}

-(jobsByVoidBlock _Nonnull)discardSavedCanvas{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
        [defaults removeObjectForKey:JobsHandwritingSavedStrokesKey];
        [defaults synchronize];
        self.byHasUnsavedChanges(NO);
    };
}

-(jobsByVoidBlock _Nonnull)leavePage{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.restorePopGesture();
        self.backViewControllerCore(self);
    };
}

-(jobsByVoidBlock _Nonnull)restorePopGesture{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.openPopGestureBy(nil);
    };
}
#pragma mark —— LazyLoad
-(UILabel *)tipLabel{
    if (!_tipLabel) {
        _tipLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"可使用手指或 Apple Pencil 书写；右上角保存后，下次进入会恢复笔迹。".jobsTr())
                .byTextCor(JobsSecondaryLabelColor)
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
        _canvasView = JobsHandwritingCanvasView.new.byContentDidChange(^{
            weak_self.byHasUnsavedChanges(YES);
        });
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
                .jobsResetBtnTitle(@"清空手写板".jobsTr())
                .jobsResetBtnTitleCor(JobsRedColor)
                .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(16))
                .jobsResetBtnBgCor(JobsClearColor)
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    weak_self.canvasView.clearCanvas();
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
                .jobsResetBtnTitle(@"保存".jobsTr())
                .jobsResetBtnTitleCor(HEXCOLOR(0x0A84FF))
                .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(16))
                .jobsResetBtnBgCor(JobsClearColor)
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    weak_self.saveCanvasWithFeedback(YES);
                });
        });
    };return _saveButton;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsHandwritingDemoVC
-(JobsRetJobsHandwritingDemoVCByBOOLBlock _Nonnull)byHasUnsavedChanges{
    @jobs_weakify(self)
    return ^__kindof JobsHandwritingDemoVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setHasUnsavedChanges:data];
        return self;
    };
}

-(JobsRetJobsHandwritingDemoVCByBOOLBlock _Nonnull)byLeaveAlertShowing{
    @jobs_weakify(self)
    return ^__kindof JobsHandwritingDemoVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsLeaveAlertShowing:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsHandwritingDemoVC
@end
