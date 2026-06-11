//
//  NSMutableSet+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSMutableSet+Extra.h"

@implementation NSMutableSet (Extra)
/// 阻止向可变集合添加空元素 JobsReturnIDByIDBlock
-(JobsRetMutableSetByIDBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^NSMutableSet *(id _Nullable data) {
        @jobs_strongify(self)
        if(data){
            /// 向集合加入nil会崩
            [self addObject:data];
        }else{
            JobsLog(@"集合被添加了一个空元素");
        };return self;
    };
}

-(JobsRetBOOLByIDBlock _Nonnull)containsObject{
    @jobs_weakify(self)
    return ^BOOL(id _Nullable data) {
        @jobs_strongify(self)
        return [self containsObject:data];;
    };
}

@end
