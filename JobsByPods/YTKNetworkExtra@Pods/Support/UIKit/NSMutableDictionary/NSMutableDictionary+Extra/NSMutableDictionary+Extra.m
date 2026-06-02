//
//  NSMutableDictionary+Extra.m
//  YTKNetworkExtra
//
//  Created by Jobs on 2026/5/16.
//

#import "NSMutableDictionary+Extra.h"

@implementation NSMutableDictionary (Extra)

-(JobsRetMutableDicByDicBlock _Nonnull)addByDic{
    @jobs_weakify(self)
    return ^NSMutableDictionary *_Nonnull(__kindof NSDictionary *_Nullable dic){
        @jobs_strongify(self)
        [self addEntriesFromDictionary:dic];
        return self;
    };
}
/// 打印的结果可以直接用于Postman
-(NSString *)jsonString{
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
    }return jsonString;
}

@end
