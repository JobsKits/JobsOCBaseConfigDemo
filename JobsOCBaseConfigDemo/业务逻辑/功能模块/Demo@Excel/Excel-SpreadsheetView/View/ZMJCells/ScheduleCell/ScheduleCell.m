//
//  ScheduleCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ScheduleCell.h"

@interface ScheduleCell ()

@end

@implementation ScheduleCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.label.byAlpha(1);
    };return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        self.label.byAlpha(1);
    };return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.label.byFrame(CGRectInset(self.bounds, 4, 0));
}

- (void)setColor:(UIColor *)color {
    _color = color;
    self.backgroundView.byBgColor(color);
}
#pragma mark —— LazyLoad
@synthesize label = _label;
-(UILabel *)label{
    if(!_label){
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byFont([UIFont boldSystemFontOfSize:12.f])
                .byTextAlignment(NSTextAlignmentLeft)
                .byFrame(self.bounds)
                .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)
                .addOn(self.contentView);
        });
    };return _label;
}

@end
