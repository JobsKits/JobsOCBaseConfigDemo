//
//  JobsOCMarkdownView.h
//  JobsOCMarkdown
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "JobsOCMarkdownConfiguration.h"
#import "JobsOCMarkdownDocument.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@class JobsOCMarkdownView;

@protocol JobsOCMarkdownViewDelegate <NSObject>
@optional
-(void)markdownViewDidFinishRendering:(JobsOCMarkdownView *)markdownView;
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

-(instancetype)byConfiguration:(JobsOCMarkdownConfiguration *)configuration;
-(instancetype)byDocument:(JobsOCMarkdownDocument *)document;
-(void)loadDocument:(JobsOCMarkdownDocument *)document;
-(void)loadDocument:(JobsOCMarkdownDocument *)document
      configuration:(nullable JobsOCMarkdownConfiguration *)configuration;
-(void)renderMarkdown:(NSString *)markdown
                title:(nullable NSString *)title
              baseURL:(nullable NSURL *)baseURL
        readAccessURL:(nullable NSURL *)readAccessURL
        configuration:(nullable JobsOCMarkdownConfiguration *)configuration;
-(void)reloadDocument;
-(void)scrollToAnchor:(NSString *)anchor
             animated:(BOOL)animated;
-(void)findText:(NSString *)text
      backwards:(BOOL)backwards
     completion:(void (^_Nullable)(WKFindResult *result))completion API_AVAILABLE(ios(14.5));

@end

NS_ASSUME_NONNULL_END
