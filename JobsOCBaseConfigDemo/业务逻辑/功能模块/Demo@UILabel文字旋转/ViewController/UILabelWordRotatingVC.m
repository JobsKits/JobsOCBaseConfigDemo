//
//  UILabelWordRotatingVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UILabelWordRotatingVC.h"

@interface UILabelWordRotatingVC ()

@end

@implementation UILabelWordRotatingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label.transformLayer(JobsDirectionLeft);
}
#pragma mark —— LazyLoad
@synthesize label = _label;
-(UILabel *)label{
    if (!_label) {
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
            @jobs_strongify(self)
            label.text = @"输入的内容".tr;
            label.font = UIFontWeightBoldSize(20);
            label.textColor = JobsBlueColor;
            label.frame = jobsMakeFrameByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
                data.jobsX = data.jobsY = data.jobsWidth = data.jobsHeight = JobsWidth(100);
            });self.view.addSubview(label);
        });
    }return _label;
}

@end
