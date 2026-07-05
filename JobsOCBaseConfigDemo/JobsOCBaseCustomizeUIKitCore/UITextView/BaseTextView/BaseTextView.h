//
//  BaseTextView.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASETEXTVIEW_D721ACF66A
#define JOBS_HEADER_GUARD_BASETEXTVIEW_D721ACF66A

#pragma once

#import <UIKit/UIKit.h>
#import "NSString+Sys.h"
#import "NSString+Menu.h"
#import "NSString+Toast.h"
#import "NSMutableArray+Extra.h"
#import "NSObject+Notification.h"
#import "UITextView+Extra.h"

#import "JobsOCRuntimeKits.h"

#import "JobsRichTextUtils.h"

#import "JobsOCDSL.h"

#import "JobsMakes.h"

#import "JobsLanMgr.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTextView : UITextView <BaseProtocol>

@end

@interface JobsBasePopupTextView : BaseTextView

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof BaseTextView *_Nonnull jobsMakeBaseTextView(jobsByBaseTextViewBlock _Nonnull block){
    BaseTextView *data = BaseTextView.alloc.init;
    data.linkTextAttributes = NSObject.linkTextAttributes;
    if (block) block(data);
    return data;
}

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
                     .byLinkTextAttributes(@{
                         NSForegroundColorAttributeName: HEXCOLOR(0xCCB17E)
                     })
                     .byUserInteractionEnabled(YES)
                     .byAttributedText(self.richTextWithDataConfigMutArr(jobsMakeMutArr(^(__kindof NSMutableArray <JobsRichTextConfig *>*_Nullable data) {
                         data
                             .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable config) {
                                 config
                                     .byFont(UIFontWeightRegularSize(JobsWidth(12)))
                                     .byTextCor(JobsWhiteColor)
                                     .byTargetString(@"Already have account?".tr)
                                     .byParagraphStyle(self.defaultParagraphStyle);
                                 // config.textBgCor = UIColor.clearColor;
                             }))
                             .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable config) {
                                 config
                                     .byFont(UIFontWeightRegularSize(JobsWidth(12)))
                                     .byTextCor(@"#FFC700".cor)
                                     .byTargetString(@" ".add(@"Login Here".tr))
                                     .byParagraphStyle(self.defaultParagraphStyle)
                                     .byUrlStr(@"www.google.com");
                                 // config.textBgCor = UIColor.clearColor;
                             }));
                     })))
                     .byBgColor(JobsClearColor)
                     .addOn(self)
                     .byAdd(^(MASConstraintMaker *make) {
                         @jobs_strongify(self)
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
