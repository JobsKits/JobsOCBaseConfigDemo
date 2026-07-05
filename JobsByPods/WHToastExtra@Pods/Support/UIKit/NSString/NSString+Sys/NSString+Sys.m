//
//  NSString+Sys.m
//  WHToastExtra
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#import "NSString+Sys.h"

@implementation NSString (WHToastExtraSys)

-(JobsRetStrByCharacterSetBlock _Nonnull)byTrimmingCharactersInSet{
    return ^__kindof NSString *_Nullable(NSCharacterSet *_Nullable data){
        return [self stringByTrimmingCharactersInSet:data];
    };
}

@end
