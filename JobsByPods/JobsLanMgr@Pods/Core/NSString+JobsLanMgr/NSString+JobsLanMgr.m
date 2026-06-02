//
//  NSString+JobsLanMgr.m
//  JobsLanMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+JobsLanMgr.h"
#import <JobsLanMgr/LanMgr.h>

@implementation NSString (JobsLanMgr)
/// 国际化
-(NSString *_Nullable)tr{
    return [LanMgr localStringWithKey:self];
}

@end
