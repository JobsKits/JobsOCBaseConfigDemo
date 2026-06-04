//
//  UIButton+TextView.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIBUTTON_TEXTVIEW_2618AFC801
#define JOBS_HEADER_GUARD_UIBUTTON_TEXTVIEW_2618AFC801

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <MJRefreshExtra/UIView+Extra.h>
#import <MJRefreshExtra/UITextItem+Extra.h>
#import <MJRefreshExtra/BaseTextView.h>

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
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

NS_ASSUME_NONNULL_BEGIN
/// UIButton.titleLabel 是 UILabel，无法处理富文本的点击事件。
/// 此分类对 UIButton.titleLabel 和 UIButton.subtitleLabel 进行覆盖屏蔽（非KVC替换）
/// 以期望可以响应富文本的点击事件
@interface UIButton (TextView)<UITextViewDelegate>

Prop_strong()BaseTextView *titleTextView;
Prop_strong()BaseTextView *subtitleTextView;

@end

NS_ASSUME_NONNULL_END
/**

     /// 用 UITextView 替换 UIButton.titleLabel
     -(JobsReturnButtonByAttributedStringBlock _Nonnull)jobsResetBtnTextViewNormalAttributedTitle{
         @jobs_weakify(self)
         return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
             @jobs_strongify(self)
             if(title){
                 self.jobsResetBtnNormalAttributedTitle(title.changeTextColorBy(JobsClearColor).removeHyperlinks);
                 self.titleTextView.frame = self.titleLabel.frame;
                 self.titleTextView.attributedText = title;
                 self.jobsResetBtnNormalAttributedTitle(nil);
             }return self;
         };
     }
     /// 用 UITextView 替换 UIButton.subtitleLabel
     -(JobsReturnButtonByAttributedStringBlock _Nonnull)jobsResetBtnTextViewNormalAttributedSubTitle{
         @jobs_weakify(self)
         return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
             @jobs_strongify(self)
             if(title){
                 self.jobsResetBtnNormalAttributedSubTitle(title.changeTextColorBy(JobsClearColor));
                 self.subtitleTextView.frame = self.subtitleLabel.frame;
                 self.subtitleTextView.attributedText = title;
                 self.jobsResetBtnNormalAttributedSubTitle(nil);
             }return self;
         };
     }
 */
#endif /* JOBS_HEADER_GUARD_UIBUTTON_TEXTVIEW_2618AFC801 */
