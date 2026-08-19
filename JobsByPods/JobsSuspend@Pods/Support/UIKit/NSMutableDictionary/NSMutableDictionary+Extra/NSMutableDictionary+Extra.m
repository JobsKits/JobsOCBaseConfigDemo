//
//  NSMutableDictionary+Extra.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSMutableDictionary+Extra.h"

@implementation NSMutableDictionary (Extra)
-(JobsRetMutableDicByKeyValueBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^NSMutableDictionary *_Nonnull(id <NSCopying>_Nonnull key,id _Nonnull value) {
        @jobs_strongify(self)
        if(key && value)[self setObject:value forKey:key];
        return self;
    };
}

-(JobsRetMutableDicByDicBlock _Nonnull)addByDic{
    @jobs_weakify(self)
    return ^NSMutableDictionary *_Nonnull(__kindof NSDictionary *_Nullable dic){
        @jobs_strongify(self)
        [self addEntriesFromDictionary:dic];
        return self;
    };
}

-(JobsRetMutableDicByKeyValueModelBlock _Nonnull)saveDataBy{
    @jobs_weakify(self)
    return ^NSMutableDictionary *_Nonnull(JobsKeyValueModel *_Nullable model){
        @jobs_strongify(self)
        id obj = model;
        id key = nil;
        id data = nil;
        @try {
            key = [obj valueForKey:@"key"];
            data = [obj valueForKey:@"data"];
        } @catch (__unused NSException *exception) {}
        if (key && data) [self setObject:data forKey:key];
        return self;
    };
}
/// 打印的结果可以直接用于Postman
-(JobsRetStrByVoidBlock _Nonnull)jsonString{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSError *error;
        NSString *jsonString = @"";
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&error];
        if (error) {
            JobsLog(@"JSON转换失败: %@", error.description);
        } else {
            jsonString = NSString.initByUTF8Data(jsonData);
            JobsLog(@"%@", jsonString);
        };return jsonString;
    };
}

@end
