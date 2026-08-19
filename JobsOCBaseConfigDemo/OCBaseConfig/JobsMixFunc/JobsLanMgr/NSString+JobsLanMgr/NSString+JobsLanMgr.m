//
//  NSString+JobsLanMgr.m
//  JobsLanMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+JobsLanMgr.h"

#import "LanMgr.h"

@implementation NSString (JobsLanMgr)
/// 国际化
-(NSString *_Nullable)tr{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSString.class, @selector(jobsTr)))(self, @selector(jobsTr)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsTr{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return LanMgr.localStringByKey(self);
    };
}

-(JobsRetBOOLByStrBlock _Nonnull)inStr{
    @jobs_weakify(self)
    return ^BOOL(__kindof NSString *_Nullable data){
        @jobs_strongify(self)
        if (!self || !data) return NO;
        return [data localizedCaseInsensitiveContainsString:self];
    };
}

@end
