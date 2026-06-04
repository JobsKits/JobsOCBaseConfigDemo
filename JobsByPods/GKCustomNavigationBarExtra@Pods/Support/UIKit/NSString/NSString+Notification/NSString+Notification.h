//
//  NSString+Notification.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_NOTIFICATION_4314E4AD05
#define JOBS_HEADER_GUARD_NSSTRING_NOTIFICATION_4314E4AD05

#pragma once

#import <Foundation/Foundation.h>

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
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

@interface NSString (Notification)

-(jobsByIDBlock _Nonnull)postNotificationBy;
-(jobsByNotificationModelBlock _Nonnull)postNotificationByModel;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_NOTIFICATION_4314E4AD05 */
