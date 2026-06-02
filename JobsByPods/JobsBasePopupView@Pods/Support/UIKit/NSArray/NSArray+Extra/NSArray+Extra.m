//
//  NSArray+Extra.m
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSArray+Extra.h"

@implementation NSArray (Extra)
/// 数组取值（无法关联数组的泛型）
-(JobsRetIDByUIntegerBlock _Nonnull)objectAt{
    @jobs_weakify(self)
    return ^id _Nullable(NSUInteger data){
        @jobs_strongify(self)
        return [self objectAtIndex:data];
    };
}

@end
