//
//  PreviewVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "PreviewVC.h"

@interface PreviewVC ()

@end

@implementation PreviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor([UIColor whiteColor]);
    self.preferredContentSize = CGSizeMake(JobsWidth(220), JobsWidth(160));
    jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byText(self.previewText)
            .byTextCor(HEXCOLOR(0x3D4A58))
            .byTextAlignment(NSTextAlignmentCenter)
            .byNumberOfLines(0)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(JobsWidth(16),
                                                                     JobsWidth(16),
                                                                     JobsWidth(16),
                                                                     JobsWidth(16)));
            });
    });
}

@end
