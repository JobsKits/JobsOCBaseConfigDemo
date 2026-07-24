//
//  JobsSwiftParityPDFDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityPDFDemoVC.h"

@interface JobsSwiftParityPDFDemoVC ()

Prop_strong()PDFView *parityPDFView;

@end

@implementation JobsSwiftParityPDFDemoVC

-(NSString *)demoNavigationTitle{
    return @"PDF 浏览";
}

-(NSString *)demoDescription{
    return @"使用 PDFKit DSL 装载本地 Terms of Use.pdf。";
}

-(NSString *)demoIconName{
    return @"doc.richtext.fill";
}

-(NSString *)primaryActionTitle{
    return @"加载 PDF";
}

-(void)configureDemo{
    self.previewImageView.byHidden(YES);
    self.previewTitleLab.byHidden(YES);
    self.parityPDFView.byHidden(NO);
}

-(void)performPrimaryAction{
    NSURL *URL = [NSBundle.mainBundle URLForResource:@"Terms of Use"
                                       withExtension:@"pdf"];
    if (!URL) {
        [self updateStatus:@"未找到 Terms of Use.pdf"];
        return;
    }
    self.parityPDFView
        .byDocument(PDFDocument.byURL(URL))
        .byAutoScales(YES);
    [self updateStatus:@"PDF 已通过 PDFKit DSL 装载"];
}
#pragma mark —— LazyLoad
-(PDFView *)parityPDFView{
    if (!_parityPDFView) {
        _parityPDFView = PDFView.byPDFView()
            .byAutoScales(YES);
        _parityPDFView
            .addOn(self.previewView)
            .byAdd(^(MASConstraintMaker *make) {
                make.edges.equalTo(self.previewView).insets(UIEdgeInsetsMake(
                    JobsWidth(8),
                    JobsWidth(8),
                    JobsWidth(8),
                    JobsWidth(8)
                ));
            });
    };return _parityPDFView;
}

@end
