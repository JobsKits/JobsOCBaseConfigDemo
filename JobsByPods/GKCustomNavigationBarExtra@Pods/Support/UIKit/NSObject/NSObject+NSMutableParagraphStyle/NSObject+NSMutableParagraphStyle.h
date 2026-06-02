//
//  NSObject+NSMutableParagraphStyle.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_NSMUTABLEPARAGRAPHSTYLE_2FA2B267D3
#define JOBS_HEADER_GUARD_NSOBJECT_NSMUTABLEPARAGRAPHSTYLE_2FA2B267D3

#pragma once

#import <Foundation/Foundation.h>

#if __has_include(<JobsRichTextUtils/JobsRichTextUtils.h>)
#import <JobsRichTextUtils/JobsRichTextUtils.h>
#else
#import "JobsRichTextUtils.h"
#endif

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (NSMutableParagraphStyle)
/// 居左对齐
-(NSMutableParagraphStyle *)jobsParagraphStyleLeft;
/// 居中对齐
-(NSMutableParagraphStyle *)jobsParagraphStyleCenter;
/// 居右对齐
-(NSMutableParagraphStyle *)jobsParagraphStyleRight;
/// 文本两端对齐（文本自动填充到文本框的两侧，可以在每行的开头和结尾添加额外的空格或调整字母间距，以实现两端对齐效果）
-(NSMutableParagraphStyle *)jobsParagraphStyleJustified;
/// 主要用于支持多语言和本地化的应用，以确保文本对齐方式在不同语言环境下都是合适的。
-(NSMutableParagraphStyle *)jobsParagraphStyleNatural;
/// 通过NSTextAlignment映射NSParagraphStyle *
-(JobsRetParagraphStyleByTextAlignmentBlock _Nonnull)jobsparagraphStyleByTextAlignment;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_NSMUTABLEPARAGRAPHSTYLE_2FA2B267D3 */
