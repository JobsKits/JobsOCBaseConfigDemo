//
//  NSObject+ChangeAppicon.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2021/12/14.
//

#import "NSObject+ChangeAppicon.h"

@implementation NSObject (ChangeAppicon)
/// 测试App更改图标
-(jobsByVoidBlock _Nonnull)testChangeAppicon{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSArray <NSString *>*weathers = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            data
                .add(@"晴".jobsTr())
                .add(@"多云".jobsTr())
                .add(@"大雨".jobsTr())
                .add(@"雪".jobsTr());
        });
        NSString *weather = weathers[arc4random() % (weathers.count)];
        self.setAppIconWithName(weather);
    };
}
/// App更改图标核心代码
-(jobsByStrBlock _Nonnull)setAppIconWithName{
    @jobs_weakify(self)
    return ^(NSString *_Nullable iconName){
        @jobs_strongify(self)
        if (!self) return;
        if (JobsAvailableSysVersion(10.3)) {
            if (UIApplication.sharedApplication.supportsAlternateIcons) {
                [UIApplication.sharedApplication setAlternateIconName:iconName
                                                    completionHandler:^(NSError * _Nullable error) {
                    if (error) {
                        self.jobsToastErrMsg(@"更换app图标发生错误了 ：".jobsTr().add(error.description));
                        JobsLog(@"更换app图标发生错误了 ： %@",error);
                    }
                }];
            }
        }else self.jobsToastErrMsg(@"请升级系统到10.3以上版本,方可支持切换App图标".jobsTr());
    };
}

@end
