//
//  JobsMicroLearningBaseVC.h
//  JobsMicroAppLearning
//
//  Created by Jobs on 2026年10月19日，星期一.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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

/// 五个独立 Demo 共用宿主导航、主题与日志；知识说明留在对应 VC 的代码中。
@interface JobsMicroLearningBaseVC : BaseViewController

Prop_strong(readonly)UIStackView *learningStack;
Prop_strong(readonly)UILabel *learningStatus;
-(JobsRetStrByVoidBlock _Nonnull)learningTitle;
-(JobsRetStrByVoidBlock _Nonnull)learningIntroduction;
-(jobsByVoidBlock _Nonnull)buildLearningContent;
-(jobsByViewBlock _Nonnull)appendLearningView;
-(jobsByWKWebViewBlock _Nonnull)appendLearningWebView;
-(void)configureLearningWebView:(WKWebView *)webView localEntryURL:(nullable NSURL *)entryURL;
-(jobsByVoidBlock _Nonnull)refreshLearningWebLayout;
-(jobsByStrBlock _Nonnull)reportLearningStatus;
-(UILabel *)learningLabelWithText:(NSString *)text secondary:(BOOL)secondary;
-(UIButton *)learningButtonWithTitle:(NSString *)title identifier:(NSString *)identifier action:(jobsByBtnBlock)action;
-(UITextField *)learningFieldWithText:(NSString *)text placeholder:(NSString *)placeholder identifier:(NSString *)identifier;
-(nullable NSURL *)learningResourceWithName:(NSString *)name directory:(NSString *)directory;

@end

NS_ASSUME_NONNULL_END
