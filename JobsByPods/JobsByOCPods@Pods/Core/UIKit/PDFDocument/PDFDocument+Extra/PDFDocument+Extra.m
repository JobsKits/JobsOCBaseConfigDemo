//
//  PDFDocument+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "PDFDocument+Extra.h"

@implementation PDFDocument (Extra)

+(JobsRetPDFDocumentByURLBlock _Nonnull)byURL{
    return ^ __kindof PDFDocument *_Nullable(NSURL *_Nullable pdfURL){
        return [PDFDocument.alloc initWithURL:pdfURL];
    };
}

@end
