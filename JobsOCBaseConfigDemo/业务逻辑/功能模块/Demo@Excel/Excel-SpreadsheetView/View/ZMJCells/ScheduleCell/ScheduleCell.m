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
        self.label.alpha = 1;
    }return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        self.label.alpha = 1;
    }return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.label.frame = CGRectInset(self.bounds, 4, 0);
}

- (void)setColor:(UIColor *)color {
    _color = color;
    self.backgroundView.backgroundColor = color;
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
            label.byFont([UIFont boldSystemFontOfSize:12.f]);
            label.byTextAlignment(NSTextAlignmentLeft);
            self.contentView.addSubview(label);
        });
    }return _label;
}

@end
