//
//  NSString+Toast.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月18日，星期一.
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
