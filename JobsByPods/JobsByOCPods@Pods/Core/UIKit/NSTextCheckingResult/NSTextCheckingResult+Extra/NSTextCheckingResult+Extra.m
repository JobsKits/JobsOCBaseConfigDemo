//
//  NSTextCheckingResult+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSTextCheckingResult+Extra.h"

@implementation NSTextCheckingResult (Extra)

-(JobsRetRangeByIntegerBlock _Nonnull)rangeAtIndex{
    @jobs_weakify(self)
    return ^NSRange (NSInteger data){
        @jobs_strongify(self)
        return [self rangeAtIndex:data];
    };
}

@end
