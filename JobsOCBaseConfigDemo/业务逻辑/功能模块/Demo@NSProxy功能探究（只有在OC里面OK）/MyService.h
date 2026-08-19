//
//  MyService.h
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

NS_ASSUME_NONNULL_BEGIN

@protocol MyService <NSObject>
@optional
-(jobsByVoidBlock _Nonnull)doSomething;

@end

NS_ASSUME_NONNULL_END
