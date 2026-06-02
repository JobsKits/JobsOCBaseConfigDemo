//
//  NSObject+AttributedString.h
//  JobsRichTextUtils
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_ATTRIBUTEDSTRING_9233D94A69
#define JOBS_HEADER_GUARD_NSOBJECT_ATTRIBUTEDSTRING_9233D94A69

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (AttributedString)
/// 超链接的文字以及下划线的颜色设置
+(__kindof NSDictionary <NSAttributedStringKey,id>*)linkTextAttributes;
-(__kindof NSDictionary <NSAttributedStringKey,id>*)makeLinkTextAttributes;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_ATTRIBUTEDSTRING_9233D94A69 */
