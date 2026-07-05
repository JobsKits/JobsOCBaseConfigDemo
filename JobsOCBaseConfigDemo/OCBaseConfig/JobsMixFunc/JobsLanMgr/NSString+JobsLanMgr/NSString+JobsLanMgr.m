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
    return LanMgr.localStringByKey(self);
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
