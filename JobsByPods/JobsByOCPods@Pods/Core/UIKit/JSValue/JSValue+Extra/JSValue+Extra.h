//
//  JSValue+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JSVALUE_EXTRA_5BF7B4DA56
#define JOBS_HEADER_GUARD_JSVALUE_EXTRA_5BF7B4DA56

#import <JavaScriptCore/JavaScriptCore.h> // 提供 Objective-C / Swift 与 JavaScript 交互能力，可执行脚本并进行对象桥接。

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

@interface JSValue (Extra)
/// 随时传入一段 JavaScript 代码，并获取执行的结果
-(JobsRetJSValueByStrBlock _Nonnull)evaluateScript;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JSVALUE_EXTRA_5BF7B4DA56 */
