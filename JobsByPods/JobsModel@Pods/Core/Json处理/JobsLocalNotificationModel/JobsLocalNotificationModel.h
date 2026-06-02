//
//  JobsLocalNotificationModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsLocalNotificationModel_h
#define JobsLocalNotificationModel_h

#import <Foundation/Foundation.h>

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

@interface JobsLocalNotificationModel : NSObject

Prop_copy()NSString *identifier;
Prop_copy()NSString *title;
Prop_copy()NSString *body;
Prop_strong()UNNotificationSound *sound API_UNAVAILABLE(tvos);
Prop_assign()NSTimeInterval triggerWithTimeInterval;// 时间间隔必须大于0，否则崩溃
Prop_assign()BOOL repeats;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsLocalNotificationModel_h */
