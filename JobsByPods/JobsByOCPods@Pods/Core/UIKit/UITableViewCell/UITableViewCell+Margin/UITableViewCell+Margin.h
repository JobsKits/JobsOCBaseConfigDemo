//
//  UITableViewCell+Margin.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITABLEVIEWCELL_MARGIN_72DB84A1BE
#define JOBS_HEADER_GUARD_UITABLEVIEWCELL_MARGIN_72DB84A1BE

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsByOCPods/NSObject+image.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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
/// 重设边距
@interface UITableViewCell (Margin)
<
BaseCellProtocol,
UIViewModelProtocol,
UITableViewCellProtocol
>
#pragma mark —— 一些公有的功能方法
/// 值打印
-(jobsByVoidBlock _Nonnull)printValue;
/// 修改 UITableViewCell 中默认子控件的frame 【方法一】
-(jobsByVoidBlock _Nonnull)modifySysChildViewFrame1;
/// 修改 UITableViewCell 中默认子控件的frame 【方法二】
-(jobsByVoidBlock _Nonnull)modifySysChildViewFrame2;
/// 取内部类UITableViewCellEditControl,对编辑状态的Cell的点击按钮进行替换成自定义的
-(jobsByVoidBlock _Nonnull)customCellEditStateImage;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITABLEVIEWCELL_MARGIN_72DB84A1BE */
