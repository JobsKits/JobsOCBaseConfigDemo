//
//  NotificationModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef NotificationModel_h
#define NotificationModel_h

#import <Foundation/Foundation.h>
#import "BaseModel.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

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
