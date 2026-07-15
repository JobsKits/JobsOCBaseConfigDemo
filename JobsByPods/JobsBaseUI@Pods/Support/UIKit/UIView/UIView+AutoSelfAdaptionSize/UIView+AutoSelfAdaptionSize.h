//
//  UIView+AutoSelfAdaptionSize.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_AUTOSELFADAPTIONSIZE_8018963EF3
#define JOBS_HEADER_GUARD_UIVIEW_AUTOSELFADAPTIONSIZE_8018963EF3

#pragma once

#import <CoreText/CoreText.h> // 提供底层文本排版与渲染能力，适合富文本、复杂排版和精细文本控制场景。
#import <UIKit/UIKit.h>

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsRichTextUtils/JobsRichTextUtils.h>)
#import <JobsRichTextUtils/JobsRichTextUtils.h>
#else
#import "JobsRichTextUtils.h"
#endif

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

/// 资料来源：
/// https://github.com/zhuchenglong/LabelDemo
/// https://www.jianshu.com/p/37b3e382dcab

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// UIView & UIButton 文字自适应
@interface UIView (AutoSelfAdaptionSize)
#pragma mark —— UILabel
/// 确定Label的字体大小，使其宽度自适应
-(JobsRetViewByVoidBlock _Nonnull)bySizeToFit;
/// 确定Label的宽度，使字体大小自适应
-(JobsRetViewByVoidBlock _Nonnull)labelAutoFontByWidth;
#pragma mark —— UIButton
/// 确定Button的字体大小，使其宽度自适应
-(JobsRetViewByVoidBlock _Nonnull)buttonAutoWidthByFont;
/// 确定Button的宽度，使字体大小自适应
-(JobsRetViewByVoidBlock _Nonnull)buttonAutoFontByWidth;
/// 自适应宽度
-(CGRect)getFrameWithFreeWidth:(CGPoint)origin
                      maxHight:(CGFloat)maxHight;
/// 自适应高度
-(CGRect)getFrameWithFreeHight:(CGPoint)origin
                      maxWidth:(CGFloat)maxWidth;
/// 自适应宽度--->可调整字间距
-(CGRect)getFrameWithFreeWidth:(CGPoint)origin
                      maxHight:(CGFloat)maxHight
                     textSpace:(CGFloat)textSpace;
/// 自适应高度--->可调整字间距和行间距
-(CGRect)getFrameWithFreeHight:(CGPoint)origin
                      maxWidth:(CGFloat)maxWidth
                     textSpace:(CGFloat)textSpace
                     lineSpace:(CGFloat)lineSpace;
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_AUTOSELFADAPTIONSIZE_8018963EF3 */
