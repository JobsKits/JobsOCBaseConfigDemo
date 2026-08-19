//
//  NSAttributedString+Extra.h
//  JobsRichTextUtils
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSATTRIBUTEDSTRING_EXTRA_638AC33625

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#define JOBS_HEADER_GUARD_NSATTRIBUTEDSTRING_EXTRA_638AC33625

#import <Foundation/Foundation.h>
#import "NSMutableAttributedString+Extra.h"

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// NSAttributedString 用于设置段落样式，包括行间距、段间距、对齐方式等
@interface NSAttributedString (Extra)
/// 对系统方法 initWithString 的二次封装
+(JobsRetAttributedStringByStrBlock _Nonnull)initByString;
/// 获取 NSAttributedString.文本字体
-(JobsRetFontByVoidBlock _Nonnull)attributedStringFont;
/// 获取 NSAttributedString.文本颜色
-(JobsRetFontByVoidBlock _Nonnull)attributedStringTextCor;
/// 获取 NSAttributedString.段落信息
-(JobsRetParagraphStyleByVoidBlock _Nonnull)attributedStringParagraphStyle;
/// 将富文本的颜色统一进行设置
-(JobsRetAttributedStringByCorBlock _Nonnull)changeTextColorBy;
/// 移除超链接属性
-(JobsRetAttributedStringByVoidBlock _Nonnull)removeHyperlinks;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSATTRIBUTEDSTRING_EXTRA_638AC33625 */
