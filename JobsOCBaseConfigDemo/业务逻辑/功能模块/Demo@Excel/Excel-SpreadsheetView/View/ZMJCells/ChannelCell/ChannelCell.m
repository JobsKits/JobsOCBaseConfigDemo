//
//  ChannelCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ChannelCell.h"

@interface ChannelCell ()

@end

@implementation ChannelCell

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

- (void)setChannel:(NSString *)channel {
    _channel = channel;
    self.label.text = channel;
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
            label.byBgColor(JobsDarkGrayColor);
            label.byFont(UIFontWeightBoldSize(JobsWidth(15)));
            label.byTextCor(JobsLightGrayColor.colorWithAlphaComponentBy(.7f));
            label.byTextAlignment(NSTextAlignmentCenter);
            label.byNumberOfLines(2);
            self.addSubview(label);
        });
    }return _label;
}

@end
