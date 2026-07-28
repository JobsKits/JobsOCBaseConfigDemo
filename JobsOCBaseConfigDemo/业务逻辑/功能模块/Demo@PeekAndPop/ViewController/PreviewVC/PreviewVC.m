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

@implementation PreviewVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(JobsSystemBackgroundColor);
    self.preferredContentSize = CGSizeMake(JobsWidth(220), JobsWidth(160));
    self.previewLabel.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(JobsWidth(16),
                                                             JobsWidth(16),
                                                             JobsWidth(16),
                                                             JobsWidth(16)));
    });
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

@end
