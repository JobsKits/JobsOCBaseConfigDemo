//
//  PreviewVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "PreviewVC.h"

@interface PreviewVC ()

Prop_strong()UILabel *previewLabel;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN PreviewVC
@interface PreviewVC (JobsPropertyDSLSetterAutogen_89d69b7048)
-(void)setPreferredContentSize:(CGSize)data;
-(void)setPreviewText:(NSString * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END PreviewVC

@implementation PreviewVC
- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(PreviewVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.byPreferredContentSize(CGSizeMake(JobsWidth(220), JobsWidth(160)));
        self.previewLabel.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(JobsWidth(16),
                                                                 JobsWidth(16),
                                                                 JobsWidth(16),
                                                                 JobsWidth(16)));
        });
    };
}

-(UILabel *)previewLabel{
    if (!_previewLabel) {
        _previewLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(self.previewText)
                .byTextCor(JobsLabelColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(0);
        });
    };return _previewLabel;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN PreviewVC
-(JobsRetPreviewVCByNSStringBlock _Nonnull)byPreviewText{
    @jobs_weakify(self)
    return ^__kindof PreviewVC * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setPreviewText:data];
        return self;
    };
}
-(JobsRetPreviewVCByCGSizeBlock _Nonnull)byPreferredContentSize{
    @jobs_weakify(self)
    return ^__kindof PreviewVC * _Nullable(CGSize data){
        @jobs_strongify(self)
        [self setPreferredContentSize:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END PreviewVC
@end
