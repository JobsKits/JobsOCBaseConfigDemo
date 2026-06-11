//
//  NSRegularExpression+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSRegularExpression+Extra.h"

@implementation NSRegularExpression (Extra)

+(JobsRetRegularExpressionByStrBlock _Nonnull)byString{
    return ^__kindof NSRegularExpression *_Nullable(NSString *_Nullable data){
        NSError *err = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:data
                                                                               options:0
                                                                                 error:&err];
        if(err){
            JobsLog(@"err = %@",err.description);
            return nil;
        };return regex;
    };
}

@end
