//
//  JobsOCMarkdownResourceLocator.h
//  JobsOCMarkdown
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
NS_ASSUME_NONNULL_BEGIN

@interface JobsOCMarkdownResourceLocator : NSObject

+(JobsRetNSBundleByVoidBlock _Nonnull)runtimeBundle;
+(JobsRetURLByVoidBlock _Nonnull)templateURL;

@end

NS_ASSUME_NONNULL_END
