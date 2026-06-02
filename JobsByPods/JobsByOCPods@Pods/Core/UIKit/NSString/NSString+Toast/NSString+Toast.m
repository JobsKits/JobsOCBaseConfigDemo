//
//  NSString+Toast.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Toast.h"

@implementation NSString (Toast)

-(jobsByVoidBlock _Nonnull)toast{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        NSObject.jobsToastMsg(self.tr);
    };
}

@end
