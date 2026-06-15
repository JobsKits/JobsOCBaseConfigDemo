//
//  NSObject+Extra.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_EXTRA_BAEF69118B
#define JOBS_HEADER_GUARD_NSOBJECT_EXTRA_BAEF69118B

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h> // 用于调用系统级音频能力。
#import <JobsNavBar/UIColor+Extra.h>
#import <JobsNavBar/NSString+Extra.h>
#import <JobsNavBar/UIImpactFeedbackGenerator+Extra.h>
#import <JobsNavBar/NSString+Check.h>
#import <JobsNavBar/UIButton+SimplyMake.h>
#import <JobsNavBar/JobsNavBarConfig.h>
#import <JobsNavBar/BaseButton.h>

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Extra)

Prop_strong()UIViewModel *viewModel;
/// 获取本地普通图像
Prop_strong(readonly,nullable)UIImage *img;    // -(nullable UIImage *)img;
/// 震动特效反馈
+(jobsByViewBlock _Nonnull)feedbackGenerator;
/// 播放自定义本地声音
/// fileName 全文件名 包含后缀
-(jobsByStrBlock)playSoundEffect;
-(JobsRetImageByStrBlock _Nonnull)imageByDataURL;
-(UIColor *)cor;
/// 导航返回键的配置
-(UIButtonModel *)makeBackBtnModel;
/// GKNavigationBar 返回按钮点击方法
///【子类需要覆写 】创建返回键的点击事件
-(jobsByBtnBlock _Nonnull)jobsBackBtnClickEvent;
/// KVC 的二次封装
-(jobsByKey_ValueBlock _Nonnull)jobsKVC;
-(JobsRetDataByStrBlock _Nonnull)initByContentsOfFile;
-(JobsRetIDByDataBlock _Nonnull)JSONkNilOptions;
-(JobsRetIDByDataBlock _Nonnull)JSONReadingMutableContainers;
-(JobsRetDataByDicBlock _Nonnull)JSONWritingPrettyPrinted;
/// 刷新控件的头部数据
-(MJRefreshConfigModel *_Nullable)mjHeaderDefaultConfig;
-(MJRefreshConfigModel *_Nonnull)refreshHeaderDataBy:(JobsRetIDByIDBlock _Nonnull)loadBlock;
/// 刷新控件的尾部数据
-(MJRefreshConfigModel *_Nullable)mjFooterDefaultConfig;
-(MJRefreshConfigModel *_Nonnull)refreshFooterDataBy:(JobsRetIDByIDBlock _Nonnull)loadBlock;
/// DeviceOrientation 检测屏幕方向
-(DeviceOrientation)getDeviceOrientation;
/// 设置返回按钮的文字（默认退回上一个页面）
-(JobsRetNavBarConfigByStringBlock _Nullable)makeNav0ByTitle;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_EXTRA_BAEF69118B */
