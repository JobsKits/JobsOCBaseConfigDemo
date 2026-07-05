//
//  JobsBitsMonitorSuspendLab.m
//  JobsBitsMonitor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsBitsMonitorSuspendLab.h"

@interface JobsBitsMonitorSuspendLab ()
/// Data
Prop_strong()NSMutableArray <NSString *>*operationEnvironMutArr;

@end

@implementation JobsBitsMonitorSuspendLab

-(void)dealloc{
    JobsRemoveNotification(self);
}

-(instancetype)initBy:(JobsBitsMonitorDisplayStyle)style{
    if (self = [super init]) {
        if(style == JobsBitsMonitorDisplayStylePlainText)        {
            JobsNetworkTrafficMonitor.shared.onUpdateBy(^(JobsNetworkSource *source,
                                                          uint64_t uploadBytesPerSec,
                                                          uint64_t downloadBytesPerSec){
                NSString *upStr   = JobsFormatSpeed(uploadBytesPerSec);
                NSString *downStr = JobsFormatSpeed(downloadBytesPerSec);
                NSString *text = source.displayName.add(JobsNewline).add(@"⬆︎").add(upStr).add(JobsSpace).add(@"⬆︎").add(downStr);
                @jobs_weakify(self)
                dispatch_async(dispatch_get_main_queue(), ^{
                    @jobs_strongify(self)
                    self.byText(text);
                });
            }).byStartWithInterval(1.0);
        }else{
            JobsNetworkTrafficMonitor.shared.onUpdateBy(^(JobsNetworkSource *source,
                                                          uint64_t uploadBytesPerSec,
                                                          uint64_t downloadBytesPerSec){
                NSString *upStr   = JobsFormatSpeed(uploadBytesPerSec);
                NSString *downStr = JobsFormatSpeed(downloadBytesPerSec);
                /// 公共段落样式：居中 + 行距 2
                NSMutableParagraphStyle *ps = jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data2) {
                    data2.byAlignment(NSTextAlignmentCenter)
                        .byLineSpacing(2.0);
                });
                /// ✅ 用你自己的富文本 DSL 来拼装
                NSAttributedString *attr =
                self.richTextWithDataConfigMutArr(jobsMakeMutArr(^(__kindof NSMutableArray<JobsRichTextConfig *> * _Nullable data) {
                    /// "源: "
                    data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable cfg) {
                        cfg.byFont([UIFont systemFontOfSize:10 weight:UIFontWeightMedium])
                           .byTextCor(UIColor.secondaryLabelColor)
                           .byTargetString(@"源: ")
                           .byParagraphStyle(ps);
                    }));
                    /// 源名称
                    data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable cfg) {
                        cfg.byFont([UIFont systemFontOfSize:11 weight:UIFontWeightSemibold])
                           .byTextCor(UIColor.whiteColor)
                           .byTargetString(source.displayName)
                           .byParagraphStyle(ps);
                    }));
                    /// 换行
                    data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable cfg) {
                        cfg.byTargetString(JobsNewline)
                           .byParagraphStyle(ps);
                    }));
                    /// 上行 "⬆︎ "
                    data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable cfg) {
                        cfg.byFont([UIFont systemFontOfSize:11])
                           .byTextCor(UIColor.systemGreenColor)
                           .byTargetString(@"⬆︎ ")
                           .byParagraphStyle(ps);
                    }));
                    /// 上行数值（带两个空格）
                    data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable cfg) {
                        cfg.byFont([UIFont monospacedDigitSystemFontOfSize:11 weight:UIFontWeightMedium])
                           .byTextCor(UIColor.whiteColor)
                           .byTargetString(upStr.add(@"  "))
                           .byParagraphStyle(ps);
                    }));
                    /// 下行 "⬇︎ "
                    data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable cfg) {
                        cfg.byFont([UIFont systemFontOfSize:11])
                           .byTextCor(UIColor.systemRedColor)
                           .byTargetString(@"⬇︎ ")
                           .byParagraphStyle(ps);
                    }));
                    /// 下行数值
                    data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable cfg) {
                        cfg.byFont([UIFont monospacedDigitSystemFontOfSize:11 weight:UIFontWeightMedium])
                           .byTextCor(UIColor.whiteColor)
                           .byTargetString(downStr)
                           .byParagraphStyle(ps);
                    }));
                }));
                @jobs_weakify(self)
                dispatch_async(dispatch_get_main_queue(), ^{
                    @jobs_strongify(self)
                    self.byAttributedString(attr);
                });
            }).byStartWithInterval(1.0);
        }

        {
            self.numberOfTouchesRequired = 1;
            self.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
            self.minimumPressDuration = 0.1;
            self.allowableMovement = 1;
            self.userInteractionEnabled = YES;
            @jobs_weakify(self)
            self.weak_target = weak_self;
            self.tapGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                               UITapGestureRecognizer *_Nullable arg) {
                @jobs_strongify(self)
                ZWPullMenuView *menuView = [ZWPullMenuView pullMenuAnchorView:self titleArray:self.operationEnvironMutArr];
                @jobs_weakify(self)
                menuView.blockSelectedMenu = ^(NSInteger menuRow) {
                    @jobs_strongify(self)
                    JobsLog(@"action----->%ld",(long)menuRow);
                    networkingEnvir(menuRow);
                    if (menuRow + 1 <= self.operationEnvironMutArr.count) {
                        @"当前环境".tr.add(self.operationEnvironMutArr[menuRow]).toast();
                    }else self.jobsToastErrMsg(@"切换环境出现错误".tr);
                };return nil;
            }];self.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
        };[self commonInit_JobsBitsMonitorSuspendLab];
    };return self;
}

-(void)commonInit_JobsBitsMonitorSuspendLab{
    /// 👉 基础外观
    self.numberOfLines   = 0;
    self.textAlignment   = NSTextAlignmentCenter;
    self.layer.cornerRadius  = 8.0;
    self.layer.masksToBounds = YES;
    self.byBgColor([UIColor.blackColor colorWithAlphaComponent:0.7]);

    /// 默认字体 & 颜色
    self.textColor = UIColor.whiteColor;
    self.font      = [UIFont monospacedDigitSystemFontOfSize:11 weight:UIFontWeightMedium];
}

-(JobsRetLabelByTextBlock _Nonnull)byText{
    @jobs_weakify(self)
    return ^__kindof JobsBitsMonitorSuspendLab *_Nullable(__kindof NSString *_Nullable text){
        @jobs_strongify(self)
        self.attributedText = nil;
        self.text           = text;
        /// 普通文本可以稍微简单一点
        self.font      = [UIFont systemFontOfSize:11 weight:UIFontWeightRegular];
        self.textColor = UIColor.whiteColor;
        return self;
    };
}

-(JobsRetLabelByAttributedStringBlock _Nonnull)byAttributedString{
    @jobs_weakify(self)
    return ^__kindof JobsBitsMonitorSuspendLab *_Nullable(__kindof NSAttributedString *_Nullable attributedString){
        @jobs_strongify(self)
        self.text         = nil;
        self.attributedText = attributedString;
        /// 字体、颜色都由外部富文本控制，这里不再动它
        return self;
    };
}
#pragma mark —— 一些私有方法
/// 格式化工具（对应 jobs_formatSpeed）
static NSString * _Nonnull JobsFormatSpeed(uint64_t bytesPerSec) {
    if (bytesPerSec < 1024) {
        return [NSString stringWithFormat:@"%llu B/s", bytesPerSec];
    } else if (bytesPerSec < 1024 * 1024) {
        double kb = (double)bytesPerSec / 1024.0;
        return [NSString stringWithFormat:@"%.1f KB/s", kb];
    } else {
        double mb = (double)bytesPerSec / 1024.0 / 1024.0;
        return [NSString stringWithFormat:@"%.2f MB/s", mb];
    }
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetFrameByIDBlock _Nonnull)viewFrameByModel{
    return ^CGRect(id _Nullable data){
        return CGRectMake(JobsWidth(20),
                          JobsMainScreen_HEIGHT() - JobsWidth(200),
                          JobsWidth(140),
                          JobsWidth(40));
    };
}
#pragma mark —— lazyLoad
-(NSMutableArray<NSString *> *)operationEnvironMutArr{
    if (!_operationEnvironMutArr) {
        _operationEnvironMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>* _Nullable data) {
            data.add(@"开发环境_01".tr)
            .add(@"开发环境_02".tr)
            .add(@"开发环境_03".tr)
            .add(@"开发环境_04".tr)
            .add(@"测试环境".tr)
            .add(@"UAT环境".tr)
            .add(@"生产环境".tr);
        });
    };return _operationEnvironMutArr;
}

@end
