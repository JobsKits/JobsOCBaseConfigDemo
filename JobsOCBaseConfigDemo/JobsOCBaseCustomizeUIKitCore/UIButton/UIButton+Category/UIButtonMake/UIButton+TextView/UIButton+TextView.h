//
//  UIButton+TextView.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIBUTTON_TEXTVIEW_C907ADABF9
#define JOBS_HEADER_GUARD_UIBUTTON_TEXTVIEW_C907ADABF9

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "UIView+Extra.h"
#import "UITextItem+Extra.h"
#import "BaseTextView.h"

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

#import "JobsModelDSL.h"
#import "JobsOCDSL.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// UIButton.titleLabel 是 UILabel，无法处理富文本的点击事件。
/// 此分类对 UIButton.titleLabel 和 UIButton.subtitleLabel 进行覆盖屏蔽（非KVC替换）
/// 以期望可以响应富文本的点击事件
@interface UIButton (TextView)<UITextViewDelegate>

Prop_strong()JobsBasePopupTextView *titleTextView;
Prop_strong()JobsBasePopupTextView *subtitleTextView;

@end

NS_ASSUME_NONNULL_END
/**

     /// 用 UITextView 替换 UIButton.titleLabel
     -(JobsRetButtonByAttributedStringBlock _Nonnull)jobsResetBtnTextViewNormalAttributedTitle{
         @jobs_weakify(self)
         return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
             @jobs_strongify(self)
             if(title){
                 self.jobsResetBtnNormalAttributedTitle(title.changeTextColorBy(JobsClearColor).removeHyperlinks);
                 self.titleTextView.byFrame(self.titleLabel.frame);
                 self.titleTextView.attributedText = title;
                 self.jobsResetBtnNormalAttributedTitle(nil);
             };return self;
         };
     }
     /// 用 UITextView 替换 UIButton.subtitleLabel
     -(JobsRetButtonByAttributedStringBlock _Nonnull)jobsResetBtnTextViewNormalAttributedSubTitle{
         @jobs_weakify(self)
         return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
             @jobs_strongify(self)
             if(title){
                 self.jobsResetBtnNormalAttributedSubTitle(title.changeTextColorBy(JobsClearColor));
                 self.subtitleTextView.byFrame(self.subtitleLabel.frame);
                 self.subtitleTextView.attributedText = title;
                 self.jobsResetBtnNormalAttributedSubTitle(nil);
             };return self;
         };
     }
 */
#endif /* JOBS_HEADER_GUARD_UIBUTTON_TEXTVIEW_C907ADABF9 */
