//
//  PDFView+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月24日，星期三.
//

#import "PDFView+DSL.h"

@implementation PDFView (JobsChain)
+(JobsRetPDFViewByVoidBlock)byPDFView{
    return ^__kindof PDFView *_Nullable(void){
        return [[self alloc] init];
    };
}

-(JobsRetPDFViewByPDFDocumentBlock)byDocument{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFDocument *_Nullable data){
        @jobs_strongify(self)
        self.document = data;
        return self;
    };
}

-(JobsRetPDFViewByDelegateBlock)byDelegate{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(id<PDFViewDelegate> _Nullable data){
        @jobs_strongify(self)
        self.delegate = data;
        return self;
    };
}

-(JobsRetPDFViewByBOOLBlock)byAutoScales{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.autoScales = data;
        return self;
    };
}

-(JobsRetPDFViewByCGFloatBlock)byScaleFactor{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.scaleFactor = data;
        return self;
    };
}

-(JobsRetPDFViewByCorBlock)byBackgroundColor{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.backgroundColor = data;
        return self;
    };
}

-(JobsRetPDFViewByPDFDisplayModeBlock)byDisplayMode{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFDisplayMode data){
        @jobs_strongify(self)
        self.displayMode = data;
        return self;
    };
}

-(JobsRetPDFViewByPDFDisplayDirectionBlock)byDisplayDirection{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFDisplayDirection data){
        @jobs_strongify(self)
        self.displayDirection = data;
        return self;
    };
}

-(JobsRetPDFViewByBOOLBlock)byDisplaysPageBreaks{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.displaysPageBreaks = data;
        return self;
    };
}

-(JobsRetPDFViewByPDFDisplayBoxBlock)byDisplayBox{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFDisplayBox data){
        @jobs_strongify(self)
        self.displayBox = data;
        return self;
    };
}

-(JobsRetPDFViewByVoidBlock)byGoToFirstPage{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(void){
        @jobs_strongify(self)
        [self goToFirstPage:nil];
        return self;
    };
}

-(JobsRetPDFViewByVoidBlock)byGoToLastPage{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(void){
        @jobs_strongify(self)
        [self goToLastPage:nil];
        return self;
    };
}

-(JobsRetPDFViewByVoidBlock)byGoToNextPage{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(void){
        @jobs_strongify(self)
        [self goToNextPage:nil];
        return self;
    };
}

-(JobsRetPDFViewByVoidBlock)byGoToPreviousPage{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(void){
        @jobs_strongify(self)
        [self goToPreviousPage:nil];
        return self;
    };
}

#if defined(PDFKIT_PLATFORM_OSX)
-(JobsRetPDFViewByPDFAreaOfInterestBlock)bySetCursorForAreaOfInterest{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFAreaOfInterest data){
        @jobs_strongify(self)
        [self setCursorForAreaOfInterest:data];
        return self;
    };
}
#endif

-(JobsRetPDFViewByPDFActionBlock)byPerformAction{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFAction *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)) {
            if (data) [self performAction:data];
        };return self;
    };
}

-(JobsRetPDFViewByVoidBlock)byClearSelection{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(void){
        @jobs_strongify(self)
        [self clearSelection];
        return self;
    };
}

-(JobsRetPDFViewByVoidBlock)byLayoutDocumentView{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(void){
        @jobs_strongify(self)
        [self layoutDocumentView];
        return self;
    };
}

-(JobsRetPDFViewByPDFPageBlock)byAnnotationsChangedOnPage{
    @jobs_weakify(self)
    return ^__kindof PDFView *_Nullable(PDFPage *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)) {
            if (data) [self annotationsChangedOnPage:data];
        };return self;
    };
}

@end
