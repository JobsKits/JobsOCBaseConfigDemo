//
//  DynamicInvoke.m
//  JobsOCRuntimeKits
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "DynamicInvoke.h"

#import <JobsOCRuntimeKits/NSMutableArray+Extra.h>

@interface DynamicInvoke ()

@end

@implementation DynamicInvoke
-(instancetype)init{
    if (self = [super init]) {
        self.invoke1();
//        [self invoke2];
//        [self invoke3];
//        [self invoke4];
    };return self;
}

-(jobsByVoidBlock _Nonnull)invoke1{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [NSObject methodName:@"test1"
                   targetObj:self
                 paramarrays:nil];
        [NSObject methodName:@"test2"
                   targetObj:self
                 paramarrays:@[]];
        [NSObject methodName:@"test3:"
                   targetObj:self
                 paramarrays:@[@"str1"]];
        [NSObject methodName:@"test4:str2:"
                   targetObj:self
                 paramarrays:@[@"str1",@"str2"]];
        [NSObject methodName:@"test5:str2:str3:"
                   targetObj:self
                 paramarrays:@[@"str1",@"str2",@"str3"]];
        [NSObject methodName:@"test6:str2:str3:str4:"
                   targetObj:self
                 paramarrays:@[@"str1",@"str2",@"str3",@"str4"]];
        [NSObject methodName:@"test7:"
                   targetObj:self
                 paramarrays:@[@"block1"]];
        [NSObject methodName:@"test8:block2:"
                   targetObj:self
                 paramarrays:@[@"block1",@"block2"]];
        [NSObject methodName:@"test9:block2:block3:"
                   targetObj:self
                 paramarrays:@[@"block1",@"block2",@"block3"]];
        [NSObject methodName:@"test10:block2:block3:block4:"
                   targetObj:self
                 paramarrays:@[@"block1",@"block2",@"block3",@"block4"]];
    };
}

-(jobsByVoidBlock _Nonnull)invoke2{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [NSObject methodName:@"Test1"
                   targetObj:DynamicInvoke.class
                 paramarrays:nil];
        [NSObject methodName:@"Test2"
                   targetObj:DynamicInvoke.class
                 paramarrays:@[]];
        [NSObject methodName:@"Test3:"
                   targetObj:DynamicInvoke.class
                 paramarrays:@[@"str1"]];
        [NSObject methodName:@"Test4:str2:"
                   targetObj:DynamicInvoke.class
                 paramarrays:@[@"str1",@"str2"]];
        [NSObject methodName:@"Test5:str2:str3:"
                   targetObj:DynamicInvoke.class
                 paramarrays:@[@"str1",@"str2",@"str3"]];
        [NSObject methodName:@"Test6:str2:str3:str4:"
                   targetObj:DynamicInvoke.class
                 paramarrays:@[@"str1",@"str2",@"str3",@"str4"]];
        [NSObject methodName:@"Test7:"
                   targetObj:DynamicInvoke.class
                 paramarrays:@[@"block1"]];
        [NSObject methodName:@"Test8:block2:"
                   targetObj:DynamicInvoke.class
                 paramarrays:@[@"block1",@"block2"]];
        [NSObject methodName:@"Test9:block2:block3:"
                   targetObj:DynamicInvoke.class
                 paramarrays:@[@"block1",@"block2",@"block3"]];
        [NSObject methodName:@"Test10:block2:block3:block4:"
                   targetObj:DynamicInvoke.class
                 paramarrays:@[@"block1",@"block2",@"block3",@"block4"]];
    };
}

-(jobsByVoidBlock _Nonnull)invoke3{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        id test11 = [NSObject methodName:@"test11"
                               targetObj:self
                             paramarrays:nil];
        id test12 = [NSObject methodName:@"test12"
                               targetObj:self
                             paramarrays:@[]];
        id test13 = [NSObject methodName:@"test13:"
                               targetObj:self
                             paramarrays:@[@"str1"]];
        id test14 = [NSObject methodName:@"test14:str2:"
                               targetObj:self
                             paramarrays:@[@"str1",@"str2"]];
        id test15 = [NSObject methodName:@"test15:str2:str3:"
                               targetObj:self
                             paramarrays:@[@"str1",@"str2",@"str3"]];
        id test16 = [NSObject methodName:@"test16:str2:str3:str4:"
                               targetObj:self
                             paramarrays:@[@"str1",@"str2",@"str3",@"str4"]];
        id test17 = [NSObject methodName:@"test17:"
                               targetObj:self
                             paramarrays:@[@"block1"]];
        id test18 = [NSObject methodName:@"test18:block2:"
                               targetObj:self
                             paramarrays:@[@"block1",@"block2"]];
        id test19 = [NSObject methodName:@"test19:block2:block3:"
                               targetObj:self
                             paramarrays:@[@"block1",@"block2",@"block3"]];
        id test20 = [NSObject methodName:@"test20:block2:block3:block4:"
                               targetObj:self
                             paramarrays:@[@"block1",@"block2",@"block3",@"block4"]];
        NSMutableArray *temp = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            arr
                .add(test11)
                .add(test12)
                .add(test13)
                .add(test14)
                .add(test15)
                .add(test16)
                .add(test17)
                .add(test18)
                .add(test19)
                .add(test20);
        });JobsLog(@"temp = %@",temp);
    };
}

-(jobsByVoidBlock _Nonnull)invoke4{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        id Test11 = [NSObject methodName:@"Test11"
                               targetObj:DynamicInvoke.class
                             paramarrays:nil];
        id Test12 = [NSObject methodName:@"Test12"
                               targetObj:DynamicInvoke.class
                             paramarrays:@[]];
        id Test13 = [NSObject methodName:@"Test13:"
                               targetObj:DynamicInvoke.class
                             paramarrays:@[@"str1"]];
        id Test14 = [NSObject methodName:@"Test14:str2:"
                               targetObj:DynamicInvoke.class
                             paramarrays:@[@"str1",@"str2"]];
        id Test15 = [NSObject methodName:@"Test15:str2:str3:"
                               targetObj:DynamicInvoke.class
                             paramarrays:@[@"str1",@"str2",@"str3"]];
        id Test16 = [NSObject methodName:@"Test16:str2:str3:str4:"
                               targetObj:DynamicInvoke.class
                             paramarrays:@[@"str1",@"str2",@"str3",@"str4"]];
        id Test17 = [NSObject methodName:@"Test17:"
                               targetObj:DynamicInvoke.class
                             paramarrays:@[@"block1"]];
        id Test18 = [NSObject methodName:@"Test18:block2:"
                               targetObj:DynamicInvoke.class
                             paramarrays:@[@"block1",@"block2"]];
        id Test19 = [NSObject methodName:@"Test19:block2:block3:"
                               targetObj:DynamicInvoke.class
                             paramarrays:@[@"block1",@"block2",@"block3"]];
        id Test20 = [NSObject methodName:@"Test20:block2:block3:block4:"
                               targetObj:DynamicInvoke.class
                             paramarrays:@[@"block1",@"block2",@"block3",@"block4"]];
        NSMutableArray *temp = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            arr
                .add(Test11)
                .add(Test12)
                .add(Test13)
                .add(Test14)
                .add(Test15)
                .add(Test16)
                .add(Test17)
                .add(Test18)
                .add(Test19)
                .add(Test20);
        });JobsLog(@"temp = %@",temp);
    };
}
#pragma mark —— 实例方法（不带返回值）
-(jobsByVoidBlock _Nonnull)test1{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsLog(@"void-test1");
    };
}
-(jobsByVoidBlock _Nonnull)test2{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        JobsLog(@"void-test2");
    };
}
-(jobsByStrBlock _Nonnull)test3{
    @jobs_weakify(self)
    return ^(NSString * str1){
        @jobs_strongify(self)
        if (!self) return;
        JobsLog(@"void-test3");
    };
}
-(void)test4:(NSString *)str1 str2:(NSString *)str2{
    JobsLog(@"void-test4");
}
-(void)test5:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3{
    JobsLog(@"void-test5");
}
-(void)test6:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3 str4:(NSString *)str4{
    JobsLog(@"void-test6");
}
-(jobsByjobsByIDBlockBlock _Nonnull)test7{
    @jobs_weakify(self)
    return ^(jobsByIDBlock block1){
        @jobs_strongify(self)
        if (!self) return;
        JobsLog(@"void-test7");
    };
}
-(void)test8:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2{
    JobsLog(@"void-test8");
}
-(void)test9:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3{
    JobsLog(@"void-test9");
}
-(void)test10:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3 block4:(jobsByIDBlock)block4{
    JobsLog(@"void-test10");
}
#pragma mark —— 实例方法（带返回值）
-(JobsRetStrByVoidBlock _Nonnull)test11{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        JobsLog(@"NSString-test11");
        return @"NSString-test11";
    };
}
-(JobsRetStrByVoidBlock _Nonnull)test12{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        JobsLog(@"NSString-test12");
        return @"NSString-test12";
    };
}
-(JobsRetStrByStrBlock _Nonnull)test13{
    @jobs_weakify(self)
    return ^NSString *(NSString * str1){
        @jobs_strongify(self)
        if (!self) return nil;
        JobsLog(@"NSString-test13+str1");
        return @"NSString-test13+str1";
    };
}
-(NSString *)test14:(NSString *)str1 str2:(NSString *)str2{
    JobsLog(@"NSString-test14+str1+str2");
    return @"NSString-test14+str1+str2";
}
-(NSString *)test15:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3{
    JobsLog(@"NSString-test15+str1+str2+str3");
    return @"NSString-test15+str1+str2+str3";
}
-(NSString *)test16:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3 str4:(NSString *)str4{
    JobsLog(@"NSString-test16+str1+str2+str3+str4");
    return @"NSString-test16+str1+str2+str3+str4";
}
-(JobsRetNSStringByjobsByIDBlockBlock _Nonnull)test17{
    @jobs_weakify(self)
    return ^NSString *(jobsByIDBlock block1){
        @jobs_strongify(self)
        if (!self) return nil;
        JobsLog(@"NSString-test17+block1");
        return @"NSString-test17+block1";
    };
}
-(NSString *)test18:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2{
    JobsLog(@"NSString-test18+block1+block2");
    return @"NSString-test18+block1+block2";
}
-(NSString *)test19:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3{
    JobsLog(@"NSString-test19+block1+block2+block3");
    return @"NSString-test19+block1+block2+block3";
}
-(NSString *)test20:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3 block4:(jobsByIDBlock)block4{
    JobsLog(@"NSString-test20+block1+block2+block3+block4");
    return @"NSString-test20+block1+block2+block3+block4";
}
#pragma mark —— 类方法（不带返回值）
+(jobsByVoidBlock _Nonnull)Test1{
    return ^{
        JobsLog(@"void+Test1");
    };
}
+(jobsByVoidBlock _Nonnull)Test2{
    return ^{
        JobsLog(@"void+Test2");
    };
}
+(jobsByStrBlock _Nonnull)Test3{
    return ^(NSString * str1){
        JobsLog(@"void+Test3+str1");
    };
}
+(void)Test4:(NSString *)str1 str2:(NSString *)str2{
    JobsLog(@"void+Test4+str1+str2");
}
+(void)Test5:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3{
    JobsLog(@"void+Test5+str1+str2+str3");
}
+(void)Test6:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3 str4:(NSString *)str4{
    JobsLog(@"void+Test6+str1+str2+str3+str4");
}
+(jobsByjobsByIDBlockBlock _Nonnull)Test7{
    return ^(jobsByIDBlock block1){
        JobsLog(@"void+Test7+block1");
    };
}
+(void)Test8:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2{
    JobsLog(@"void+Test8+block1+block2");
}
+(void)Test9:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3{
    JobsLog(@"void+Test9+block1+block2+block3");
}
+(void)Test10:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3 block4:(jobsByIDBlock)block4{
    JobsLog(@"void+Test10+block1+block2+block3+block4");
}
#pragma mark —— 类方法（带返回值）
+(JobsRetStrByVoidBlock _Nonnull)Test11{
    return ^NSString *_Nullable{
        JobsLog(@"void+Test11");
        return @"void+Test11";
    };
}
+(JobsRetStrByVoidBlock _Nonnull)Test12{
    return ^NSString *_Nullable{
        JobsLog(@"void+Test12");
        return @"void+Test12";
    };
}
+(JobsRetStrByStrBlock _Nonnull)Test13{
    return ^NSString *(NSString * str1){
        JobsLog(@"void+Test13+str1");
        return @"void+Test13+str1";
    };
}
+(NSString *)Test14:(NSString *)str1 str2:(NSString *)str2{
    JobsLog(@"void+Test14+str1+str2");
    return @"void+Test14+str1+str2";
}
+(NSString *)Test15:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3{
    JobsLog(@"void+Test15+str1+str2+str3");
    return @"void+Test15+str1+str2+str3";
}
+(NSString *)Test16:(NSString *)str1 str2:(NSString *)str2 str3:(NSString *)str3 str4:(NSString *)str4{
    JobsLog(@"void+Test16+str1+str2+str3+str4");
    return @"void+Test16+str1+str2+str3+str4";
}
+(JobsRetNSStringByjobsByIDBlockBlock _Nonnull)Test17{
    return ^NSString *(jobsByIDBlock block1){
        JobsLog(@"void+Test17+block1");
        return @"void+Test17+block1";
    };
}
+(NSString *)Test18:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2{
    JobsLog(@"void+Test18+block1+block2");
    return @"void+Test18+block1+block2";
}
+(NSString *)Test19:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3{
    JobsLog(@"void+Test19+block1+block2+block3");
    return @"void+Test19+block1+block2+block3";
}
+(NSString *)Test20:(jobsByIDBlock)block1 block2:(jobsByIDBlock)block2 block3:(jobsByIDBlock)block3 block4:(jobsByIDBlock)block4{
    JobsLog(@"void+Test20+block1+block2+block3+block4");
    return @"void+Test20+block1+block2+block3+block4";
}

@end
