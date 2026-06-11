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


    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.byText(self.previewText);

    label.byTextAlignment(NSTextAlignmentCenter);

    [self.view addSubview:label];
}

@end
