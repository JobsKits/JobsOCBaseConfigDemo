//
//  HourCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "HourCell.h"

@interface HourCell ()

@end

@implementation HourCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.label.alpha = 1;
    }return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.label.alpha = 1;
    }return self;
}
#pragma mark —— LazyLoad
@synthesize label = _label;
-(UILabel *)label{
    if(!_label){
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byFrame(self.bounds);
            label.byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
            label.byBgColor([UIColor colorWithRed:0.2 green:0.4 blue:0.8 alpha:1]);
            label.byFont([UIFont systemFontOfSize:12]);
            label.byTextCor([UIColor whiteColor]);
            label.byTextAlignment(NSTextAlignmentCenter);
            label.byNumberOfLines(2);
            self.addSubview(label);
        });
    }return _label;
}

@end
