//
//  NSData+Extra.m
//  AFNetworking
//
//  Created by Jobs on 2026/5/16.
//

#import "NSData+Extra.h"

@implementation NSData (YTKNetworkExtraExtra)
-(NSString *)stringByUTF8Encoding{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSData.class, @selector(jobsStringByUTF8Encoding)))(self, @selector(jobsStringByUTF8Encoding)))();
}

-(JobsRetStrByVoidBlock _Nonnull)jobsStringByUTF8Encoding{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return NSString.initByUTF8Data(self);
    };
}

@end
