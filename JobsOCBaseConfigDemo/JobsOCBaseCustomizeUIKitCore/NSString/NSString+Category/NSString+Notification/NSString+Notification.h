//
//  NSString+Notification.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_NOTIFICATION_9D7F2A10FF
#define JOBS_HEADER_GUARD_NSSTRING_NOTIFICATION_9D7F2A10FF

#pragma once

#import <Foundation/Foundation.h>

#import "JobsModelDSL.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Notification)

-(jobsByIDBlock _Nonnull)postNotificationBy;
-(jobsByNotificationModelBlock _Nonnull)postNotificationByModel;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_NOTIFICATION_9D7F2A10FF */
