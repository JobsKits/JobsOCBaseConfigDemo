//
//  SlotCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "SlotCell.h"

@interface SlotCell ()

Prop_strong()UILabel *minutesLabel;
Prop_strong()UILabel *titleLabel;
Prop_strong()UILabel *tableHighlightLabel;

@end

@implementation SlotCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.minutesLabel.byAlpha(1);
        self.titleLabel.byAlpha(1);
        self.tableHighlightLabel.byAlpha(1);
    };return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.minutesLabel.byAlpha(1);
        self.titleLabel.byAlpha(1);
        self.tableHighlightLabel.byAlpha(1);
    };return self;
}

- (void)setMinutes:(NSInteger)minutes {
    _minutes = minutes;
    self.minutesLabel.byText([NSString stringWithFormat:@"%02ld", (long)minutes])
        .makeLabelByShowingType(UILabelShowingType_03);
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.byText(title)
        .makeLabelByShowingType(UILabelShowingType_03);
}

- (void)setTableHighlight:(NSString *)tableHighlight {
    _tableHighlight = tableHighlight;
    self.tableHighlightLabel.byText(tableHighlight)
        .makeLabelByShowingType(UILabelShowingType_03);
}
#pragma mark —— LazyLoad
-(UILabel *)minutesLabel{
    if (!_minutesLabel) {
        @jobs_weakify(self)
        _minutesLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.left.equalTo(self);
                    make.height.mas_equalTo(JobsWidth(10));
                });
        });
    };return _minutesLabel;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        @jobs_weakify(self)
        _titleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.minutesLabel.mas_bottom);
                    make.left.equalTo(self);
                    make.height.mas_equalTo(JobsWidth(10));
                });
        });
    };return _titleLabel;
}

-(UILabel *)tableHighlightLabel{
    if (!_tableHighlightLabel) {
        @jobs_weakify(self)
        _tableHighlightLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.titleLabel.mas_bottom);
                    make.left.equalTo(self);
                    make.height.mas_equalTo(JobsWidth(10));
                });
        });
    };return _tableHighlightLabel;
}

@end
