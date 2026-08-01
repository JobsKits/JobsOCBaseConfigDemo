//
//  JobsOCMarkdownResourceLocator.h
//  JobsOCMarkdown
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCMarkdownResourceLocator : NSObject

+(nullable NSBundle *)runtimeBundle;
+(nullable NSURL *)templateURL;

@end

NS_ASSUME_NONNULL_END
