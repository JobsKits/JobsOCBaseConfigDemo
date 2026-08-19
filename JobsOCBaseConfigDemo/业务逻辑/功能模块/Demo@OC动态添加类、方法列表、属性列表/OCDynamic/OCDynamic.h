//
//  OCDynamic.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 【消息转发】不实现h文件暴露的方法，而进行动态链接
@interface OCDynamic : NSObject

+(void)Test;
+(jobsByVoidBlock _Nonnull)jobsTest;
-(void)test;
-(jobsByVoidBlock _Nonnull)jobsTest;

@end

NS_ASSUME_NONNULL_END
