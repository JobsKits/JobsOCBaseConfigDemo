//
//  NSObject+AttributedString.h
//  JobsRichTextUtils
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_ATTRIBUTEDSTRING_9233D94A69
#define JOBS_HEADER_GUARD_NSOBJECT_ATTRIBUTEDSTRING_9233D94A69

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

@interface NSObject (AttributedString)
/// 超链接的文字以及下划线的颜色设置
+(JobsRetNSDictionaryNSAttributedStringKeyIDByVoidBlock _Nonnull)linkTextAttributes;
-(JobsRetNSDictionaryNSAttributedStringKeyIDByVoidBlock _Nonnull)makeLinkTextAttributes;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_ATTRIBUTEDSTRING_9233D94A69 */
