//
//  UIButton+TextView.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIBUTTON_TEXTVIEW_EF3DCDD7E9
#define JOBS_HEADER_GUARD_UIBUTTON_TEXTVIEW_EF3DCDD7E9

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsLinkageMenuView/NSObject+Extra.h>

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
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
@interface UIButton (JobsLinkageMenuViewTextView)<UITextViewDelegate>

Prop_strong()BaseTextView *titleTextView;
Prop_strong()BaseTextView *subtitleTextView;

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
#endif /* JOBS_HEADER_GUARD_UIBUTTON_TEXTVIEW_EF3DCDD7E9 */
