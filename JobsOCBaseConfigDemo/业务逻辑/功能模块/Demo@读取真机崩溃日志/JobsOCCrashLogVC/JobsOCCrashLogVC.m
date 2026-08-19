//
//  JobsOCCrashLogVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import "JobsOCCrashLogVC.h"

@interface JobsOCCrashLogVC ()

Prop_strong()UITextView *logTextView;
Prop_strong()UIButton *copyButton;
Prop_strong()UIButton *clearButton;
Prop_strong()UIButton *refreshButton;

-(jobsByVoidBlock _Nonnull)reloadLog;
-(JobsRetStrByVoidBlock _Nonnull)headerText;
-(JobsRetImageByStrBlock _Nonnull)buttonImageBySystemName;

@end

@implementation JobsOCCrashLogVC

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCCrashLogVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                NSString *title = data.attributedTitle.string;
                data.byText(isValue(title) ? title : @"崩溃日志".jobsTr())
                    .byTextCor(JobsLabelColor)
                    .byFont(UIFontWeightRegularSize(16));
            })
            .byBgCor(JobsSystemBackgroundColor)
            .byNavBgCor(JobsSystemBackgroundColor)
            .byNavBgImage(@"".img);
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCCrashLogVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.byRightBarButtonItems(jobsMakeMutArr(^(__kindof NSMutableArray<UIBarButtonItem *> * _Nullable data) {
            data.add(self.copyButton.barBtnItem)
                .add(self.clearButton.barBtnItem)
                .add(self.refreshButton.barBtnItem);
        }));
        self.byGKNavItemRightSpace(JobsWidth(8));
        self.makeNavByAlpha(1);
        self.logTextView.byAlpha(1);
        self.reloadLog();
    };
}

#pragma mark —— Actions
-(jobsByVoidBlock _Nonnull)reloadLog{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSString *content = ((JobsOCCrashLogCenter *)JobsOCCrashLogCenter.jobsSharedManager()).readTailByKilobytes(512);
        self.logTextView
            .byText(self.headerText().add(content ?: @""))
            .byScrollRangeToVisible(NSMakeRange(0, 0));
    };
}

-(JobsRetStrByVoidBlock _Nonnull)headerText{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        JobsOCCrashLogCenter *center = ((JobsOCCrashLogCenter *)JobsOCCrashLogCenter.jobsSharedManager());
        JobsOCCrashLogFileInfo *info = center.fileInfo();
        NSString *header = [NSString stringWithFormat:@"log: %@\nexists: %@\nsize: %lld bytes\n",
                            info.path,
                            info.exists ? @"YES" : @"NO",
                            info.sizeBytes];
        if (info.modificationDate) {
            header = header.add([NSString stringWithFormat:@"mtime: %@\n",info.modificationDate]);
        }
        header = header.add([NSString stringWithFormat:@"didCrashLastRun: %@\n",
                             center.didCrashLastRun() ? @"YES" : @"NO"]);
        JobsOCCrashLogMemorySnapshot *memory = center.latestMemorySnapshot();
        if (memory) {
            header = header.add([NSString stringWithFormat:@"memory: %.1f MB (peak %.1f MB, growth %+.1f MB)\nscreen: %@\n",
                                 (double)memory.footprintBytes / 1024.0 / 1024.0,
                                 (double)memory.peakFootprintBytes / 1024.0 / 1024.0,
                                 (double)memory.growthBytes / 1024.0 / 1024.0,
                                 memory.screen]);
        };return header.add(@"\n");
    };
}

-(JobsRetImageByStrBlock _Nonnull)buttonImageBySystemName{
    @jobs_weakify(self)
    return ^UIImage *_Nullable(NSString * systemName){
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 13.0, *)) return systemName.sys_img;
        return nil;
    };
}

#pragma mark —— lazyLoad
-(UITextView *)logTextView{
    if (!_logTextView) {
        _logTextView = jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
            textView
                .byFont(UIFontSystemFontOfSize(14))
                .byTextCor(JobsLabelColor)
                .byEditable(NO)
                .bySelectable(YES)
                .byTextContainerInset(UIEdgeInsetsMake(JobsWidth(8),
                                                       JobsWidth(8),
                                                       JobsWidth(8),
                                                       JobsWidth(8)))
                .byAlwaysBounceVertical(YES)
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .byCornerRadius(JobsWidth(10))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(10));
                    make.left.equalTo(self.view).offset(JobsWidth(12));
                    make.right.equalTo(self.view).offset(-JobsWidth(12));
                    make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-JobsWidth(12));
                });
        });
    };return _logTextView;
}

-(UIButton *)copyButton{
    if (!_copyButton) {
        @jobs_weakify(self)
        UIImage *image = self.buttonImageBySystemName(@"doc.on.doc.fill");
        _copyButton = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnImage(image)
                .jobsResetBtnTitle(image ? @"" : @"复制".jobsTr())
                .jobsResetBtnTitleCor(JobsLabelColor)
                .jobsResetBtnTitleFont(UIFontWeightRegularSize(12))
                .jobsResetBtnBgCor(JobsClearColor)
                .onClickBy(^(__unused UIButton *x) {
                    @jobs_strongify(self)
                    jobsMakePasteboard(^(__kindof UIPasteboard * _Nullable pasteboard) {
                        pasteboard.byString(self.logTextView.text);
                    });
                    toastBy(@"复制日志成功✅".jobsTr());
                })
                .byTintColor(JobsLabelColor)
                .byFrame(CGRectMake(0, 0, JobsWidth(32), JobsWidth(32)));
        });
    };return _copyButton;
}

-(UIButton *)clearButton{
    if (!_clearButton) {
        @jobs_weakify(self)
        UIImage *image = self.buttonImageBySystemName(@"trash.fill");
        _clearButton = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnImage(image)
                .jobsResetBtnTitle(image ? @"" : @"清空".jobsTr())
                .jobsResetBtnTitleCor(JobsLabelColor)
                .jobsResetBtnTitleFont(UIFontWeightRegularSize(12))
                .jobsResetBtnBgCor(JobsClearColor)
                .onClickBy(^(__unused UIButton *x) {
                    @jobs_strongify(self)
                    NSString *message = nil;
                    BOOL success = (((JobsOCCrashLogCenter *)JobsOCCrashLogCenter.jobsSharedManager())).clearWithMessage(&message);
                    self.logTextView
                        .byText(message ?: @"")
                        .byScrollRangeToVisible(NSMakeRange(0, 0));
                    toastBy((success ? @"日志清理成功✅" : @"日志清理失败❌").jobsTr());
                })
                .byTintColor(JobsLabelColor)
                .byFrame(CGRectMake(0, 0, JobsWidth(32), JobsWidth(32)));
        });
    };return _clearButton;
}

-(UIButton *)refreshButton{
    if (!_refreshButton) {
        @jobs_weakify(self)
        UIImage *image = self.buttonImageBySystemName(@"arrow.clockwise");
        _refreshButton = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnImage(image)
                .jobsResetBtnTitle(image ? @"" : @"刷新".jobsTr())
                .jobsResetBtnTitleCor(JobsLabelColor)
                .jobsResetBtnTitleFont(UIFontWeightRegularSize(12))
                .jobsResetBtnBgCor(JobsClearColor)
                .onClickBy(^(__unused UIButton *x) {
                    @jobs_strongify(self)
                    self.reloadLog();
                })
                .byTintColor(JobsLabelColor)
                .byFrame(CGRectMake(0, 0, JobsWidth(32), JobsWidth(32)));
        });
    };return _refreshButton;
}

@end
