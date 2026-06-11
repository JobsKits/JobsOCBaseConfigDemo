//
//  NSObject+Extra.m
//  FDFullscreenPopGesture
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
    NSObject *object = self;
    return ^id _Nullable(NSString *key) {
        id value = nil;
        if ([key isKindOfClass:NSString.class] &&
            [object respondsToSelector:NSSelectorFromString(key)]) {
            @try {
                value = [object valueForKey:key];
            }
            @catch (NSException *exception) {
                JobsLog(@"Exception: %@", exception);
                value = @"nil"; // or handle the exception as needed
            }
        };return value;
    };
}

@end
