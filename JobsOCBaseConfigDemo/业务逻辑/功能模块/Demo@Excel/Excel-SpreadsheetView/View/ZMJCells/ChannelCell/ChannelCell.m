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
        self.label.byAlpha(1);
    };return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.label.byAlpha(1);
    };return self;
}

- (void)setChannel:(NSString *)channel {
    _channel = channel;
    self.label.byText(channel);
}
#pragma mark —— LazyLoad
@synthesize label = _label;
-(UILabel *)label{
    if(!_label){
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byFont(UIFontWeightBoldSize(JobsWidth(15)))
                .byTextCor(JobsLightGrayColor.colorWithAlphaComponentBy(.7f))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(2)
                .byFrame(self.bounds)
                .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)
                .byBgColor(JobsDarkGrayColor)
                .addOn(self);
        });
    };return _label;
}

@end
