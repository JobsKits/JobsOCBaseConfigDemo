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
    UILabel *label = UILabel.new
        .byText(self.previewText)
        .byTextCor(HEXCOLOR(0x3D4A58))
        .byTextAlignment(NSTextAlignmentCenter)
        .byNumberOfLines(0);
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:label];
    [NSLayoutConstraint activateConstraints:@[
        [label.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:JobsWidth(16)],
        [label.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-JobsWidth(16)],
        [label.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:JobsWidth(16)],
        [label.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-JobsWidth(16)]
    ]];
}

@end
