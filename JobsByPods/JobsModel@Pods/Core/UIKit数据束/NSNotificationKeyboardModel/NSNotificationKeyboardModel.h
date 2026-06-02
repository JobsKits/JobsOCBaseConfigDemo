//
//  NSNotificationKeyboardModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef NSNotificationKeyboardModel_h
#define NSNotificationKeyboardModel_h

#import <Foundation/Foundation.h>
#import <JobsModel/NotificationModel.h>

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
