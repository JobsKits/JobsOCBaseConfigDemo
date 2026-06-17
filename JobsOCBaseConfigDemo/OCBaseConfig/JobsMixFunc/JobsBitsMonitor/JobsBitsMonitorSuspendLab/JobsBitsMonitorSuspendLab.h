//
//  JobsBitsMonitorSuspendLab.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2020/12/13.
//

#import "JobsBlock.h"
#import "JobsSuspendLab.h"
#import "JobsNetWorkTools.h"
#import "NSObject+WHToast.h"
#import "JobsDefineEnums.h"
#import "UILabel+Extra.h"
#import "JobsDefineProperty.h"

#if __has_include(<ZWPullMenuView/ZWPullMenuView.h>)
#import <ZWPullMenuView/ZWPullMenuView.h>
#else
#import "ZWPullMenuView.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 显示风格：普通字符串 / 富文本
typedef NS_ENUM(NSUInteger, JobsBitsMonitorDisplayStyle) {
    JobsBitsMonitorDisplayStylePlainText = 0,
    JobsBitsMonitorDisplayStyleRichText
};

@interface JobsBitsMonitorSuspendLab : JobsSuspendLab

-(JobsRetLabelByTextBlock _Nonnull)byText;
-(JobsRetLabelByAttributedStringBlock _Nonnull)byAttributedString;

+(instancetype)new NS_UNAVAILABLE; // 禁止用 +new
-(instancetype)init NS_UNAVAILABLE; // 禁止用 -init
-(instancetype)initBy:(JobsBitsMonitorDisplayStyle)style;

@end

NS_ASSUME_NONNULL_END
