//
//  JobsLocalNotificationModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsLocalNotificationModel_h
#define JobsLocalNotificationModel_h

#import <Foundation/Foundation.h>
#import "JobsLanMgr.h"
#import "JobsDefines.h"

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
