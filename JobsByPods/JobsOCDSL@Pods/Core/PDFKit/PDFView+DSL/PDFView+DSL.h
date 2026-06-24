//
//  PDFView+DSL.h
//  JobsOCDSL
//
#ifndef JOBS_HEADER_GUARD_PDFVIEW_DSL
#define JOBS_HEADER_GUARD_PDFVIEW_DSL

#import <PDFKit/PDFKit.h>

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

@interface PDFView (JobsChain)

+(JobsRetPDFViewByVoidBlock _Nonnull)byPDFView;
-(JobsRetPDFViewByPDFDocumentBlock _Nonnull)byDocument;
-(JobsRetPDFViewByDelegateBlock _Nonnull)byDelegate;
-(JobsRetPDFViewByBOOLBlock _Nonnull)byAutoScales;
-(JobsRetPDFViewByCGFloatBlock _Nonnull)byScaleFactor;
-(JobsRetPDFViewByCorBlock _Nonnull)byBackgroundColor;
-(JobsRetPDFViewByPDFDisplayModeBlock _Nonnull)byDisplayMode;
-(JobsRetPDFViewByPDFDisplayDirectionBlock _Nonnull)byDisplayDirection;
-(JobsRetPDFViewByBOOLBlock _Nonnull)byDisplaysPageBreaks;
-(JobsRetPDFViewByPDFDisplayBoxBlock _Nonnull)byDisplayBox;
-(JobsRetPDFViewByVoidBlock _Nonnull)byGoToFirstPage;
-(JobsRetPDFViewByVoidBlock _Nonnull)byGoToLastPage;
-(JobsRetPDFViewByVoidBlock _Nonnull)byGoToNextPage;
-(JobsRetPDFViewByVoidBlock _Nonnull)byGoToPreviousPage;
#if defined(PDFKIT_PLATFORM_OSX)
-(JobsRetPDFViewByPDFAreaOfInterestBlock _Nonnull)bySetCursorForAreaOfInterest;
#endif
-(JobsRetPDFViewByPDFActionBlock _Nonnull)byPerformAction API_AVAILABLE(ios(11.0));
-(JobsRetPDFViewByVoidBlock _Nonnull)byClearSelection;
-(JobsRetPDFViewByVoidBlock _Nonnull)byLayoutDocumentView;
-(JobsRetPDFViewByPDFPageBlock _Nonnull)byAnnotationsChangedOnPage API_AVAILABLE(ios(11.0));

@end
NS_ASSUME_NONNULL_END
#endif
