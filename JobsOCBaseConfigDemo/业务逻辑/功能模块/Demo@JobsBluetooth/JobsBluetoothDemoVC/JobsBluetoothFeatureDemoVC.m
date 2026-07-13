//
//  JobsBluetoothFeatureDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#import "JobsBluetoothFeatureDemoVC.h"

@interface JobsBluetoothFeatureDemoVC ()

Prop_assign()NSInteger featureIndex;
Prop_copy()NSString *featureTitle;
Prop_strong()UILabel *descriptionLabel;
Prop_strong()UIButton *executeButton;
Prop_strong()UITextView *logTextView;
Prop_strong()NSMutableArray <NSString *>*logLines;
Prop_strong()JobsBluetoothManager *bluetoothManager;

-(void)runFeature;
-(void)appendLog:(NSString *)message;

@end


@implementation JobsBluetoothFeatureDemoVC

-(instancetype)initWithFeatureIndex:(NSInteger)featureIndex
                       featureTitle:(NSString *)featureTitle{
    if (self = [super init]) {
        _featureIndex = featureIndex;
        _featureTitle = featureTitle.copy;
    };return self;
}

-(void)loadView{
    [super loadView];
    self.viewModel.byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
        data.byText(self.featureTitle)
            .byFont(UIFontWeightRegularSize(16));
    });
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.byBgColor(JobsWhiteColor);
    self.makeNavByAlpha(1);
    self.descriptionLabel.byVisible(YES);
    self.executeButton.byVisible(YES);
    self.logTextView.byVisible(YES);
    [self appendLog:@"详情页已进入，点击蓝色按钮开始演示。"]; 
}

-(void)runFeature{
    [self appendLog:[NSString stringWithFormat:@"执行：%@", self.featureTitle]];
    if (self.featureIndex <= 3 || self.featureIndex == 21) {
        [self.bluetoothManager startScan];
    }else if (self.featureIndex <= 6){
        [self.bluetoothManager startScan];
        JobsBluetoothPeripheral *peripheral = self.bluetoothManager.discoveredPeripherals.firstObject;
        if (peripheral) [self.bluetoothManager connectIdentifier:peripheral.identifier];
    }else if (self.featureIndex == 7){
        [self.bluetoothManager read];
        [self appendLog:@"已提交 Read 请求；真实设备需要配置 FFF3 特征。"]; 
    }else if (self.featureIndex == 10){
        [self.bluetoothManager setNotifyEnabled:YES];
        [self appendLog:@"已提交 Notify 开启请求。"]; 
    }else if (self.featureIndex == 11){
        [self appendLog:@"MTU 与分包根据 maximumWriteValueLength 动态决定。"]; 
    }else if (self.featureIndex == 15){
        [self.bluetoothManager disconnect];
    }else if (self.featureIndex == 16){
        [self appendLog:@"状态恢复由 Manager 收口；宿主显式声明 bluetooth-central。"]; 
    }else if (self.featureIndex == 17 || self.featureIndex == 24){
        [self appendLog:@"Profile、Manager、Command 已全部通过 byXxx / onXxx DSL 配置。"]; 
    }else{
        JobsBluetoothCommand *command = JobsBluetoothCommand.new
            .byIdentifier([NSString stringWithFormat:@"demo.%ld", (long)self.featureIndex])
            .byPayload([[NSString stringWithFormat:@"JobsBluetooth-%ld", (long)self.featureIndex] dataUsingEncoding:NSUTF8StringEncoding])
            .byTimeout(3)
            .byRetryCount(2)
            .byPriority(self.featureIndex)
            .byResponseMatcher(^BOOL(NSData *data) { return data.length > 0; });
        [self.bluetoothManager sendCommand:command completion:^(NSData * _Nullable response, NSError * _Nullable error) {
            [self appendLog:[NSString stringWithFormat:@"命令完成：%@ / %@", response, error]];
        }];
    }
}

-(void)appendLog:(NSString *)message{
    NSString *line = [NSString stringWithFormat:@"[%@] %@", NSDate.date.description, message];
    [self.logLines addObject:line];
    self.logTextView.byText([self.logLines componentsJoinedByString:@"\n"]);
    if (self.logTextView.text.length) {
        [self.logTextView scrollRangeToVisible:NSMakeRange(self.logTextView.text.length - 1, 1)];
    }
}

-(UILabel *)descriptionLabel{
    if (!_descriptionLabel) {
        _descriptionLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText([NSString stringWithFormat:@"当前演示：%@\n默认启用 Mock Transport，可在模拟器直接验证点击链路和数据回调。", self.featureTitle])
                .byFont(UIFontWeightRegularSize(15))
                .byNumberOfLines(0)
                .byTextCor(JobsBlackColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(16));
                    make.left.right.equalTo(self.view).inset(JobsWidth(20));
                });
        });
    };return _descriptionLabel;
}

-(UIButton *)executeButton{
    if (!_executeButton) {
        _executeButton = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button.jobsResetBtnTitle([NSString stringWithFormat:@"执行 %@", self.featureTitle])
                .jobsResetBtnTitleCor(JobsWhiteColor)
                .jobsResetBtnTitleFont(UIFontWeightBoldSize(16))
                .jobsResetBtnBgCor(HEXCOLOR(0x007AFF))
                .byAddTarget(self, @selector(runFeature), UIControlEventTouchUpInside)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer.byCornerRadius(JobsWidth(10))
                        .byMasksToBounds(YES);
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.descriptionLabel.mas_bottom).offset(JobsWidth(16));
                    make.left.right.equalTo(self.view).inset(JobsWidth(20));
                    make.height.mas_equalTo(JobsWidth(48));
                });
        });
    };return _executeButton;
}

-(UITextView *)logTextView{
    if (!_logTextView) {
        _logTextView = jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
            textView.byEditable(NO)
                .byFont(UIFontMonospacedSystemWeightRegularSize(13))
                .byTextCor(JobsBlackColor)
                .byBgColor(HEXCOLOR(0xF2F2F7))
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer.byCornerRadius(JobsWidth(10))
                        .byMasksToBounds(YES);
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.executeButton.mas_bottom).offset(JobsWidth(16));
                    make.left.right.equalTo(self.view).inset(JobsWidth(20));
                    make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-JobsWidth(16));
                });
        });
    };return _logTextView;
}

-(NSMutableArray<NSString *> *)logLines{
    if (!_logLines) _logLines = NSMutableArray.array;
    return _logLines;
}

-(JobsBluetoothManager *)bluetoothManager{
    if (!_bluetoothManager) {
        JobsBluetoothProfile *profile = JobsBluetoothProfile.new
            .byIdentifier([NSString stringWithFormat:@"jobs.bluetooth.demo.%ld", (long)self.featureIndex])
            .byServiceUUIDStrings(@[@"FFF0"])
            .byWriteUUIDString(@"FFF1")
            .byNotifyUUIDString(@"FFF2")
            .byReadUUIDString(@"FFF3")
            .byScanTimeout(10)
            .byConnectTimeout(12)
            .byMaximumReconnectCount(3)
            .byAllowDuplicates(NO);
        _bluetoothManager = [JobsBluetoothManager.alloc initWithProfile:profile]
            .byMockTransport(JobsBluetoothMockTransport.new.byEnabled(YES).byLatency(0.2))
            .onStateChanged(^(JobsBluetoothState state) { [self appendLog:[NSString stringWithFormat:@"状态变化：%ld", (long)state]]; })
            .onPeripheralDiscovered(^(JobsBluetoothPeripheral *peripheral) { [self appendLog:[NSString stringWithFormat:@"发现设备：%@｜RSSI %@", peripheral.name, peripheral.RSSI]]; })
            .onDataReceived(^(NSData *data, id decodedObject) { [self appendLog:[NSString stringWithFormat:@"收到：%@｜解析值：%@", data, decodedObject]]; })
            .onLog(^(NSString *message) { [self appendLog:message]; });
    };return _bluetoothManager;
}

@end
