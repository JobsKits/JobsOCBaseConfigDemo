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
        self.label.byAlpha(1);

    };return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.label.byAlpha(1);

    };return self;
}
#pragma mark —— LazyLoad
@synthesize label = _label;
-(UILabel *)label{
    if(!_label){
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byFont([UIFont systemFontOfSize:12])
                .byTextCor([UIColor whiteColor])
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(2)
                .byFrame(self.bounds)
                .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)
            .byBgColor([UIColor colorWithRed:0.2 green:0.4 blue:0.8 alpha:1])
            .addOn(self);
        });
    };return _label;
}

@end
