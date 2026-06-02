//
//  UNNotificationRequestModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef UNNotificationRequestModel_h
#define UNNotificationRequestModel_h

#import <Foundation/Foundation.h>
#import <JobsModel/BaseModel.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UNNotificationRequestModel : BaseModel

Prop_copy()NSString *identifier;
Prop_strong()UNNotificationContent *content;
Prop_strong()UNNotificationTrigger *trigger;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UNNotificationRequestModel *_Nonnull jobsMakeUNNotificationRequestModel(jobsByUNNotificationRequestModelBlock _Nonnull block){
    UNNotificationRequestModel *data = UNNotificationRequestModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* UNNotificationRequestModel_h */
