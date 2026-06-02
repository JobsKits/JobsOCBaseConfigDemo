//
//  IQKeyboardManager+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_IQKEYBOARDMANAGER_EXTRA_1802BF839B
#define JOBS_HEADER_GUARD_IQKEYBOARDMANAGER_EXTRA_1802BF839B

#import <Foundation/Foundation.h>

#if __has_include(<IQKeyboardManager/IQKeyboardManager.h>)
#import <IQKeyboardManager/IQKeyboardManager.h>
#else
#import "IQKeyboardManager.h"
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

@interface IQKeyboardManager (Extra)

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof IQKeyboardManager *_Nonnull jobsMakeIQKeyboardManager(jobsByIQKeyboardManagerBlock _Nonnull block){
    IQKeyboardManager *data = IQKeyboardManager.sharedManager;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_IQKEYBOARDMANAGER_EXTRA_1802BF839B */
