//
//  UNNotificationRequestModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import "JobsDefineProperty.h"

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
