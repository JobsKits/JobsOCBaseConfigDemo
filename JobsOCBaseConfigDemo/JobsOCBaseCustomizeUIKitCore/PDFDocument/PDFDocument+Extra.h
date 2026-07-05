//
//  PDFDocument+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_PDFDOCUMENT_EXTRA_4B0FBAFDB0
#define JOBS_HEADER_GUARD_PDFDOCUMENT_EXTRA_4B0FBAFDB0

#import <PDFKit/PDFKit.h> // 提供 PDF 文档的读取、渲染、标注和交互能力。

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface PDFDocument (Extra)

+(JobsRetPDFDocumentByURLBlock _Nonnull)byURL;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_PDFDOCUMENT_EXTRA_4B0FBAFDB0 */
