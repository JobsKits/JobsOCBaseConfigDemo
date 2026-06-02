//
//  CheckMemFreeVC.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_CHECKMEMFREEVC_B301E085D9
#define JOBS_HEADER_GUARD_CHECKMEMFREEVC_B301E085D9

#import <UIKit/UIKit.h>
#import <JobsBaseUI/JobsBaseUI.h>

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 本类用来测试是否正常走deallco方法的控制器
@interface CheckMemFreeVC : BaseViewController

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CHECKMEMFREEVC_B301E085D9 */
