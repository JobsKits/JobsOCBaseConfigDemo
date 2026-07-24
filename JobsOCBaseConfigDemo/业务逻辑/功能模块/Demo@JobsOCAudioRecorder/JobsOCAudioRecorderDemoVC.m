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

@implementation JobsOCAudioRecorderDemoVC

@synthesize tableView = _tableView;

-(void)loadView{
    [super loadView];
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel *data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel *data) {
            data.byText(@"本地录音与音频管理".tr)
                .byFont(UIFontWeightRegularSize(16));
        });
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.systemGroupedBackgroundColor;
    self.makeNavByAlpha(1);
    [self buildUI];
    JobsOCAudioRecorderEngine.shared.delegate = self;
    __weak typeof(self) weakSelf = self;
    [JobsOCAudioRecorderEngine.shared requestPermission:^(BOOL granted) { weakSelf.permissionGranted = granted;[weakSelf refreshState]; }];
    [self reloadRecordings];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    JobsOCAudioRecorderEngine.shared.delegate = self;
    [self refreshState];[self reloadRecordings];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (JobsOCAudioRecorderEngine.shared.isRecording && JobsOCAudioRecorderEngine.shared.mode == JobsOCAudioRecordingModeShort) [JobsOCAudioRecorderEngine.shared cancel];
}

-(void)buildUI{
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
    __weak typeof(self) weakSelf = self;
    self.recordButton.onBegin = ^BOOL{
        if (!weakSelf.permissionGranted) {[weakSelf show:@"请在系统设置中允许麦克风权限"];return NO;}
        NSTimeInterval duration = MAX(1,weakSelf.durationField.text.doubleValue ?: 60);
        weakSelf.recordButton.duration = duration;
        NSError *error;
        BOOL result = [JobsOCAudioRecorderEngine.shared startWithMode:JobsOCAudioRecordingModeShort maximumDuration:duration error:&error];
        if (error) [weakSelf show:error.localizedDescription];return result;
    };
    self.recordButton.onFinish = ^{[JobsOCAudioRecorderEngine.shared stopAndSave];};
    self.recordButton.onCancel = ^{[JobsOCAudioRecorderEngine.shared cancel];};
    self.recordButton.onTooShort = ^{
        [weakSelf show:[NSString stringWithFormat:@"录音时间太短，请至少录制 %.0f 秒".tr,weakSelf.recordButton.minimumValidDuration]];
    };
    [self refreshState];
}

-(void)modeChanged{[self refreshState];}
-(void)refreshState{
    BOOL shortMode = self.modeControl.selectedSegmentIndex == 0;
    self.durationRow.byHidden(!shortMode);
    self.recordButton.byHidden(!shortMode);
    self.longButtonOuterRingView.byHidden(shortMode);
    self.longButton.byHidden(shortMode);
    self.modeControl.enabled = !JobsOCAudioRecorderEngine.shared.isRecording;
    if (shortMode) {
        self.hintLabel.text = [NSString stringWithFormat:@"至少录制 %.0f 秒；手指移出按钮即取消，计时环走满后自动保存。".tr,self.recordButton.minimumValidDuration];
        self.captureHintLabel.text = @"按住录音".tr;
    } else {
        self.hintLabel.text = @"开始后可离开本页或让 App 进入后台，返回后轻触按钮停止并保存。".tr;
        BOOL recording = JobsOCAudioRecorderEngine.shared.isRecording;
        self.captureHintLabel.text = recording ? @"正在录音，轻触停止并保存".tr : @"轻触开始长时间录音".tr;
        self.longButton.bySelected(recording);
    }
}

-(void)toggleLongRecording{
    if (!self.permissionGranted) {[self show:@"请在系统设置中允许麦克风权限"];return;}
    if (JobsOCAudioRecorderEngine.shared.isRecording) {[JobsOCAudioRecorderEngine.shared stopAndSave];return;}
    NSError *error;[JobsOCAudioRecorderEngine.shared startWithMode:JobsOCAudioRecordingModeLong maximumDuration:0 error:&error];if (error) [self show:error.localizedDescription];
}

-(void)reloadRecordings{self.recordings = JobsOCAudioRecordingStore.shared.recordings;[self.tableView reloadData];}
-(void)show:(NSString *)message{self.messageAlertController.message = message;[self presentViewController:self.messageAlertController animated:YES completion:nil];}
-(void)audioRecorderEngineDidStart:(JobsOCAudioRecorderEngine *)engine{[self refreshState];}
-(void)audioRecorderEngine:(JobsOCAudioRecorderEngine *)engine didFinishAtURL:(NSURL *)url error:(NSError *)error{[self refreshState];[self reloadRecordings];if (error) [self show:error.localizedDescription];}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{return self.recordings.count;}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"JobsOCAudioRecorderCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    JobsOCAudioRecording *item = self.recordings[indexPath.row];
    cell.textLabel.text = item.mode == JobsOCAudioRecordingModeLong ? @"长时间录音" : @"短暂录音";
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%.1f 秒 · %.1f KB · %@",item.duration,item.fileSize / 1024.0,item.url.lastPathComponent];return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{[tableView deselectRowAtIndexPath:indexPath animated:YES];NSError *error;[JobsOCAudioPlayerEngine.shared toggleURL:self.recordings[indexPath.row].url error:&error];if (error) [self show:error.localizedDescription];}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)style forRowAtIndexPath:(NSIndexPath *)indexPath{if (style != UITableViewCellEditingStyleDelete) return;[JobsOCAudioPlayerEngine.shared stop];NSError *error;[JobsOCAudioRecordingStore.shared deleteRecording:self.recordings[indexPath.row] error:&error];error ? [self show:error.localizedDescription] : [self reloadRecordings];}

#pragma mark —— LazyLoad
-(UIView *)settingsCard{
    if (!_settingsCard) {
        _settingsCard = UIView.new;
        _settingsCard.backgroundColor = UIColor.secondarySystemGroupedBackgroundColor;
        _settingsCard.layer.cornerRadius = 18;
    };return _settingsCard;
}

-(UISegmentedControl *)modeControl{
    if (!_modeControl) {
        _modeControl = [UISegmentedControl.alloc initWithItems:@[@"短暂录音",@"长时间录音"]];
        _modeControl.selectedSegmentIndex = 0;
        [_modeControl addTarget:self action:@selector(modeChanged) forControlEvents:UIControlEventValueChanged];
    };return _modeControl;
}

-(UILabel *)durationTitleLabel{
    if (!_durationTitleLabel) {
        _durationTitleLabel = UILabel.new;
        _durationTitleLabel.text = @"录音时长".tr;
        _durationTitleLabel.font = UIFontWeightMediumSize(16);
        _durationTitleLabel.textColor = UIColor.labelColor;
    };return _durationTitleLabel;
}

-(UIView *)durationSpacer{
    if (!_durationSpacer) {
        _durationSpacer = UIView.new;
    };return _durationSpacer;
}

-(UILabel *)durationUnitLabel{
    if (!_durationUnitLabel) {
        _durationUnitLabel = UILabel.new;
        _durationUnitLabel.text = @"秒".tr;
        _durationUnitLabel.font = UIFontWeightRegularSize(15);
        _durationUnitLabel.textColor = UIColor.secondaryLabelColor;
    };return _durationUnitLabel;
}

-(UIStackView *)durationRow{
    if (!_durationRow) {
        _durationRow = [UIStackView.alloc initWithArrangedSubviews:@[self.durationTitleLabel,self.durationSpacer,self.durationField,self.durationUnitLabel]];
        _durationRow.axis = UILayoutConstraintAxisHorizontal;
        _durationRow.alignment = UIStackViewAlignmentCenter;
        _durationRow.spacing = 8;
    };return _durationRow;
}

-(UITextField *)durationField{
    if (!_durationField) {
        _durationField = UITextField.new;
        _durationField.borderStyle = UITextBorderStyleRoundedRect;
        _durationField.keyboardType = UIKeyboardTypeNumberPad;
        _durationField.textAlignment = NSTextAlignmentCenter;
        _durationField.text = @"60";
        _durationField.placeholder = @"60";
    };return _durationField;
}

-(UILabel *)hintLabel{
    if (!_hintLabel) {
        _hintLabel = UILabel.new;
        _hintLabel.numberOfLines = 0;
        _hintLabel.font = UIFontWeightRegularSize(13);
        _hintLabel.textColor = UIColor.secondaryLabelColor;
    };return _hintLabel;
}

-(UIStackView *)settingsStack{
    if (!_settingsStack) {
        _settingsStack = [UIStackView.alloc initWithArrangedSubviews:@[self.modeControl,self.durationRow,self.hintLabel]];
        _settingsStack.axis = UILayoutConstraintAxisVertical;
        _settingsStack.spacing = 12;
    };return _settingsStack;
}

-(UILabel *)listTitleLabel{
    if (!_listTitleLabel) {
        _listTitleLabel = UILabel.new;
        _listTitleLabel.text = @"本地录音".tr;
        _listTitleLabel.font = UIFontWeightSemiboldSize(17);
        _listTitleLabel.textColor = UIColor.labelColor;
    };return _listTitleLabel;
}

-(UIView *)capturePanel{
    if (!_capturePanel) {
        _capturePanel = UIView.new;
        _capturePanel.backgroundColor = UIColor.systemGroupedBackgroundColor;
    };return _capturePanel;
}

-(UILabel *)captureHintLabel{
    if (!_captureHintLabel) {
        _captureHintLabel = UILabel.new;
        _captureHintLabel.textAlignment = NSTextAlignmentCenter;
        _captureHintLabel.font = UIFontWeightMediumSize(14);
        _captureHintLabel.textColor = UIColor.secondaryLabelColor;
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
        __weak typeof(self) weakSelf = self;
        _longButton = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .normalStateTitleBy(@"开始长时间录音".tr)
                .selectedStateTitleBy(@"停止并保存长时间录音".tr)
                .normalStateTitleColorBy(UIColor.clearColor)
                .selectedStateTitleColorBy(UIColor.clearColor)
                .jobsResetBtnBgCor(UIColor.whiteColor)
                .jobsResetBtnCornerRadiusValue(35)
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    [weakSelf toggleLongRecording];
                });
        });
    };return _longButton;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView.alloc initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = UIColor.clearColor;
    };return _tableView;
}

-(UIAlertController *)messageAlertController{
    if (!_messageAlertController) {
        _messageAlertController = [UIAlertController alertControllerWithTitle:@"提示".tr
                                                                      message:nil
                                                               preferredStyle:UIAlertControllerStyleAlert];
        [_messageAlertController addAction:[UIAlertAction actionWithTitle:@"知道了".tr
                                                                    style:UIAlertActionStyleDefault
                                                                  handler:nil]];
    };return _messageAlertController;
}

@end
