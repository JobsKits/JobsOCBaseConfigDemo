//
//  JobsWebSocketDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#import "JobsWebSocketDemoVC.h"

static NSString *const JobsWebSocketDemoDefaultEndpoint = @"wss://ws.postman-echo.com/raw";

@interface JobsWebSocketDemoVC ()

Prop_strong()UITextField *endpointTF;
Prop_strong()UIButton *connectBtn;
Prop_strong()UIButton *disconnectBtn;
Prop_strong()UITextField *messageTF;
Prop_strong()UIButton *sendBtn;
Prop_strong()UILabel *statusLab;
Prop_strong()UITextView *logTextView;
Prop_strong()NSDateFormatter *timeFormatter;
Prop_strong()JobsOCWebSocketClient *client;

@end

@implementation JobsWebSocketDemoVC
-(void)dealloc{
    [_client disconnect];
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data
                .byText(@"WebSocket 双向通信".tr)
                .byFont(UIFontWeightRegularSize(18));
        })
        .byBgCor(UIColor.systemBackgroundColor)
        .byNavBgCor(UIColor.systemBackgroundColor);
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.byBgColor(UIColor.systemBackgroundColor);
    self.endpointTF.byVisible(YES);
    self.connectBtn.byVisible(YES);
    self.disconnectBtn.byVisible(YES);
    self.messageTF.byVisible(YES);
    self.sendBtn.byVisible(YES);
    self.statusLab.byVisible(YES);
    self.logTextView.byVisible(YES);
    [self updateConnectionStatus:@"未连接"];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.client disconnect];
}
#pragma mark —— Actions
-(void)connectWebSocket{
    NSString *endpoint = [self.endpointTF.text stringByTrimmingCharactersInSet:
                          NSCharacterSet.whitespaceAndNewlineCharacterSet];
    if (![endpoint hasPrefix:@"ws://"] &&
        ![endpoint hasPrefix:@"wss://"]) {
        [self appendLog:@"地址无效，请输入 ws:// 或 wss:// 地址"];
        return;
    }
    NSURL *URL = [NSURL URLWithString:endpoint];
    if (!URL) {
        [self appendLog:@"地址无效，无法创建 WebSocket URL"];
        return;
    }
    [self appendLog:[NSString stringWithFormat:@"开始连接：%@",endpoint]];
    [self.client connectWithURL:URL];
}

-(void)disconnectWebSocket{
    [self.client disconnect];
    [self appendLog:@"主动断开连接"];
}

-(void)sendMessage{
    NSString *message = [self.messageTF.text stringByTrimmingCharactersInSet:
                         NSCharacterSet.whitespaceAndNewlineCharacterSet];
    if (!message.length) {
        [self appendLog:@"发送内容不能为空"];
        return;
    }
    NSError *error = nil;
    if ([self.client sendText:message error:&error]) {
        [self appendLog:[NSString stringWithFormat:@"→ %@",message]];
    } else {
        [self appendLog:[NSString stringWithFormat:@"发送失败：%@",
                         error.localizedDescription ?: @"未知错误"]];
    }
}
#pragma mark —— JobsOCWebSocketClientDelegate
-(void)webSocketClient:(JobsOCWebSocketClient *)client
        didChangeState:(JobsOCWebSocketState)state
                 error:(nullable NSError *)error{
    NSString *status = [self titleByWebSocketState:state];
    [self updateConnectionStatus:status];
    [self appendLog:[NSString stringWithFormat:@"状态：%@",status]];
    if (error) {
        [self appendLog:[NSString stringWithFormat:@"原因：%@",
                         error.localizedDescription]];
    }
}

-(void)webSocketClient:(JobsOCWebSocketClient *)client
willReconnectAtAttempt:(NSInteger)attempt
            afterDelay:(NSTimeInterval)delay{
    NSString *status = [NSString stringWithFormat:
                        @"第 %ld 次重连将在 %.1f 秒后开始",
                        (long)attempt,
                        delay];
    [self updateConnectionStatus:status];
    [self appendLog:status];
}

-(void)webSocketClient:(JobsOCWebSocketClient *)client
        didReceiveText:(NSString *)text{
    [self appendLog:[NSString stringWithFormat:@"← %@",text]];
}

-(void)webSocketClient:(JobsOCWebSocketClient *)client
        didReceiveData:(NSData *)data{
    [self appendLog:[NSString stringWithFormat:
                     @"← 二进制数据：%lu bytes",
                     (unsigned long)data.length]];
}
#pragma mark —— UI State
-(void)updateConnectionStatus:(NSString *)status{
    BOOL connected = self.client.state == JobsOCWebSocketStateConnected;
    BOOL connecting =
        self.client.state == JobsOCWebSocketStateConnecting ||
        self.client.state == JobsOCWebSocketStateReconnecting;
    self.statusLab.byText([NSString stringWithFormat:@"状态：%@",status]);
    self.connectBtn.byEnabled(!connected && !connecting);
    self.disconnectBtn.byEnabled(connected || connecting);
    self.sendBtn.byEnabled(connected);
}

-(NSString *)titleByWebSocketState:(JobsOCWebSocketState)state{
    switch (state) {
        /// 尚未发起连接
        case JobsOCWebSocketStateIdle:
            return @"未连接";
        /// 正在握手
        case JobsOCWebSocketStateConnecting:
            return @"连接中…";
        /// 已建立双向连接
        case JobsOCWebSocketStateConnected:
            return @"已连接";
        /// 正在等待自动重连
        case JobsOCWebSocketStateReconnecting:
            return @"等待自动重连…";
        /// 已主动断开
        case JobsOCWebSocketStateDisconnected:
            return @"已断开";
        /// 连接失败或重连次数耗尽
        case JobsOCWebSocketStateFailed:
            return @"连接失败";
    }
}

-(void)appendLog:(NSString *)message{
    @jobs_weakify(self)
    dispatch_main_async_safe((^{
        @jobs_strongify(self)
        NSString *oldText = self.logTextView.text ?: @"";
        NSString *prefix = oldText.length ? @"\n" : @"";
        NSString *text = [NSString stringWithFormat:@"%@%@[%@] %@",
                          oldText,
                          prefix,
                          [self.timeFormatter stringFromDate:NSDate.date],
                          message];
        self.logTextView
            .byText(text)
            .byScrollRangeToVisible(NSMakeRange(text.length ? text.length - 1 : 0,
                                                text.length ? 1 : 0));
    }))
}

-(UIButton *)buttonByTitle:(NSString *)title
                    action:(jobsByBtnBlock)action
           backgroundColor:(UIColor *)backgroundColor{
    return jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(title.tr)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(15))
            .jobsResetBtnTitleCor(UIColor.whiteColor)
            .jobsResetBtnBgCor(backgroundColor)
            .jobsResetBtnCornerRadiusValue(JobsWidth(8))
            .onClickBy(action);
    });
}
#pragma mark —— LazyLoad
-(UITextField *)endpointTF{
    if (!_endpointTF) {
        @jobs_weakify(self)
        _endpointTF = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            textField
                .byText(JobsWebSocketDemoDefaultEndpoint)
                .byPlaceholder(@"请输入 ws:// 或 wss:// 地址".tr)
                .byTextCor(UIColor.labelColor)
                .byFont(UIFontWeightRegularSize(14))
                .byBorderStyle(UITextBorderStyleRoundedRect)
                .byKeyboardType(UIKeyboardTypeURL)
                .byClearButtonMode(UITextFieldViewModeWhileEditing)
                .byAutocorrectionType(UITextAutocorrectionTypeNo)
                .byAutocapitalizationType(UITextAutocapitalizationTypeNone)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(JobsWidth(64));
                    make.left.right.equalTo(self.view).inset(JobsWidth(16));
                    make.height.mas_equalTo(JobsWidth(44));
                });
        });
    };return _endpointTF;
}

-(UIButton *)connectBtn{
    if (!_connectBtn) {
        @jobs_weakify(self)
        _connectBtn = [self buttonByTitle:@"连接"
                                   action:^(__kindof UIButton * _Nullable button) {
            [weak_self connectWebSocket];
        }
                          backgroundColor:UIColor.systemBlueColor];
        _connectBtn.addOn(self.view);
        [_connectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.endpointTF.mas_bottom).offset(JobsWidth(10));
            make.left.equalTo(self.endpointTF);
            make.height.mas_equalTo(JobsWidth(42));
        }];
    };return _connectBtn;
}

-(UIButton *)disconnectBtn{
    if (!_disconnectBtn) {
        @jobs_weakify(self)
        _disconnectBtn = [self buttonByTitle:@"断开"
                                      action:^(__kindof UIButton * _Nullable button) {
            [weak_self disconnectWebSocket];
        }
                             backgroundColor:UIColor.systemGrayColor];
        _disconnectBtn.addOn(self.view);
        [_disconnectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.width.height.equalTo(self.connectBtn);
            make.left.equalTo(self.connectBtn.mas_right).offset(JobsWidth(10));
        }];
    };return _disconnectBtn;
}

-(UIButton *)sendBtn{
    if (!_sendBtn) {
        @jobs_weakify(self)
        _sendBtn = [self buttonByTitle:@"发送"
                                action:^(__kindof UIButton * _Nullable button) {
            [weak_self sendMessage];
        }
                       backgroundColor:UIColor.systemGreenColor];
        _sendBtn.addOn(self.view);
        [_sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.width.height.equalTo(self.connectBtn);
            make.left.equalTo(self.disconnectBtn.mas_right).offset(JobsWidth(10));
            make.right.equalTo(self.endpointTF);
            make.width.equalTo(self.disconnectBtn);
        }];
    };return _sendBtn;
}

-(UITextField *)messageTF{
    if (!_messageTF) {
        @jobs_weakify(self)
        _messageTF = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            textField
                .byText(@"Hello WebSocket")
                .byPlaceholder(@"输入要发送的文本消息".tr)
                .byTextCor(UIColor.labelColor)
                .byFont(UIFontWeightRegularSize(14))
                .byBorderStyle(UITextBorderStyleRoundedRect)
                .byClearButtonMode(UITextFieldViewModeWhileEditing)
                .byAutocorrectionType(UITextAutocorrectionTypeNo)
                .byAutocapitalizationType(UITextAutocapitalizationTypeNone)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.connectBtn.mas_bottom).offset(JobsWidth(10));
                    make.left.right.equalTo(self.endpointTF);
                    make.height.mas_equalTo(JobsWidth(44));
                });
        });
    };return _messageTF;
}

-(UILabel *)statusLab{
    if (!_statusLab) {
        @jobs_weakify(self)
        _statusLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"状态：未连接".tr)
                .byTextCor(UIColor.secondaryLabelColor)
                .byFont(UIFontWeightMediumSize(14))
                .byNumberOfLines(0)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.messageTF.mas_bottom).offset(JobsWidth(12));
                    make.left.right.equalTo(self.endpointTF);
                });
        });
    };return _statusLab;
}

-(UITextView *)logTextView{
    if (!_logTextView) {
        @jobs_weakify(self)
        _logTextView = jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
            textView
                .byText(@"操作日志".tr)
                .byEditable(NO)
                .byFont(UIFontMonospacedSystemWeightRegularSize(13))
                .byTextCor(UIColor.labelColor)
                .byBgColor(UIColor.secondarySystemBackgroundColor)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(10))
                        .byMasksToBounds(YES);
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.statusLab.mas_bottom).offset(JobsWidth(10));
                    make.left.right.equalTo(self.endpointTF);
                    make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-JobsWidth(12));
                });
        });
    };return _logTextView;
}

-(NSDateFormatter *)timeFormatter{
    if (!_timeFormatter) {
        _timeFormatter = NSDateFormatter.new;
        _timeFormatter.dateFormat = @"HH:mm:ss";
    };return _timeFormatter;
}

-(JobsOCWebSocketClient *)client{
    if (!_client) {
        _client = JobsOCWebSocketClient.new;
        _client.delegate = self;
    };return _client;
}

@end
