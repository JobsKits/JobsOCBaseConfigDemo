//
//  JobsObject.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsObject_h
#define JobsObject_h
#pragma mark —— Category【Sys.】
/// 弹框提示退出登录清空本地用户数据
#import <JobsByOCPods/NSObject+PopViewToLogOut.h>

/// 本地推送通知封装
#import <JobsByOCPods/NSObject+UserNotifications.h>
/// App更改图标
#import <JobsByOCPods/NSObject+ChangeAppicon.h>
/// 正则表达式鉴定
#import <JobsByOCPods/NSObject+RegularExpression.h>
/// 一些其他的拓展
#import <JobsByOCPods/NSObject+Extra.h>
/// 测量数据
#import <JobsByOCPods/NSObject+Measure.h>
/// 线程定义
#import <JobsByOCPods/NSObject+Queue.h>
/// 全局的通知定义
#import <JobsByOCPods/NSObject+Notification.h>
/// 打开URL
#import <JobsByOCPods/NSObject+OpenURL.h>
/// 路径获取
#import <JobsByOCPods/NSObject+Path.h>
/// 振动反馈
#import <JobsByOCPods/NSObject+Shake.h>
/// 声音反馈
#import <JobsByOCPods/NSObject+Sound.h>
/// 用户信息
#import <JobsByOCPods/NSObject+UsrInfo.h>
/// UIScrollViewDelegate 协议
#import <JobsByOCPods/NSObject+UIScrollViewDelegate.h>
/// Cell 部署策略
#import <JobsByOCPods/NSObject+JobsDeployCellConfig.h>
/// 文本对齐
#import <JobsByOCPods/NSObject+NSMutableParagraphStyle.h>
/// 关于数据
#import <JobsByOCPods/NSObject+Data.h>
/// 关于算法
#import <JobsByOCPods/NSObject+Algorithm.h>
/// 处理 HTML 字符串
#import <JobsByOCPods/NSObject+HTML.h>
/// 获取图片
#import <JobsByOCPods/NSObject+image.h>
/// 定时器
#if __has_include(<JobsOCTimer/JobsTimer.h>)
#import <JobsOCTimer/JobsTimer.h>
#else
#import "JobsTimer.h"
#endif
/// 弹窗
#if __has_include(<WHToastExtra/WHToastExtra.h>)
#import <WHToastExtra/WHToastExtra.h>
#else
#import "WHToastExtra.h"
#endif
/// 取随机
#if __has_include(<JobsRandomUtils/JobsRandomUtils.h>)
#import <JobsRandomUtils/JobsRandomUtils.h>
#else
#import "JobsRandomUtils.h"
#endif

#if __has_include(<BRPickerViewExtra/BRPickerViewExtra.h>)
#import <BRPickerViewExtra/BRPickerViewExtra.h>
#else
#import "BRPickerViewExtra.h"
#endif

#if __has_include(<JobsOCRuntimeKits/JobsOCRuntimeKits.h>)
#import <JobsOCRuntimeKits/JobsOCRuntimeKits.h>
#else
#import "JobsOCRuntimeKits.h"
#endif

#endif /* JobsObject_h */
