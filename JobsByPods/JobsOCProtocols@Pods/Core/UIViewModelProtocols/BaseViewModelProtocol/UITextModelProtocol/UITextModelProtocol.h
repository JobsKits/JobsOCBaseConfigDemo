//
//  UITextModelProtocol.h
//  JobsOCProtocols
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITEXTMODELPROTOCOL_67794162DC
#define JOBS_HEADER_GUARD_UITEXTMODELPROTOCOL_67794162DC

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

@protocol UITextModelProtocol <NSObject>
@optional
#pragma mark —— Common
Prop_assign()NSTextAlignment textAlignment;/// 主文字对齐方式
Prop_assign()NSLineBreakMode lineBreakMode;/// 主文字提行方式
Prop_assign()NSTextAlignment subTextAlignment;/// 副文字对齐方式
Prop_assign()NSLineBreakMode subLineBreakMode;/// 副文字提行方式
Prop_assign()CGFloat textLineSpacing;
Prop_copy(nullable)NSString *placeholder;
Prop_strong(nullable)UIColor *placeholderColor;
Prop_strong(nullable)UIFont *placeholderFont;
Prop_assign()NSInteger curWordCount;/// 目前字数
Prop_assign()NSInteger maxWordCount;/// 最大限制字数
#pragma mark —— Normal
/// 主标题
Prop_copy(nullable)NSString *text;
Prop_strong(nullable)UIFont *font;
Prop_strong(nullable)UIColor *textCor;/// 主字体颜色
Prop_strong(nullable)NSAttributedString *attributedTitle API_AVAILABLE(ios(6.0));
/// 子标题
Prop_copy(nullable)NSString *subText;
Prop_strong(nullable)UIFont *subFont;
Prop_strong(nullable)UIColor *subTextCor;/// 主字体颜色
Prop_strong(nullable)NSAttributedString *attributedSubTitle API_AVAILABLE(ios(6.0));
#pragma mark —— Selected
/// 主标题
Prop_copy(nullable)NSString *selectedText;
Prop_strong(nullable)UIFont *selectedFont;
Prop_strong(nullable)UIColor *selectedTextCor;/// 主字体颜色
Prop_strong(nullable)NSAttributedString *selectedAttributedText API_AVAILABLE(ios(6.0));
/// 子标题
Prop_copy(nullable)NSString *selectedSubText;
Prop_strong(nullable)UIFont *selectedSubFont;
Prop_strong(nullable)UIColor *selectedSubTextCor;/// 主字体颜色
Prop_strong(nullable)NSAttributedString *selectedAttributedSubText API_AVAILABLE(ios(6.0));

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITEXTMODELPROTOCOL_67794162DC */
