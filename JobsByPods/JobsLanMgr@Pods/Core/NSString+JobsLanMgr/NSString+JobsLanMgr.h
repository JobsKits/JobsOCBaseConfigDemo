//
//  NSString+JobsLanMgr.h
//  JobsLanMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_JOBSLANMGR_FA91184C50
#define JOBS_HEADER_GUARD_NSSTRING_JOBSLANMGR_FA91184C50

#pragma once

#import <Foundation/Foundation.h>
#import <JobsLanMgr/NSObject+Extra.h>

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

@interface NSString (JobsLanMgr)
/// 仅供不可修改的第三方源码保持 ABI；Jobs 自有代码统一使用 jobsTr()。
-(NSString *_Nullable)tr;
/// JobsBlock 形态的国际化入口
-(JobsRetStrByVoidBlock _Nonnull)jobsTr;
/// 当前字符串是否被目标字符串以本地化、忽略大小写方式包含
-(JobsRetBOOLByStrBlock _Nonnull)inStr;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_JOBSLANMGR_FA91184C50 */
