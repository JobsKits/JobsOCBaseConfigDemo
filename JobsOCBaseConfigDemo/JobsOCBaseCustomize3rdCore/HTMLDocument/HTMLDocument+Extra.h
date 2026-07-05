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

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTMLDocument (Extra)

+(JobsRetHTMLDocumentByStringBlock _Nonnull)initBy;
/// 提取 HTML 里面的有效文字内容
+(JobsRetStrByStrBlock _Nonnull)formatHTML;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_HTMLDOCUMENT_EXTRA_4E1EB9308A */
