//
//  UIButton+Timer.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "NSObject+NSMutableParagraphStyle.h"
#import "NSObject+Extra.h"
#import "NSMutableArray+Extra.h"
#import "UIButton+UI.h"
#import "UIButton+UIButtonConfiguration.h"
#import "UIView+Extra.h"

#import "JobsBaseProtocolHeader.h"
#import "JobsRichTextUtils.h"
#import "JobsTimeUtils.h"
#import "JobsRichTextUtils.h"
#import "JobsOCTimer.h"
#import "JobsMakes.h"
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

NS_ASSUME_NONNULL_BEGIN
///（时间）文本@显示类型
#ifndef CEQUENCE_FOR_SHOW_TITLE_RUNING_STR_TYPE_DEFINED
#define CEQUENCE_FOR_SHOW_TITLE_RUNING_STR_TYPE_DEFINED

#import <objc/runtime.h>
typedef NS_ENUM(NSUInteger, CequenceForShowTitleRuningStrType) {
    CequenceForShowTitleRuningStrType_front = 0, // TitleRuningStr 在前 | 首在前
    CequenceForShowTitleRuningStrType_tail       // TitleRuningStr 在后 | 首在后
};
#endif /* CEQUENCE_FOR_SHOW_TITLE_RUNING_STR_TYPE_DEFINED */

@interface UIButton (Timer)<BaseProtocol,BaseButtonProtocol,TimerProtocol>
/// ❤️如果配置了富文本，则优先显示富文本属性
#pragma mark —— 一些通用的设置
Prop_assign()ShowTimeType showTimeType;
                                             // 时间@显示风格
Prop_assign()CequenceForShowTitleRuningStrType cequenceForShowTitleRuningStrType;   //（时间）文本@显示类型
Prop_assign()UILabelShowingType labelShowingType;
Prop_assign()CGFloat widthCompensationValue;
                                        // 因为有圆角的时候需要有补偿值否则UI很难看
/// 计时器运行期间，按钮是否允许点击
Prop_assign()BOOL isCanBeClickWhenTimerCycle;

#pragma mark —— 时间相关方法【开启定时器】
/// 1、开启计时【用初始化时间】
-(JobsRetBtnByVoidBlock _Nonnull)startTimer;
/// 2、开启计时【从某个时间】
-(JobsRetBtnByNSIntegerBlock _Nonnull)startTimerBy;
#pragma mark —— 时间相关方法【定时器暂停】
-(JobsRetBtnByVoidBlock _Nonnull)timerSuspend;
#pragma mark —— 时间相关方法【定时器继续】
-(JobsRetBtnByVoidBlock _Nonnull)timerContinue;
#pragma mark —— 时间相关方法【定时器销毁】
-(JobsRetBtnByVoidBlock _Nonnull)timerDestroy;

-(JobsRetBtnByNSUIntegerBlock _Nonnull)byTimerType;
-(JobsRetBtnByNSUIntegerBlock _Nonnull)byTimerStyle;
-(JobsRetBtnByDoubleBlock _Nonnull)byTimeInterval;
-(JobsRetBtnByDoubleBlock _Nonnull)byStartTime;
-(JobsRetBtnByBOOLBlock _Nonnull)byClickWhenTimerCycle;

@end

NS_ASSUME_NONNULL_END
