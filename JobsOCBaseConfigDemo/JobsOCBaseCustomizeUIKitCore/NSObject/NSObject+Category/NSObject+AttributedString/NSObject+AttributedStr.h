//
//  NSObject+AttributedStr.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/4/29.
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

@interface NSObject (AttributedStr)
/// 超链接的文字以及下划线的颜色设置
+(JobsRetNSDictionaryNSAttributedStringKeyIDByVoidBlock _Nonnull)linkTextAttributes;
-(JobsRetNSDictionaryNSAttributedStringKeyIDByVoidBlock _Nonnull)makeLinkTextAttributes;

@end

NS_ASSUME_NONNULL_END
