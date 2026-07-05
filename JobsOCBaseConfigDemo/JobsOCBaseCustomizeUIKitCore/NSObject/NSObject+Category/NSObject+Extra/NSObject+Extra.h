//
//  NSObject+Extra.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_EXTRA_7B07AF4A95
#define JOBS_HEADER_GUARD_NSOBJECT_EXTRA_7B07AF4A95

#pragma once

#import <objc/message.h>
#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h> // 用于调用系统级音频能力。
#import "UIColor+Extra.h"
#import "NSString+Extra.h"
#import "UIImpactFeedbackGenerator+Extra.h"
#import "NSString+Sys.h"

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#import "WHToastExtra.h"

#import "JobsMakes.h"

#import "JobsModelDSL.h"

#import "JobsOCDSL.h"

#import "JobsStringUtilsHeader.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Extra)

Prop_strong()UIViewModel *viewModel;
/// 获取本地普通图像
Prop_strong(readonly,nullable)UIImage *img;    // -(nullable UIImage *)img;
/// NSBundle
+(NSBundle *_Nullable)mainBundle;
/// NSLocale
+(NSLocale *_Nullable)currentLocale;
/// UIDevice
+(UIDevice *_Nullable)currentDevice;
/// 震动特效反馈
+(jobsByViewBlock _Nonnull)feedbackGenerator;
/// 播放自定义本地声音
/// fileName 全文件名 包含后缀
-(jobsByStrBlock)playSoundEffect;
-(JobsRetImageByStrBlock _Nonnull)imageByDataURL;
-(UIColor *)cor;
/// 导航返回键的配置
-(UIButtonModel *)makeBackBtnModel;
/// 返回按钮点击方法
-(jobsByBtnBlock _Nonnull)jobsBackBtnClickEvent;
-(JobsRetIDByDataBlock _Nonnull)JSONkNilOptions;
-(JobsRetIDByDataBlock _Nonnull)JSONReadingMutableContainers;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_EXTRA_7B07AF4A95 */
