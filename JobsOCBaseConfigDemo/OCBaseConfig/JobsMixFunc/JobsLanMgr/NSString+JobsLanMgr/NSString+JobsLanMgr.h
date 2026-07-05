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
#import "NSObject+Extra.h"

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JobsLanMgr)
/// 国际化
-(NSString *_Nullable)tr;
/// 当前字符串是否被目标字符串以本地化、忽略大小写方式包含
-(JobsRetBOOLByStrBlock _Nonnull)inStr;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_JOBSLANMGR_FA91184C50 */
