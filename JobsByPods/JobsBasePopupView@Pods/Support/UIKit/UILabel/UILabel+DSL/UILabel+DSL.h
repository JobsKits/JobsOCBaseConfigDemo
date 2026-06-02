//
//  UILabel+DSL.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UILABEL_DSL_04600DCDA9
#define JOBS_HEADER_GUARD_UILABEL_DSL_04600DCDA9

#pragma once

#import <UIKit/UIKit.h>

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

@interface UILabel (DSL)

-(JobsRetLabelByCorBlock _Nonnull)byTextCor;
-(JobsRetLabelByFontBlock _Nonnull)byFont;
-(JobsRetLabelByTextAlignmentBlock _Nonnull)byTextAlignment;
-(JobsRetLabelByTextBlock _Nonnull)byText;
/// 确定Label的字体大小，使其宽度自适应
-(jobsByVoidBlock _Nonnull)labelAutoWidthByFont;
/// 确定Label的宽度，使字体大小自适应
-(jobsByVoidBlock _Nonnull)labelAutoFontByWidth;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UILABEL_DSL_04600DCDA9 */
