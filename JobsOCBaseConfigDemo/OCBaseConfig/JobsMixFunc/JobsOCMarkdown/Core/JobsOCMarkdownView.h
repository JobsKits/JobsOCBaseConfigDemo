//
//  JobsOCMarkdownView.h
//  JobsOCMarkdown
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>

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
#import <WebKit/WebKit.h>
#import "JobsOCMarkdownConfiguration.h"
#import "JobsOCMarkdownDocument.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@class JobsOCMarkdownView;

@protocol JobsOCMarkdownViewDelegate <NSObject>
@optional
-(void)markdownViewDidFinishRendering:(JobsOCMarkdownView *)markdownView;
-(jobsByJobsOCMarkdownViewBlock _Nonnull)jobsMarkdownViewDidFinishRendering;
-(void)markdownView:(JobsOCMarkdownView *)markdownView
  didRequestOpenURL:(NSURL *)URL;
-(void)markdownView:(JobsOCMarkdownView *)markdownView
   didFailWithError:(NSError *)error;
@end

@interface JobsOCMarkdownView : UIView

Prop_weak(nullable)id<JobsOCMarkdownViewDelegate> delegate;
Prop_strong(readonly)WKWebView *webView;
Prop_strong(readonly,nullable)JobsOCMarkdownDocument *document;
Prop_strong(readonly)JobsOCMarkdownConfiguration *markdownConfiguration;

-(JobsRetJobsOCMarkdownViewByIDBlock _Nonnull)byDelegate;
-(JobsRetIDByJobsOCMarkdownConfigurationBlock _Nonnull)byConfiguration;
-(JobsRetIDByJobsOCMarkdownDocumentBlock _Nonnull)byDocument;
-(jobsByJobsOCMarkdownDocumentBlock _Nonnull)loadDocument;
-(void)loadDocument:(JobsOCMarkdownDocument *)document
      configuration:(nullable JobsOCMarkdownConfiguration *)configuration;
-(void)renderMarkdown:(NSString *)markdown
                title:(nullable NSString *)title
              baseURL:(nullable NSURL *)baseURL
        readAccessURL:(nullable NSURL *)readAccessURL
        configuration:(nullable JobsOCMarkdownConfiguration *)configuration;
-(jobsByVoidBlock _Nonnull)reloadDocument;
-(void)scrollToAnchor:(NSString *)anchor
             animated:(BOOL)animated;
-(void)findText:(NSString *)text
      backwards:(BOOL)backwards
     completion:(void (^_Nullable)(WKFindResult *result))completion API_AVAILABLE(ios(14.5));

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCMarkdownView
-(JobsRetJobsOCMarkdownViewByBOOLBlock _Nonnull)byRuntimeReady;
-(JobsRetJobsOCMarkdownViewByJobsOCMarkdownConfigurationBlock _Nonnull)byMarkdownConfiguration;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCMarkdownView
@end

NS_ASSUME_NONNULL_END
