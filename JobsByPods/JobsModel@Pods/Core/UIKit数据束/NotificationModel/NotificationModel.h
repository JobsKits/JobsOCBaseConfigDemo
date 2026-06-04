//
//  NotificationModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef NotificationModel_h
#define NotificationModel_h

#import <Foundation/Foundation.h>
#import <JobsModel/BaseModel.h>

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

@interface NotificationModel : BaseModel

Prop_copy()NSString *notificationName;
Prop_strong()NSDictionary *userInfo;
Prop_strong()id anObject;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof NotificationModel *_Nonnull jobsMakeNotificationModel(jobsByNotificationModelBlock _Nonnull block){
    NotificationModel *data = NotificationModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* NotificationModel_h */
