//
//  NSObject+Extra.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_EXTRA_7B07AF4A95
#define JOBS_HEADER_GUARD_NSOBJECT_EXTRA_7B07AF4A95

#pragma once

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h> // 用于调用系统级音频能力。
#import <objc/runtime.h>
#import <JobsBasePopupView/UIColor+Extra.h>
#import <JobsBasePopupView/NSString+Extra.h>
#import <JobsBasePopupView/UIImpactFeedbackGenerator+Extra.h>

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#if __has_include(<WHToastExtra/WHToastExtra.h>)
#import <WHToastExtra/WHToastExtra.h>
#else
#import "WHToastExtra.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

#if __has_include(<JobsStringUtils/JobsStringUtils.h>)
#import <JobsStringUtils/JobsStringUtils.h>
#else
#import "JobsStringUtils.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

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
/// 导航返回键的配置
-(UIButtonModel *)makeBackBtnModel;
/// 返回按钮点击方法
-(jobsByBtnBlock _Nonnull)jobsBackBtnClickEvent;
-(JobsRetIDByDataBlock _Nonnull)JSONkNilOptions;
-(JobsRetIDByDataBlock _Nonnull)JSONReadingMutableContainers;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_EXTRA_7B07AF4A95 */
