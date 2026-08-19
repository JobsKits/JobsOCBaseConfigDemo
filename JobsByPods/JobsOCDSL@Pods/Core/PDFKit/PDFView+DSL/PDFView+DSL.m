//
//  PDFView+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月24日，星期三.
//

#import "PDFView+DSL.h"

@implementation PDFView (JobsChain)
+(JobsRetPDFViewByVoidBlock _Nonnull)byPDFView{
    return ^__kindof PDFView *_Nullable(void){
        return [[self alloc] init];
    };
}

-(JobsRetPDFViewByPDFDocumentBlock _Nonnull)byDocument{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFDocument *_Nullable data){
        @jobs_strongify(self)
        self.document = data;
        return self;
    };
}

-(JobsRetPDFViewByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(id<PDFViewDelegate> _Nullable data){
        @jobs_strongify(self)
        self.delegate = data;
        return self;
    };
}

-(JobsRetPDFViewByBOOLBlock _Nonnull)byAutoScales{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.autoScales = data;
        return self;
    };
}

-(JobsRetPDFViewByCGFloatBlock _Nonnull)byScaleFactor{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.scaleFactor = data;
        return self;
    };
}

-(JobsRetPDFViewByCorBlock _Nonnull)byBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.backgroundColor = data;
        return self;
    };
}

-(JobsRetPDFViewByPDFDisplayModeBlock _Nonnull)byDisplayMode{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFDisplayMode data){
        @jobs_strongify(self)
        self.displayMode = data;
        return self;
    };
}

-(JobsRetPDFViewByPDFDisplayDirectionBlock _Nonnull)byDisplayDirection{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFDisplayDirection data){
        @jobs_strongify(self)
        self.displayDirection = data;
        return self;
    };
}

-(JobsRetPDFViewByBOOLBlock _Nonnull)byDisplaysPageBreaks{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.displaysPageBreaks = data;
        return self;
    };
}

-(JobsRetPDFViewByPDFDisplayBoxBlock _Nonnull)byDisplayBox{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFDisplayBox data){
        @jobs_strongify(self)
        self.displayBox = data;
        return self;
    };
}

-(JobsRetPDFViewByVoidBlock _Nonnull)byGoToFirstPage{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(void){
        @jobs_strongify(self)
        [self goToFirstPage:nil];
        return self;
    };
}

-(JobsRetPDFViewByVoidBlock _Nonnull)byGoToLastPage{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(void){
        @jobs_strongify(self)
        [self goToLastPage:nil];
        return self;
    };
}

-(JobsRetPDFViewByVoidBlock _Nonnull)byGoToNextPage{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(void){
        @jobs_strongify(self)
        [self goToNextPage:nil];
        return self;
    };
}

-(JobsRetPDFViewByVoidBlock _Nonnull)byGoToPreviousPage{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(void){
        @jobs_strongify(self)
        [self goToPreviousPage:nil];
        return self;
    };
}

#if defined(PDFKIT_PLATFORM_OSX)
-(JobsRetPDFViewByPDFAreaOfInterestBlock _Nonnull)bySetCursorForAreaOfInterest{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFAreaOfInterest data){
        @jobs_strongify(self)
        [self setCursorForAreaOfInterest:data];
        return self;
    };
}
#endif

-(JobsRetPDFViewByPDFActionBlock _Nonnull)byPerformAction{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFAction *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)) {
            if (data) [self performAction:data];
        };return self;
    };
}

-(JobsRetPDFViewByVoidBlock _Nonnull)byClearSelection{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(void){
        @jobs_strongify(self)
        [self clearSelection];
        return self;
    };
}

-(JobsRetPDFViewByVoidBlock _Nonnull)byLayoutDocumentView{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(void){
        @jobs_strongify(self)
        [self layoutDocumentView];
        return self;
    };
}

-(JobsRetPDFViewByPDFPageBlock _Nonnull)byAnnotationsChangedOnPage{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFPage *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)) {
            if (data) [self annotationsChangedOnPage:data];
        };return self;
    };
}

@end
