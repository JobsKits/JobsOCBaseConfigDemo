//
//  ZMJChartBarCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ZMJChartBarCell.h"

@interface ZMJChartBarCell ()

@end

@implementation ZMJChartBarCell : ZMJCell

- (void)layoutSubviews {
    [super layoutSubviews];
    self.btn.byAlpha(1);

    self.colorBarView.byAlpha(1);

}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    };return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        
    };return self;
}

@end
