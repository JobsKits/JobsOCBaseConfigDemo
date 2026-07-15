//
//  NSNotificationKeyboardModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef NSNotificationKeyboardModel_h
#define NSNotificationKeyboardModel_h

#import <Foundation/Foundation.h>
#import "NotificationModel.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationKeyboardModel : NotificationModel

Prop_assign()CGRect beginFrame;
Prop_assign()CGRect endFrame;
Prop_assign()CGFloat keyboardOffsetY;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof NSNotificationKeyboardModel *_Nonnull jobsMakeNotificationKeyboardModel(jobsByNSNotificationKeyboardModelBlock _Nonnull block){
    NSNotificationKeyboardModel *data = NSNotificationKeyboardModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* NSNotificationKeyboardModel_h */
