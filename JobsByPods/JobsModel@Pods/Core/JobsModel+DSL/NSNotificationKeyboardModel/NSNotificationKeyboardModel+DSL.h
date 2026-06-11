//
//  NSNotificationKeyboardModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_NSNOTIFICATIONKEYBOARDMODEL_DSL_843D8BCE77697310
#define JOBS_HEADER_GUARD_NSNOTIFICATIONKEYBOARDMODEL_DSL_843D8BCE77697310

#if __has_include(<JobsModel/NSNotificationKeyboardModel.h>)
#import <JobsModel/NSNotificationKeyboardModel.h>
#else
#import "NSNotificationKeyboardModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationKeyboardModel (DSL)

#pragma mark —— 来自 NSNotificationKeyboardModel
-(__kindof NSNotificationKeyboardModel *_Nonnull (^ _Nonnull)(CGRect data))byBeginFrame;
-(__kindof NSNotificationKeyboardModel *_Nonnull (^ _Nonnull)(CGRect data))byEndFrame;
-(__kindof NSNotificationKeyboardModel *_Nonnull (^ _Nonnull)(CGFloat data))byKeyboardOffsetY;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSNOTIFICATIONKEYBOARDMODEL_DSL_843D8BCE77697310 */
