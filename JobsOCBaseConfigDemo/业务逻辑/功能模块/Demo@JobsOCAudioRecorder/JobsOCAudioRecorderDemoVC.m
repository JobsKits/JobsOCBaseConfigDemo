//
//  JobsOCAudioRecorderDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月14日，星期二.
//

#import "JobsOCAudioRecorderDemoVC.h"

@interface JobsOCAudioRecorderDemoVC ()

Prop_strong()UIView *settingsCard;
Prop_strong()UISegmentedControl *modeControl;
Prop_strong()UILabel *durationTitleLabel;
Prop_strong()UIView *durationSpacer;
Prop_strong()UILabel *durationUnitLabel;
Prop_strong()UIStackView *durationRow;
Prop_strong()UITextField *durationField;
Prop_strong()UILabel *hintLabel;
Prop_strong()UIStackView *settingsStack;
Prop_strong()UILabel *listTitleLabel;
Prop_strong()UIView *capturePanel;
Prop_strong()UILabel *captureHintLabel;
Prop_strong()JobsOCAudioRecordButton *recordButton;
Prop_strong()UIView *longButtonOuterRingView;
Prop_strong()UIButton *longButton;
Prop_strong()UITableView *tableView;
Prop_strong()UIAlertController *messageAlertController;
Prop_copy()NSArray<JobsOCAudioRecording *> *recordings;
Prop_assign()BOOL permissionGranted;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCAudioRecorderDemoVC
@interface JobsOCAudioRecorderDemoVC (JobsPropertyDSLSetterAutogen_6d4803daab)
-(void)setPermissionGranted:(BOOL)data;
-(void)setRecordings:(NSArray<JobsOCAudioRecording *> * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCAudioRecorderDemoVC

@implementation JobsOCAudioRecorderDemoVC

@synthesize tableView = _tableView;

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCAudioRecorderDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel *data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel *data) {
                data.byText(@"本地录音与音频管理".jobsTr())
                    .byFont(UIFontWeightRegularSize(16));
            });
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCAudioRecorderDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(UIColor.systemGroupedBackgroundColor);
        self.makeNavByAlpha(1);
        self.buildUI();
        ((JobsOCAudioRecorderEngine *)JobsOCAudioRecorderEngine.shared()).delegate = self;
        @jobs_weakify(self)
        (((JobsOCAudioRecorderEngine *)JobsOCAudioRecorderEngine.shared())).requestPermission(^(BOOL granted) {
            @jobs_strongify(self)
            if (!self) return;
            self.byPermissionGranted(granted);
            self.refreshState();
        });
        self.reloadRecordings();
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCAudioRecorderDemoVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        ((JobsOCAudioRecorderEngine *)JobsOCAudioRecorderEngine.shared()).delegate = self;
        self.refreshState();self.reloadRecordings();
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCAudioRecorderDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        if (((JobsOCAudioRecorderEngine *)JobsOCAudioRecorderEngine.shared()).isRecording && ((JobsOCAudioRecorderEngine *)JobsOCAudioRecorderEngine.shared()).mode == JobsOCAudioRecordingModeShort) (((JobsOCAudioRecorderEngine *)JobsOCAudioRecorderEngine.shared())).jobsCancel();
    };
}

-(jobsByVoidBlock _Nonnull)buildUI{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.view addSubview:self.settingsCard];
        [self.settingsCard mas_makeConstraints:^(MASConstraintMaker *make) { make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(12);make.left.right.equalTo(self.view).inset(16); }];
        [self.settingsCard addSubview:self.settingsStack];
        [self.settingsStack mas_makeConstraints:^(MASConstraintMaker *make) { make.edges.equalTo(self.settingsCard).insets(UIEdgeInsetsMake(16,16,16,16)); }];
        [self.modeControl mas_makeConstraints:^(MASConstraintMaker *make) { make.height.mas_equalTo(36); }];
        [self.durationField mas_makeConstraints:^(MASConstraintMaker *make) { make.size.mas_equalTo(CGSizeMake(72,38)); }];
        [self.view addSubview:self.listTitleLabel];
        [self.listTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) { make.top.equalTo(self.settingsCard.mas_bottom).offset(18);make.left.equalTo(self.view).offset(22); }];
        [self.view addSubview:self.capturePanel];
        [self.capturePanel mas_makeConstraints:^(MASConstraintMaker *make) { make.left.right.bottom.equalTo(self.view);make.height.mas_equalTo(154); }];
        [self.capturePanel addSubview:self.captureHintLabel];
        [self.capturePanel addSubview:self.recordButton];
        [self.capturePanel addSubview:self.longButtonOuterRingView];
        [self.capturePanel addSubview:self.longButton];
        [self.captureHintLabel mas_makeConstraints:^(MASConstraintMaker *make) { make.top.equalTo(self.capturePanel).offset(8);make.left.right.equalTo(self.capturePanel).inset(20); }];
        [self.recordButton mas_makeConstraints:^(MASConstraintMaker *make) { make.centerX.equalTo(self.capturePanel);make.top.equalTo(self.captureHintLabel.mas_bottom).offset(10);make.size.mas_equalTo(CGSizeMake(96,96)); }];
        [self.longButtonOuterRingView mas_makeConstraints:^(MASConstraintMaker *make) { make.center.equalTo(self.recordButton);make.size.mas_equalTo(CGSizeMake(96,96)); }];
        [self.longButton mas_makeConstraints:^(MASConstraintMaker *make) { make.center.equalTo(self.longButtonOuterRingView);make.size.mas_equalTo(CGSizeMake(70,70)); }];
        [self.view addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) { make.top.equalTo(self.listTitleLabel.mas_bottom).offset(4);make.left.right.equalTo(self.view);make.bottom.equalTo(self.capturePanel.mas_top); }];
        @jobs_weakify(self)
        self.recordButton
            .byAudioOnBegin(^BOOL{
                @jobs_strongify(self)
                if (!self) return NO;
                if (!self.permissionGranted) {self.show(@"请在系统设置中允许麦克风权限");return NO;}
                NSTimeInterval duration = MAX(1,self.durationField.text.doubleValue ?: 60);
                self.recordButton.byDuration(duration);
                NSError *error;
                BOOL result = [((JobsOCAudioRecorderEngine *)JobsOCAudioRecorderEngine.shared()) startWithMode:JobsOCAudioRecordingModeShort maximumDuration:duration error:&error];
                if (error) self.show(error.localizedDescription);return result;
            })
            .byAudioOnFinish(^{
                ((JobsOCAudioRecorderEngine *)JobsOCAudioRecorderEngine.shared()).stopAndSave();
            })
            .byAudioOnCancel(^{
                ((JobsOCAudioRecorderEngine *)JobsOCAudioRecorderEngine.shared()).jobsCancel();
            })
            .byAudioOnTooShort(^{
                @jobs_strongify(self)
                if (!self) return;
                self.show([NSString stringWithFormat:@"录音时间太短，请至少录制 %.0f 秒".jobsTr(),self.recordButton.minimumValidDuration]);
            });
        self.refreshState();
    };
}

-(void)modeChanged{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCAudioRecorderDemoVC.class, @selector(jobsModeChanged)))(self, @selector(jobsModeChanged));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsModeChanged{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.refreshState();
    };
}
-(jobsByVoidBlock _Nonnull)refreshState{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        BOOL shortMode = self.modeControl.selectedSegmentIndex == 0;
        self.durationRow.byHidden(!shortMode);
        self.recordButton.byHidden(!shortMode);
        self.longButtonOuterRingView.byHidden(shortMode);
        self.longButton.byHidden(shortMode);
        if (self.modeControl) self.modeControl.byEnabled(!((JobsOCAudioRecorderEngine *)JobsOCAudioRecorderEngine.shared()).isRecording);
        if (shortMode) {
            self.hintLabel.byText([NSString stringWithFormat:@"至少录制 %.0f 秒；手指移出按钮即取消，计时环走满后自动保存。".jobsTr(),self.recordButton.minimumValidDuration]);
            self.captureHintLabel.byText(@"按住录音".jobsTr());
        } else {
            self.hintLabel.byText(@"开始后可离开本页或让 App 进入后台，返回后轻触按钮停止并保存。".jobsTr());
            BOOL recording = ((JobsOCAudioRecorderEngine *)JobsOCAudioRecorderEngine.shared()).isRecording;
            self.captureHintLabel.byText(recording ? @"正在录音，轻触停止并保存".jobsTr() : @"轻触开始长时间录音".jobsTr());
            self.longButton.bySelected(recording);
        }
    };
}

-(jobsByVoidBlock _Nonnull)toggleLongRecording{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.permissionGranted) {self.show(@"请在系统设置中允许麦克风权限");return;}
        if (((JobsOCAudioRecorderEngine *)JobsOCAudioRecorderEngine.shared()).isRecording) {((JobsOCAudioRecorderEngine *)JobsOCAudioRecorderEngine.shared()).stopAndSave();return;}
        NSError *error;[((JobsOCAudioRecorderEngine *)JobsOCAudioRecorderEngine.shared()) startWithMode:JobsOCAudioRecordingModeLong maximumDuration:0 error:&error];if (error) self.show(error.localizedDescription);
    };
}

-(jobsByVoidBlock _Nonnull)reloadRecordings{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byRecordings(((JobsOCAudioRecordingStore *)JobsOCAudioRecordingStore.shared()).recordings());
        [self.tableView reloadData];
    };
}
-(jobsByStrBlock _Nonnull)show{
    @jobs_weakify(self)
    return ^(NSString * message){
        @jobs_strongify(self)
        if (!self) return;
        [self presentViewController:self.messageAlertController.byMessage(message)
                           animated:YES
                         completion:nil];
    };
}
-(void)audioRecorderEngineDidStart:(JobsOCAudioRecorderEngine *)engine{
    jobsByJobsOCAudioRecorderEngineBlock action = ((jobsByJobsOCAudioRecorderEngineBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCAudioRecorderDemoVC.class, @selector(jobsAudioRecorderEngineDidStart)))(self, @selector(jobsAudioRecorderEngineDidStart));
    if (action) action(engine);
}

-(jobsByJobsOCAudioRecorderEngineBlock _Nonnull)jobsAudioRecorderEngineDidStart{
    @jobs_weakify(self)
    return ^(JobsOCAudioRecorderEngine * engine){
        @jobs_strongify(self)
        if (!self) return;
        self.refreshState();
    };
}
-(void)audioRecorderEngine:(JobsOCAudioRecorderEngine *)engine didFinishAtURL:(NSURL *)url error:(NSError *)error{self.refreshState();self.reloadRecordings();if (error) self.show(error.localizedDescription);}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{return self.recordings.count;}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"JobsOCAudioRecorderCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    JobsOCAudioRecording *item = self.recordings[indexPath.row];
    cell.textLabel.byText(item.mode == JobsOCAudioRecordingModeLong ? @"长时间录音" : @"短暂录音");
    cell.detailTextLabel.byText([NSString stringWithFormat:@"%.1f 秒 · %.1f KB · %@",item.duration,item.fileSize / 1024.0,item.url.lastPathComponent]);return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{[tableView deselectRowAtIndexPath:indexPath animated:YES];NSError *error;[((JobsOCAudioPlayerEngine *)JobsOCAudioPlayerEngine.shared()) toggleURL:self.recordings[indexPath.row].url error:&error];if (error) self.show(error.localizedDescription);}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)style forRowAtIndexPath:(NSIndexPath *)indexPath{if (style != UITableViewCellEditingStyleDelete) return;(((JobsOCAudioPlayerEngine *)JobsOCAudioPlayerEngine.shared())).jobsStop();NSError *error;[((JobsOCAudioRecordingStore *)JobsOCAudioRecordingStore.shared()) deleteRecording:self.recordings[indexPath.row] error:&error];error ? self.show(error.localizedDescription) : self.reloadRecordings();}

#pragma mark —— LazyLoad
-(UIView *)settingsCard{
    if (!_settingsCard) {
        _settingsCard = jobsMakeView(^(UIView *object){})
            .byBgColor(UIColor.secondarySystemGroupedBackgroundColor)
            .byCornerRadius(18);
    };return _settingsCard;
}

-(UISegmentedControl *)modeControl{
    if (!_modeControl) {
        _modeControl = [UISegmentedControl.alloc initWithItems:@[@"短暂录音",@"长时间录音"]];
        _modeControl.bySelectedSegmentIndex(0);
        [_modeControl addTarget:self action:@selector(modeChanged) forControlEvents:UIControlEventValueChanged];
    };return _modeControl;
}

-(UILabel *)durationTitleLabel{
    if (!_durationTitleLabel) {
        _durationTitleLabel = jobsMakeLabel(^(UILabel *object){});
        _durationTitleLabel.byText(@"录音时长".jobsTr());
        _durationTitleLabel.byFont(UIFontWeightMediumSize(16));
        _durationTitleLabel.byTextColor(UIColor.labelColor);
    };return _durationTitleLabel;
}

-(UIView *)durationSpacer{
    if (!_durationSpacer) {
        _durationSpacer = jobsMakeView(^(UIView *object){});
    };return _durationSpacer;
}

-(UILabel *)durationUnitLabel{
    if (!_durationUnitLabel) {
        _durationUnitLabel = jobsMakeLabel(^(UILabel *object){});
        _durationUnitLabel.byText(@"秒".jobsTr());
        _durationUnitLabel.byFont(UIFontWeightRegularSize(15));
        _durationUnitLabel.byTextColor(UIColor.secondaryLabelColor);
    };return _durationUnitLabel;
}

-(UIStackView *)durationRow{
    if (!_durationRow) {
        _durationRow = [UIStackView.alloc initWithArrangedSubviews:@[self.durationTitleLabel,self.durationSpacer,self.durationField,self.durationUnitLabel]];
        _durationRow.byAxis(UILayoutConstraintAxisHorizontal);
        _durationRow.byAlignment(UIStackViewAlignmentCenter);
        _durationRow.bySpacing(8);
    };return _durationRow;
}

-(UITextField *)durationField{
    if (!_durationField) {
        _durationField = jobsMakeTextField(^(UITextField *object){});
        _durationField.byBorderStyle(UITextBorderStyleRoundedRect);
        _durationField.byKeyboardType(UIKeyboardTypeNumberPad);
        _durationField.byTextAlignment(NSTextAlignmentCenter);
        _durationField.byText(@"60");
        _durationField.byPlaceholder(@"60");
    };return _durationField;
}

-(UILabel *)hintLabel{
    if (!_hintLabel) {
        _hintLabel = jobsMakeLabel(^(UILabel *object){});
        _hintLabel.byNumberOfLines(0);
        _hintLabel.byFont(UIFontWeightRegularSize(13));
        _hintLabel.byTextColor(UIColor.secondaryLabelColor);
    };return _hintLabel;
}

-(UIStackView *)settingsStack{
    if (!_settingsStack) {
        _settingsStack = [UIStackView.alloc initWithArrangedSubviews:@[self.modeControl,self.durationRow,self.hintLabel]];
        _settingsStack.byAxis(UILayoutConstraintAxisVertical);
        _settingsStack.bySpacing(12);
    };return _settingsStack;
}

-(UILabel *)listTitleLabel{
    if (!_listTitleLabel) {
        _listTitleLabel = jobsMakeLabel(^(UILabel *object){});
        _listTitleLabel.byText(@"本地录音".jobsTr());
        _listTitleLabel.byFont(UIFontWeightSemiboldSize(17));
        _listTitleLabel.byTextColor(UIColor.labelColor);
    };return _listTitleLabel;
}

-(UIView *)capturePanel{
    if (!_capturePanel) {
        _capturePanel = jobsMakeView(^(UIView *object){})
            .byBgColor(UIColor.systemGroupedBackgroundColor);
    };return _capturePanel;
}

-(UILabel *)captureHintLabel{
    if (!_captureHintLabel) {
        _captureHintLabel = jobsMakeLabel(^(UILabel *object){});
        _captureHintLabel.byTextAlignment(NSTextAlignmentCenter);
        _captureHintLabel.byFont(UIFontWeightMediumSize(14));
        _captureHintLabel.byTextColor(UIColor.secondaryLabelColor);
    };return _captureHintLabel;
}

-(JobsOCAudioRecordButton *)recordButton{
    if (!_recordButton) {
        _recordButton = JobsOCAudioRecordButton.button;
    };return _recordButton;
}

-(UIView *)longButtonOuterRingView{
    if (!_longButtonOuterRingView) {
        _longButtonOuterRingView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(UIColor.clearColor)
                .byUserInteractionEnabled(NO)
                .byCornerRadius(48)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byBorderWidth(4)
                        .byBorderColor(UIColor.whiteColor.CGColor);
                });
        });
    };return _longButtonOuterRingView;
}

-(UIButton *)longButton{
    if (!_longButton) {
        @jobs_weakify(self)
        _longButton = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .normalStateTitleBy(@"开始长时间录音".jobsTr())
                .selectedStateTitleBy(@"停止并保存长时间录音".jobsTr())
                .normalStateTitleColorBy(UIColor.clearColor)
                .selectedStateTitleColorBy(UIColor.clearColor)
                .jobsResetBtnBgCor(UIColor.whiteColor)
                .jobsResetBtnCornerRadiusValue(35)
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    @jobs_strongify(self)
                    if (!self) return;
                    self.toggleLongRecording();
                });
        });
    };return _longButton;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView.alloc initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped]
            .byDataSource(self)
            .byDelegate(self)
            .byBgColor(UIColor.clearColor);
    };return _tableView;
}

-(UIAlertController *)messageAlertController{
    if (!_messageAlertController) {
        _messageAlertController = [UIAlertController alertControllerWithTitle:@"提示".jobsTr()
                                                                      message:nil
                                                               preferredStyle:UIAlertControllerStyleAlert];
        [_messageAlertController addAction:[UIAlertAction actionWithTitle:@"知道了".jobsTr()
                                                                    style:UIAlertActionStyleDefault
                                                                  handler:nil]];
    };return _messageAlertController;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCAudioRecorderDemoVC
-(JobsRetJobsOCAudioRecorderDemoVCByBOOLBlock _Nonnull)byPermissionGranted{
    @jobs_weakify(self)
    return ^__kindof JobsOCAudioRecorderDemoVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setPermissionGranted:data];
        return self;
    };
}

-(JobsRetJobsOCAudioRecorderDemoVCByNSArrayJobsOCAudioRecordingBlock _Nonnull)byRecordings{
    @jobs_weakify(self)
    return ^__kindof JobsOCAudioRecorderDemoVC * _Nullable(NSArray<JobsOCAudioRecording *> * _Nullable data){
        @jobs_strongify(self)
        [self setRecordings:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCAudioRecorderDemoVC
@end
