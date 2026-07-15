//
//  UNUserNotificationCenter+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#import "UNUserNotificationCenter+DSL.h"

@implementation UNUserNotificationCenter (DSL)
-(JobsRetUNUserNotificationCenterByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof UNUserNotificationCenter *_Nullable(id<UNUserNotificationCenterDelegate> _Nullable delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}

@end
