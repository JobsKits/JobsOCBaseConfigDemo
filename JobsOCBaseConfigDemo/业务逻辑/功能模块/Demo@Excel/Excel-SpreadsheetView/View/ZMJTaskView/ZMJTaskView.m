//
//  ZMJTaskView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ZMJTaskView.h"

#ifndef TitleColor
#define TitleColor  UIColor.colorWithHexString(@"999999")
#endif

#ifndef ValueColor
#define ValueColor  UIColor.colorWithHexString(@"666666")
#endif

#ifndef LineColor
#define LineColor   UIColor.colorWithHexString(@"DBDBDB")
#endif

#define DateTitleWidth 45.f

@interface ZMJTaskView () 

Prop_strong()UILabel *taskTitleLabel;
Prop_strong()UILabel *startTimeTitleLabel;
Prop_strong()UILabel *startTimeLabel;
Prop_strong()UILabel *endTimeTitleLabel;
Prop_strong()UILabel *endTimeLabel;
Prop_strong()UIView  *separatorLine;
Prop_strong()UILabel *viewDetailLabel;

@end

@implementation ZMJTaskView
- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        [self setupViews];
    };return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    };return self;
}

- (void)setupViews {
    self.taskTitleLabel = ({
        jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont([UIFont fontWithName:@"HelveticaNeue-Light" size:14])
                .byLineBreakMode(NSLineBreakByWordWrapping)
                .byTextCor(TitleColor)
                .addOn(self);
        });
    });
    self.startTimeTitleLabel = ({
        jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont([UIFont fontWithName:@"HelveticaNeue-Light" size:10])
                .byText(@"Start time:")
                .byTextCor(TitleColor)
                .addOn(self);
        });
    });
    self.startTimeLabel = ({
        jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont([UIFont fontWithName:@"HelveticaNeue-Light" size:10])
                .byLineBreakMode(NSLineBreakByWordWrapping)
                .byTextCor(ValueColor)
                .addOn(self);
        });
    });
    self.endTimeTitleLabel = ({
        jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont([UIFont fontWithName:@"HelveticaNeue-Light" size:10])
                .byText(@"End time:")
                .byTextCor(TitleColor)
                .addOn(self);
        });
    });
    self.endTimeLabel = ({
        jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont([UIFont fontWithName:@"HelveticaNeue-Light" size:10])
                .byLineBreakMode(NSLineBreakByWordWrapping)
                .byTextCor(ValueColor)
                .addOn(self);
        });
    });
    self.separatorLine = ({
        jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(LineColor)
                .addOn(self);
        });
    });
    self.viewDetailLabel = ({
        jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont([UIFont fontWithName:@"HelveticaNeue-Light" size:12])
                .byLineBreakMode(NSLineBreakByWordWrapping)
                .byText(@"View the detail")
                .byTextCor(ValueColor)
                .addOn(self);
        });
    });
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.taskTitleLabel sizeToFit];
    self.taskTitleLabel.x = self.taskTitleLabel.y = 12.f;
    self.taskTitleLabel.maxXByStretch = self.width - 12.f;
    [self.startTimeTitleLabel sizeToFit];
    self.startTimeTitleLabel.x = 12.f;
    self.startTimeTitleLabel.y = self.taskTitleLabel.maxY + 6.f;
    self.startTimeTitleLabel.width = DateTitleWidth;
    [self.startTimeLabel sizeToFit];
    self.startTimeLabel.x = self.startTimeTitleLabel.maxX + 3;
    self.startTimeLabel.y = self.startTimeTitleLabel.y;
    self.startTimeLabel.maxXByStretch = self.width - 12.f;
    [self.endTimeTitleLabel sizeToFit];
    self.endTimeTitleLabel.x = 12.f;
    self.endTimeTitleLabel.y = self.startTimeTitleLabel.maxY + 2.f;
    self.endTimeTitleLabel.width = DateTitleWidth;
    [self.endTimeLabel sizeToFit];
    self.endTimeLabel.x = self.endTimeTitleLabel.maxX + 3;
    self.endTimeLabel.y = self.endTimeTitleLabel.y;
    self.endTimeLabel.maxXByStretch = self.width - 12.f;
    self.separatorLine.x = 0;
    self.separatorLine.y = self.endTimeTitleLabel.maxY + 10.f;
    self.separatorLine.maxXByStretch = self.width;
    self.separatorLine.height = 1 / [UIScreen mainScreen].scale;
    [self.viewDetailLabel sizeToFit];
    self.viewDetailLabel.x = 12.f;
    self.viewDetailLabel.y = self.separatorLine.maxY + 10.f;
    self.viewDetailLabel.maxXByStretch = self.width - 12.f;
}

- (CGSize)intrinsicContentSize {
    CGFloat height = 0.f;
    [self layoutIfNeeded];
    height = self.viewDetailLabel.maxY + 12.f;
    return CGSizeMake(self.width, height);
}

// MARK: getter
- (void)setTaskTitle:(NSString *)taskTitle {
    _taskTitle = taskTitle;
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:taskTitle];
    [attributedText addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlineStyleSingle)
                           range:NSMakeRange(0, taskTitle.length)];
    [attributedText addAttribute:NSBaselineOffsetAttributeName value:@(NSUnderlineStyleNone)
                           range:NSMakeRange(0, taskTitle.length)];
    self.taskTitleLabel.byAttributedString(attributedText);
    //self.taskTitleLabel.text = taskTitle;
}

- (void)setStartTime:(NSString *)startTime {
    _startTime = startTime;
    self.startTimeLabel.byText(startTime);
}

- (void)setEndTime:(NSString *)endTime {
    _endTime = endTime;
    self.endTimeLabel.byText(endTime);
}

@end
