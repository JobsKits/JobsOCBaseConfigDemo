//
//  NSJSONSerialization+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSJSONSerialization+Extra.h"

@implementation NSJSONSerialization (Extra)

+(JobsRetDicByDataBlock _Nonnull)makeDicByData{
    return ^__kindof NSDictionary *_Nullable(NSData *_Nullable data){
        NSError *err = nil;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        if(err){
            JobsLog(@"err = %@",err.description);
            return nil;
        };return dic;
    };
}

@end
