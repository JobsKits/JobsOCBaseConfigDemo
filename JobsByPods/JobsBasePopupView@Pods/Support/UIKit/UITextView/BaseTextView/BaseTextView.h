//
//  BaseTextView.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASETEXTVIEW_D721ACF66A
#define JOBS_HEADER_GUARD_BASETEXTVIEW_D721ACF66A

#pragma once

#import <UIKit/UIKit.h>
#import <JobsBasePopupView/NSString+Sys.h>
#import <JobsBasePopupView/NSMutableArray+Extra.h>
#import <JobsBasePopupView/UITextView+Extra.h>

#if __has_include(<JobsOCRuntimeKits/JobsOCRuntimeKits.h>)
#import <JobsOCRuntimeKits/JobsOCRuntimeKits.h>
#else
#import "JobsOCRuntimeKits.h"
#endif

#if __has_include(<JobsRichTextUtils/JobsRichTextUtils.h>)
#import <JobsRichTextUtils/JobsRichTextUtils.h>
#else
#import "JobsRichTextUtils.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
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

@interface JobsBasePopupTextView : UITextView <BaseProtocol>

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsBasePopupTextView *_Nonnull jobsMakeBasePopupTextView(jobsByJobsBasePopupTextViewBlock _Nonnull block){
    JobsBasePopupTextView *data = JobsBasePopupTextView.alloc.init;
    data.linkTextAttributes = NSObject.linkTextAttributes;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JobsBasePopupTextView *_Nonnull jobsMakeJobsBasePopupTextView(jobsByJobsBasePopupTextViewBlock _Nonnull block){
    return jobsMakeBasePopupTextView(block);
}
/**
 
     -(BaseTextView *)tipsTextView{
         if (!_tipsTextView) {
             @jobs_weakify(self)
             _tipsTextView = jobsMakeBaseTextView(^(__kindof BaseTextView * _Nullable textView) {
                 @jobs_strongify(self)
                 textView
                     .byDelegate(self)
                     .byEditable(NO)
                     .byLinkTextAttributes(@{NSForegroundColorAttributeName:HEXCOLOR(0xCCB17E)})
                     .byUserInteractionEnabled(YES)
                     .byAttributedText(self.richTextWithDataConfigMutArr(jobsMakeMutArr(^(__kindof NSMutableArray <JobsRichTextConfig *>*_Nullable data) {
                         data
                             .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable config) {
                                 config.byFont(UIFontWeightRegularSize(JobsWidth(12)))
                                       .byTextCor(JobsWhiteColor)
                                       .byTargetString(@"Already have account?".tr);
                         //        config.textBgCor = UIColor.clearColor;
                                 config.byParagraphStyle(self.defaultParagraphStyle);
                             }))
                             .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable config) {
                                 config.byFont(UIFontWeightRegularSize(JobsWidth(12)))
                                       .byTextCor(@"#FFC700".cor)
                                       .byTargetString(@" ".add(@"Login Here".tr));
                         //        config.textBgCor = UIColor.clearColor;
                                 config.byParagraphStyle(self.defaultParagraphStyle)
                                       .byUrlStr(@"www.google.com");
                             }));
                     })))
                     .byBgColor(JobsClearColor)
                     .addOn(self)
                     .byAdd(^(MASConstraintMaker *make) {
                         make.centerX.equalTo(self);
                         make.top.equalTo(self.sign_up_btn.mas_bottom).offset(JobsWidth(5));
                         make.height.mas_equalTo(JobsWidth(25));
                         make.width.mas_equalTo(JobsWidth(233));
                     });
                 textView.textContainer.lineFragmentPadding = 0;
                 textView.layoutManager.allowsNonContiguousLayout = YES;
             });
         };return _tipsTextView;
     }
 */
#endif /* JOBS_HEADER_GUARD_BASETEXTVIEW_D721ACF66A */
