//
//  JobsLiveCommentDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsLiveCommentDemoVC.h"

@interface JobsLiveCommentDemoVC ()

Prop_strong()UITableView *tableView;
Prop_strong()JobsLiveInputBar *inputBar;
Prop_strong()NSMutableArray <NSString *>*messageMutArr;

-(void)appendMessage:(NSString *)text;
-(void)sendCurrentText;
-(void)scrollToBottomAnimated:(BOOL)animated;

@end

@implementation JobsLiveCommentDemoVC
@synthesize tableView = _tableView;
@synthesize inputBar = _inputBar;
@synthesize messageMutArr = _messageMutArr;

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
            data.byText(@"直播间留言".tr);
            data.byFont(UIFontWeightRegularSize(18));
        })
        .byBgCor(UIColor.systemBackgroundColor)
        .byNavBgCor(UIColor.systemBackgroundColor);
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.backgroundColor = UIColor.systemBackgroundColor;
    self.inputBar.alpha = 1;
    self.tableView.alpha = 1;
    [self scrollToBottomAnimated:NO];
}
#pragma mark —— Action
-(void)sendCurrentText{
    NSString *raw = self.inputBar.textField.text ?: @"";
    NSString *text = [raw stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    if (!text.length) return;
    [self appendMessage:text];
    [self.inputBar clearTextIfNeeded];
}

-(void)appendMessage:(NSString *)text{
    NSInteger newRow = self.messageMutArr.count;
    [self.messageMutArr addObject:text];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRow
                                                inSection:0];
    [self.tableView performBatchUpdates:^{
        [self.tableView insertRowsAtIndexPaths:@[indexPath]
                              withRowAnimation:UITableViewRowAnimationNone];
    } completion:^(__unused BOOL finished) {
        [self.tableView layoutIfNeeded];
        [self scrollToBottomAnimated:NO];
        JobsLiveMsgCell *cell = (JobsLiveMsgCell *)[self.tableView cellForRowAtIndexPath:indexPath];
        if ([cell isKindOfClass:JobsLiveMsgCell.class]) {
            [cell playAppearAnimation];
        }else{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                JobsLiveMsgCell *delayedCell = (JobsLiveMsgCell *)[self.tableView cellForRowAtIndexPath:indexPath];
                if ([delayedCell isKindOfClass:JobsLiveMsgCell.class]) [delayedCell playAppearAnimation];
            });
        }
    }];
}

-(void)scrollToBottomAnimated:(BOOL)animated{
    if (!self.messageMutArr.count) return;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.messageMutArr.count - 1
                                                inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath
                          atScrollPosition:UITableViewScrollPositionBottom
                                  animated:animated];
}
#pragma mark —— UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self sendCurrentText];
    return YES;
}
#pragma mark —— UITableViewDelegate, UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.messageMutArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView
estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(48);
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsLiveMsgCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsLiveMsgCell.reuseIdentifier
                                                            forIndexPath:indexPath];
    [cell configureWithText:self.messageMutArr[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:YES];
}
#pragma mark —— LazyLoad
-(JobsLiveInputBar *)inputBar{
    if (!_inputBar) {
        _inputBar = JobsLiveInputBar.new;
        _inputBar.textField.delegate = self;
        [_inputBar.sendButton addTarget:self
                                 action:@selector(sendCurrentText)
                       forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_inputBar];
        [_inputBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-JobsWidth(8));
            make.height.mas_equalTo(JobsWidth(56));
        }];
    };return _inputBar;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView.alloc initWithFrame:CGRectZero
                                                style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
        _tableView.backgroundColor = UIColor.clearColor;
        [_tableView registerClass:JobsLiveMsgCell.class
           forCellReuseIdentifier:JobsLiveMsgCell.reuseIdentifier];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(10));
            make.bottom.equalTo(self.inputBar.mas_top);
        }];
    };return _tableView;
}

-(NSMutableArray<NSString *> *)messageMutArr{
    if (!_messageMutArr) {
        _messageMutArr = [NSMutableArray arrayWithArray:@[
            @"欢迎来到直播间～".tr,
            @"礼貌发言，气氛更好".tr
        ]];
    };return _messageMutArr;
}

@end
