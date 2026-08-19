//
//  NSObject+TimeApp.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+TimeApp.h"

@implementation NSObject (TimeApp)
/// 判断是否当日第一次启动App
-(JobsRetBOOLByVoidBlock _Nonnull)isFirstLaunchApp{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        BOOL flag;
        NSDate *oldDate = (NSDate *)NSUserDefaults.readWithKey(App当日首次进入);
        if (oldDate) {
            flag = !self.isToday(oldDate);
        }else{
            JobsLog(@"未启动过，今日第一次启动");
            flag = YES;
        }
        /// 保存启动时间
        @jobs_weakify(self)
        NSUserDefaults.updateWithModel(jobsMakeUserDefaultModel(^(UserDefaultModel * _Nonnull data) {
            @jobs_strongify(self)
            data.byKey(App当日首次进入)
                .byObj(self.currentDate);
        }));return flag;
    };
}

@end
