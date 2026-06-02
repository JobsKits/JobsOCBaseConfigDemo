//
//  NSArray+Extra.m
//  JobsTimeUtils
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSArray+Extra.h"

@implementation NSArray (Extra)
/// 数组里面是否包含某个元素
-(JobsRetBOOLByIDBlock _Nonnull)containsObject{
    @jobs_weakify(self)
    return ^BOOL(id _Nullable data) {
        @jobs_strongify(self)
        if(!data) return NO;
        return [self containsObject:data];
    };
}

@end
