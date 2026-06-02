//
//  BaseTextView.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASETEXTVIEW_E78E1C0334
#define JOBS_HEADER_GUARD_BASETEXTVIEW_E78E1C0334

#import <UIKit/UIKit.h>

#if __has_include(<JobsRichTextUtils/JobsRichTextUtils.h>)
#import <JobsRichTextUtils/JobsRichTextUtils.h>
#else
#import "JobsRichTextUtils.h"
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

@interface BaseTextView : UITextView

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof BaseTextView *_Nonnull jobsMakeBaseTextView(jobsByBaseTextViewBlock _Nonnull block){
    BaseTextView *data = BaseTextView.alloc.init;
    data.linkTextAttributes = NSObject.linkTextAttributes;
    if (block) block(data);
    return data;
}
/**
 
     -(BaseTextView *)tipsTextView{
         if (!_tipsTextView) {
             @jobs_weakify(self)
             _tipsTextView = jobsMakeBaseTextView(^(__kindof BaseTextView * _Nullable textView) {
                 @jobs_strongify(self)
                 textView.byDelegate(self)
                 .byEditable(NO)
                 .byLinkTextAttributes(@{NSForegroundColorAttributeName:HEXCOLOR(0xCCB17E)})
                 .byUserInteractionEnabled(YES)
                 .byAttributedText(self.richTextWithDataConfigMutArr(jobsMakeMutArr(^(__kindof NSMutableArray <JobsRichTextConfig *>*_Nullable data) {
                     data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable config) {
                         config.font = UIFontWeightRegularSize(JobsWidth(12));
                         config.textCor = JobsWhiteColor;
                         config.targetString = @"Already have account?".tr;
                 //        config.textBgCor = UIColor.clearColor;
                         config.paragraphStyle = self.defaultParagraphStyle;
                     }));
                     data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable config) {
                         config.font = UIFontWeightRegularSize(JobsWidth(12));
                         config.textCor = @"#FFC700".cor;
                         config.targetString = @" ".add(@"Login Here".tr);
                 //        config.textBgCor = UIColor.clearColor;
                         config.paragraphStyle = self.defaultParagraphStyle;
                         config.urlStr = @"www.google.com";
                     }));
                 }))).byBgColor(JobsClearColor);

                 textView.textContainer.lineFragmentPadding = 0;
                 textView.layoutManager.allowsNonContiguousLayout = YES;

                 [self.addSubview(textView) mas_makeConstraints:^(MASConstraintMaker *make) {
                     make.centerX.equalTo(self);
                     make.top.equalTo(self.sign_up_btn.mas_bottom).offset(JobsWidth(5));
                     make.height.mas_equalTo(JobsWidth(25));
                     make.width.mas_equalTo(JobsWidth(233));
                 }];
             });
         }return _tipsTextView;
     }
 */
#endif /* JOBS_HEADER_GUARD_BASETEXTVIEW_E78E1C0334 */
