//
//  NSObject+Extra.m
//  JobsOCRuntimeKits
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+Extra.h"

@implementation NSObject (Extra)
/**

     NSMutableArray <UIViewModel *>*dataMutArr = popupView.valueForKey(@"dataMutArr");
     [dataMutArr removeAllObjects];
     [dataMutArr addObjectsFromArray:self.createDataMutArr2];

     // dataMutArr = self.createDataMutArr2; 这一段无效
 */
- (JobsRetIDByIDBlock _Nonnull)valueForKey{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *key) {
        @jobs_strongify(self)
        id value = nil;
        if ([key isKindOfClass:NSString.class] &&
            [self respondsToSelector:NSSelectorFromString(key)]) {
            @try {
                value = [self valueForKey:key];
            }
            @catch (NSException *exception) {
                JobsLog(@"Exception: %@", exception);
                value = @"nil"; // or handle the exception as needed
            }
        }return value;
    };
}

@end
