//
//  PreviewVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "PreviewVC.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

@interface PreviewVC ()

Prop_strong()UILabel *previewLabel;

@end

@implementation PreviewVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor([UIColor whiteColor]);
    self.preferredContentSize = CGSizeMake(JobsWidth(220), JobsWidth(160));
    [self.view addSubview:self.previewLabel];
    [self.previewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(JobsWidth(16),
                                                             JobsWidth(16),
                                                             JobsWidth(16),
                                                             JobsWidth(16)));
    }];
}

-(UILabel *)previewLabel{
    if (!_previewLabel) {
        _previewLabel = UILabel.new
            .byText(self.previewText)
            .byTextCor(HEXCOLOR(0x3D4A58))
            .byTextAlignment(NSTextAlignmentCenter)
            .byNumberOfLines(0);
    };return _previewLabel;
}

@end
