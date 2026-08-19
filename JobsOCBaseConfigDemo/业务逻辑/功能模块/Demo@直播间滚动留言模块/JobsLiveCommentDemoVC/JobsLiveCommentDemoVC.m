//
//  JobsLiveCommentDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsLiveCommentDemoVC.h"

@interface JobsLiveCommentDemoVC ()

Prop_strong()UITableView *liveTableView;
Prop_strong()JobsLiveInputBar *inputBar;
Prop_strong()NSMutableArray <NSString *>*messageMutArr;

-(jobsByStrBlock _Nonnull)appendMessage;
-(jobsByVoidBlock _Nonnull)configKeyboardManager;
-(jobsByVoidBlock _Nonnull)sendCurrentText;
-(jobsByBOOLBlock _Nonnull)scrollToBottomAnimated;

@end

@implementation JobsLiveCommentDemoVC
-(void)dealloc{
    ((JobsOCKeyboardMgr *)JobsOCKeyboardMgr.shared()).clearConfigByOwner(self);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLiveCommentDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
            if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byText(@"直播间留言".jobsTr())
                    .byFont(UIFontWeightRegularSize(18));
            })
            .byBgCor(UIColor.systemBackgroundColor)
            .byNavBgCor(UIColor.systemBackgroundColor);
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLiveCommentDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.makeNavByAlpha(1);
        self.view.byBgColor(UIColor.systemBackgroundColor);
        self.inputBar.byAlpha(1);
        self.liveTableView.byAlpha(1);
        self.scrollToBottomAnimated(NO);
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLiveCommentDemoVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
        self.configKeyboardManager();
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLiveCommentDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        ((JobsOCKeyboardMgr *)JobsOCKeyboardMgr.shared()).clearConfigByOwner(self);
    };
}
#pragma mark —— Config
-(jobsByVoidBlock _Nonnull)configKeyboardManager{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        ((JobsOCKeyboardMgr *)JobsOCKeyboardMgr.shared()).byConfig(jobsMakeOCKeyboardConfig(^(__kindof JobsOCKeyboardConfig * _Nullable config) {
            @jobs_strongify(self)
            config
                .byOwner(self)
                .byTargetView(self.inputBar)
                .byTriggerScopeView(self.inputBar)
                .byContainerView(self.view)
                .byFollowViews(@[self.liveTableView])
                .byInputFields(@[self.inputBar.textField])
                .byExtraSpacing(JobsWidth(8))
                .byTopSpacing(JobsWidth(12))
                .byShouldResignOnTouchOutside(NO)
                .byAccessoryPolicy(JobsOCKeyboardAccessoryPolicyIgnore)
                .byResultBlock(^(__kindof JobsOCKeyboardResult * _Nullable result) {
                    if (result.keyboardVisible) weak_self.scrollToBottomAnimated(NO);
                });
        }));
    };
}
#pragma mark —— Action
-(jobsByVoidBlock _Nonnull)sendCurrentText{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSString *raw = self.inputBar.textField.text ?: @"";
        NSString *text = [raw stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
        if (!text.length) return;
        self.appendMessage(text);
        self.inputBar.clearTextIfNeeded();
    };
}

-(jobsByStrBlock _Nonnull)appendMessage{
    @jobs_weakify(self)
    return ^(NSString * text){
        @jobs_strongify(self)
        if (!self) return;
        NSInteger newRow = self.messageMutArr.count;
        [self.messageMutArr addObject:text];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRow
                                                    inSection:0];
        [self.liveTableView performBatchUpdates:^{
            [self.liveTableView insertRowsAtIndexPaths:@[indexPath]
                                      withRowAnimation:UITableViewRowAnimationNone];
        } completion:^(__unused BOOL finished) {
            [self.liveTableView layoutIfNeeded];
            self.scrollToBottomAnimated(NO);
            JobsLiveMsgCell *cell = (JobsLiveMsgCell *)[self.liveTableView cellForRowAtIndexPath:indexPath];
            if ([cell isKindOfClass:JobsLiveMsgCell.class]) {
                cell.playAppearAnimation();
            }else{
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    JobsLiveMsgCell *delayedCell = (JobsLiveMsgCell *)[self.liveTableView cellForRowAtIndexPath:indexPath];
                    if ([delayedCell isKindOfClass:JobsLiveMsgCell.class]) delayedCell.playAppearAnimation();
                });
            }
        }];
    };
}

-(jobsByBOOLBlock _Nonnull)scrollToBottomAnimated{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.messageMutArr.count) return;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.messageMutArr.count - 1
                                                    inSection:0];
        [self.liveTableView scrollToRowAtIndexPath:indexPath
                                  atScrollPosition:UITableViewScrollPositionBottom
                                          animated:animated];
    };
}
#pragma mark —— UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    JobsRetBOOLByUITextFieldBlock action = ((JobsRetBOOLByUITextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLiveCommentDemoVC.class, @selector(jobsTextFieldShouldReturn)))(self, @selector(jobsTextFieldShouldReturn));
    return action ? action(textField) : NO;
}

-(JobsRetBOOLByUITextFieldBlock _Nonnull)jobsTextFieldShouldReturn{
    @jobs_weakify(self)
    return ^BOOL(UITextField * textField){
        @jobs_strongify(self)
        if (!self) return NO;
        self.sendCurrentText();
        return YES;
    };
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
    JobsLiveMsgCell *cell = [tableView dequeueReusableCellWithIdentifier:[JobsLiveMsgCell reuseIdentifier]()
                                                            forIndexPath:indexPath];
    cell.configureWithText(self.messageMutArr[indexPath.row]);
    return cell;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:YES];
}
#pragma mark —— LazyLoad
-(JobsLiveInputBar *)inputBar{
    if (!_inputBar) {
        @jobs_weakify(self)
        _inputBar = JobsLiveInputBar.new;
        _inputBar.textField.byDelegate(self);
        _inputBar.sendButton.onClickBy(^(__kindof UIButton * _Nullable button) {
            weak_self.sendCurrentText();
        });
        _inputBar
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.view);
                make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-JobsWidth(6));
                make.height.mas_equalTo(JobsWidth(64));
            });
    };return _inputBar;
}

-(UITableView *)liveTableView{
    if (!_liveTableView) {
        _liveTableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            tableView.registerTableViewCellClass(JobsLiveMsgCell.class, @"")

                .byDataSource(self)
                .byDelegate(self)
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .byKeyboardDismissMode(UIScrollViewKeyboardDismissModeInteractive)
                .byBgColor(UIColor.clearColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self.view);
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(10));
                    make.bottom.equalTo(self.inputBar.mas_top);
                });
        });
    };return _liveTableView;
}

-(NSMutableArray<NSString *> *)messageMutArr{
    if (!_messageMutArr) {
        _messageMutArr = [NSMutableArray arrayWithArray:@[
            @"欢迎来到直播间～".jobsTr(),
            @"礼貌发言，气氛更好".jobsTr()
        ]];
    };return _messageMutArr;
}

@end
