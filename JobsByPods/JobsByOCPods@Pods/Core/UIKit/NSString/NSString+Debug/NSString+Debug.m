//
//  NSString+Debug.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Debug.h"

@implementation NSString (Debug)
/// 该文字是否是Debug定义的文字
-(JobsRetBOOLByVoidBlock _Nonnull)isDebugText{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return self.isEqualToString(TextModelDataString.jobsTr());
    };
}

@end
