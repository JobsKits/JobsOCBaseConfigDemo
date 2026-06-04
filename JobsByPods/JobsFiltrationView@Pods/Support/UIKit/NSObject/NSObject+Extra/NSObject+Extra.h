//
//  NSObject+Extra.h
//  JobsFiltrationView
//
//  Created by Jobs on 2026年5月23日，星期六.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_EXTRA_838820FAD4
#define JOBS_HEADER_GUARD_NSOBJECT_EXTRA_838820FAD4

#pragma once

#import <objc/runtime.h>
#import <objc/message.h>
#import <Foundation/Foundation.h>

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
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
/// BaseView 默认返回按钮配置。
-(UIButtonModel *)makeBackBtnModel;
/// BaseView 默认返回事件透传。
-(jobsByBtnBlock _Nonnull)jobsBackBtnClickEvent;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_EXTRA_838820FAD4 */
