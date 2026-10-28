//
//  NSString+Sys.m
//  JobsOCOpen
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#import "NSString+Sys.h"

@implementation NSString (JobsOCOpenSys)

-(JobsRetStrByCharacterSetBlock _Nonnull)byTrimmingCharactersInSet{
    return ^__kindof NSString *_Nullable(NSCharacterSet *_Nullable data){
        return [self stringByTrimmingCharactersInSet:data];
    };
}

@end
