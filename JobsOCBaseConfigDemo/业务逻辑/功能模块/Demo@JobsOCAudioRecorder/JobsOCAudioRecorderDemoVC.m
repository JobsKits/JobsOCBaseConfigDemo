//
//  JobsOCAudioRecorderDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月14日，星期二.
//

#import "JobsOCAudioRecorderDemoVC.h"

@interface JobsOCAudioRecorderDemoVC ()
@property(nonatomic,strong)UISegmentedControl *modeControl;
@property(nonatomic,strong)UIStackView *durationRow;
@property(nonatomic,strong)UITextField *durationField;
@property(nonatomic,strong)UILabel *hintLabel;
@property(nonatomic,strong)UILabel *captureHintLabel;
@property(nonatomic,strong)JobsOCAudioRecordButton *recordButton;
@property(nonatomic,strong)UIButton *longButton;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSArray<JobsOCAudioRecording *> *recordings;
@property(nonatomic,assign)BOOL permissionGranted;
@end

@implementation JobsOCAudioRecorderDemoVC

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
    UIView *card = UIView.new;
    card.backgroundColor = UIColor.secondarySystemGroupedBackgroundColor;
    card.layer.cornerRadius = 18;
    [self.view addSubview:card];
    [card mas_makeConstraints:^(MASConstraintMaker *make) { make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(12);make.left.right.equalTo(self.view).inset(16); }];
    self.modeControl = [UISegmentedControl.alloc initWithItems:@[@"短暂录音",@"长时间录音"]];
    self.modeControl.selectedSegmentIndex = 0;
    [self.modeControl addTarget:self action:@selector(modeChanged) forControlEvents:UIControlEventValueChanged];
    self.durationField = UITextField.new;
    self.durationField.borderStyle = UITextBorderStyleRoundedRect;
    self.durationField.keyboardType = UIKeyboardTypeNumberPad;
    self.durationField.textAlignment = NSTextAlignmentCenter;
    self.durationField.text = @"60";
    self.durationField.placeholder = @"60";
    UILabel *durationTitleLabel = UILabel.new;
    durationTitleLabel.text = @"录音时长".tr;
    durationTitleLabel.font = UIFontWeightMediumSize(16);
    durationTitleLabel.textColor = UIColor.labelColor;
    UILabel *durationUnitLabel = UILabel.new;
    durationUnitLabel.text = @"秒".tr;
    durationUnitLabel.font = UIFontWeightRegularSize(15);
    durationUnitLabel.textColor = UIColor.secondaryLabelColor;
    UIView *durationSpacer = UIView.new;
    self.durationRow = [UIStackView.alloc initWithArrangedSubviews:@[durationTitleLabel,durationSpacer,self.durationField,durationUnitLabel]];
    self.durationRow.axis = UILayoutConstraintAxisHorizontal;
    self.durationRow.alignment = UIStackViewAlignmentCenter;
    self.durationRow.spacing = 8;
    self.hintLabel = UILabel.new;
    self.hintLabel.numberOfLines = 0;
    self.hintLabel.font = UIFontWeightRegularSize(13);
    self.hintLabel.textColor = UIColor.secondaryLabelColor;
    UIStackView *settingsStack = [UIStackView.alloc initWithArrangedSubviews:@[self.modeControl,self.durationRow,self.hintLabel]];
    settingsStack.axis = UILayoutConstraintAxisVertical;
    settingsStack.spacing = 12;
    [card addSubview:settingsStack];
    self.recordButton = JobsOCAudioRecordButton.button;
    self.longButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.longButton.backgroundColor = UIColor.systemBlueColor;
    self.longButton.tintColor = UIColor.whiteColor;
    [self.longButton setImage:[UIImage systemImageNamed:@"mic.fill"] forState:UIControlStateNormal];
    self.longButton.layer.cornerRadius = 40;
    self.longButton.layer.borderWidth = 7;
    self.longButton.layer.borderColor = [UIColor.systemBlueColor colorWithAlphaComponent:0.18].CGColor;
    self.longButton.accessibilityLabel = @"开始长时间录音".tr;
    [self.longButton addTarget:self action:@selector(toggleLongRecording) forControlEvents:UIControlEventTouchUpInside];
    [settingsStack mas_makeConstraints:^(MASConstraintMaker *make) { make.edges.equalTo(card).insets(UIEdgeInsetsMake(16,16,16,16)); }];
    [self.modeControl mas_makeConstraints:^(MASConstraintMaker *make) { make.height.mas_equalTo(36); }];
    [self.durationField mas_makeConstraints:^(MASConstraintMaker *make) { make.size.mas_equalTo(CGSizeMake(72,38)); }];
    UILabel *listTitleLabel = UILabel.new;
    listTitleLabel.text = @"本地录音".tr;
    listTitleLabel.font = UIFontWeightSemiboldSize(17);
    listTitleLabel.textColor = UIColor.labelColor;
    [self.view addSubview:listTitleLabel];
    [listTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) { make.top.equalTo(card.mas_bottom).offset(18);make.left.equalTo(self.view).offset(22); }];
    UIView *capturePanel = UIView.new;
    capturePanel.backgroundColor = UIColor.systemGroupedBackgroundColor;
    [self.view addSubview:capturePanel];
    [capturePanel mas_makeConstraints:^(MASConstraintMaker *make) { make.left.right.bottom.equalTo(self.view);make.height.mas_equalTo(154); }];
    self.captureHintLabel = UILabel.new;
    self.captureHintLabel.textAlignment = NSTextAlignmentCenter;
    self.captureHintLabel.font = UIFontWeightMediumSize(14);
    self.captureHintLabel.textColor = UIColor.secondaryLabelColor;
    [capturePanel addSubview:self.captureHintLabel];
    [capturePanel addSubview:self.recordButton];
    [capturePanel addSubview:self.longButton];
    [self.captureHintLabel mas_makeConstraints:^(MASConstraintMaker *make) { make.top.equalTo(capturePanel).offset(8);make.left.right.equalTo(capturePanel).inset(20); }];
    [self.recordButton mas_makeConstraints:^(MASConstraintMaker *make) { make.centerX.equalTo(capturePanel);make.top.equalTo(self.captureHintLabel.mas_bottom).offset(10);make.size.mas_equalTo(CGSizeMake(96,96)); }];
    [self.longButton mas_makeConstraints:^(MASConstraintMaker *make) { make.center.equalTo(self.recordButton);make.size.mas_equalTo(CGSizeMake(80,80)); }];
    self.tableView = [UITableView.alloc initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
    self.tableView.dataSource = self;self.tableView.delegate = self;
    self.tableView.backgroundColor = UIColor.clearColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) { make.top.equalTo(listTitleLabel.mas_bottom).offset(4);make.left.right.equalTo(self.view);make.bottom.equalTo(capturePanel.mas_top); }];
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
    self.durationRow.hidden = self.recordButton.hidden = !shortMode;
    self.longButton.hidden = shortMode;
    self.modeControl.enabled = !JobsOCAudioRecorderEngine.shared.isRecording;
    if (shortMode) {
        self.hintLabel.text = [NSString stringWithFormat:@"至少录制 %.0f 秒；手指移出按钮即取消，计时环走满后自动保存。".tr,self.recordButton.minimumValidDuration];
        self.captureHintLabel.text = @"按住录音".tr;
    } else {
        self.hintLabel.text = @"开始后可离开本页或让 App 进入后台，返回后轻触按钮停止并保存。".tr;
        BOOL recording = JobsOCAudioRecorderEngine.shared.isRecording;
        UIColor *buttonColor = recording ? UIColor.systemRedColor : UIColor.systemBlueColor;
        self.captureHintLabel.text = recording ? @"正在录音，轻触停止并保存".tr : @"轻触开始长时间录音".tr;
        self.longButton.backgroundColor = buttonColor;
        self.longButton.layer.borderColor = [buttonColor colorWithAlphaComponent:0.18].CGColor;
        [self.longButton setImage:[UIImage systemImageNamed:recording ? @"stop.fill" : @"mic.fill"] forState:UIControlStateNormal];
        self.longButton.accessibilityLabel = self.captureHintLabel.text;
    }
}

-(void)toggleLongRecording{
    if (!self.permissionGranted) {[self show:@"请在系统设置中允许麦克风权限"];return;}
    if (JobsOCAudioRecorderEngine.shared.isRecording) {[JobsOCAudioRecorderEngine.shared stopAndSave];return;}
    NSError *error;[JobsOCAudioRecorderEngine.shared startWithMode:JobsOCAudioRecordingModeLong maximumDuration:0 error:&error];if (error) [self show:error.localizedDescription];
}

-(void)reloadRecordings{self.recordings = JobsOCAudioRecordingStore.shared.recordings;[self.tableView reloadData];}
-(void)show:(NSString *)message{UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];[alert addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil]];[self presentViewController:alert animated:YES completion:nil];}
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
@end
