//
//  NSString+Extra.m
//  JobsLanMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Extra.h"

@implementation NSString (Extra)
/// OC字符串拼接
-(JobsRetStrByStrBlock _Nonnull)add{
    NSString *sourceString = self;
    return ^NSMutableString *_Nullable(NSString *_Nonnull str) {
        if(!str) str = JobsEmpty;
        // 系统的stringByAppendingString方法在参数为nil的时候会崩溃
        return JobsMutableString([sourceString stringByAppendingString:str]); // 原始字符串不会改变，输出一个新的字符串
    };
}

-(NSString *)pathForResourceWithFullName{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSString.class, @selector(jobsPathForResourceWithFullName)))(self, @selector(jobsPathForResourceWithFullName)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsPathForResourceWithFullName{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        // 拆分文件名和扩展名
        NSString *name = self.stringByDeletingPathExtension;
        NSString *extension = self.pathExtension;
        // 使用 NSBundle 获取文件路径
        return [NSBundle.mainBundle pathForResource:name ofType:extension];
    };
}

@end
