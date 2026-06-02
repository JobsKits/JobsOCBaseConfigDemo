//
//  HTMLDocument+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_HTMLDOCUMENT_EXTRA_4E1EB9308A
#define JOBS_HEADER_GUARD_HTMLDOCUMENT_EXTRA_4E1EB9308A

#import <UIKit/UIKit.h>

#if __has_include(<HTMLReader/HTMLReader.h>)
#import <HTMLReader/HTMLReader.h>
#else
#import "HTMLReader.h"
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

@interface HTMLDocument (Extra)

+(JobsReturnHTMLDocumentByStringBlock _Nonnull)initBy;
/// 提取 HTML 里面的有效文字内容
+(JobsRetStrByStrBlock _Nonnull)formatHTML;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_HTMLDOCUMENT_EXTRA_4E1EB9308A */
