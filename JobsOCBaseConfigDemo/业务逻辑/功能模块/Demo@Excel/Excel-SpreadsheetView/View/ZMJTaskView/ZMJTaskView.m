//
//  ZMJTaskView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jason on 2018/2/11.
//  Copyright © 2018年 keshiim. All rights reserved.
//

#import "ZMJTaskView.h"

#import "JobsLanMgr.h"

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
        UILabel *label = [UILabel new];
        label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.textColor = TitleColor;
        [self addSubview:label];
        label;
    });
    self.startTimeTitleLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:10];
        label.text = @"Start time:".tr;
        label.textColor = TitleColor;
        [self addSubview:label];
        label;
    });
    self.startTimeLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:10];
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.textColor = ValueColor;
        [self addSubview:label];
        label;
    });
    self.endTimeTitleLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:10];
        label.text = @"End time:".tr;
        label.textColor = TitleColor;
        [self addSubview:label];
        label;
    });
    self.endTimeLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:10];
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.textColor = ValueColor;
        [self addSubview:label];
        label;
    });
    self.separatorLine = ({
        UIView *line = [UIView new];
        line.backgroundColor = LineColor;
        [self addSubview:line];
        line;
    });
    self.viewDetailLabel = ({
        UILabel *label = [UILabel new];
        label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.text = @"View the detail".tr;
        label.textColor = ValueColor;
        [self addSubview:label];
        label;
    });
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.taskTitleLabel sizeToFit];
        self.taskTitleLabel
            .byX(12.f)
            .byY(12.f)
            .byWidth(self.width - 24.f);
        [self.startTimeTitleLabel sizeToFit];
        self.startTimeTitleLabel
            .byX(12.f)
            .byY(self.taskTitleLabel.maxY + 6.f)
            .byWidth(DateTitleWidth);
        [self.startTimeLabel sizeToFit];
        self.startTimeLabel
            .byX(self.startTimeTitleLabel.maxX + 3.f)
            .byY(self.startTimeTitleLabel.y)
            .byWidth(self.width - 12.f - self.startTimeLabel.x);
        [self.endTimeTitleLabel sizeToFit];
        self.endTimeTitleLabel
            .byX(12.f)
            .byY(self.startTimeTitleLabel.maxY + 2.f)
            .byWidth(DateTitleWidth);
        [self.endTimeLabel sizeToFit];
        self.endTimeLabel
            .byX(self.endTimeTitleLabel.maxX + 3.f)
            .byY(self.endTimeTitleLabel.y)
            .byWidth(self.width - 12.f - self.endTimeLabel.x);
        self.separatorLine
            .byX(0)
            .byY(self.endTimeTitleLabel.maxY + 10.f)
            .byWidth(self.width)
            .byHeight(1.f / UIScreen.mainScreen.scale);
        [self.viewDetailLabel sizeToFit];
        self.viewDetailLabel
            .byX(12.f)
            .byY(self.separatorLine.maxY + 10.f)
            .byWidth(self.width - 24.f);
}

- (CGSize)intrinsicContentSize {
    CGFloat height = 0.f;
    [self layoutIfNeeded];
    height = self.viewDetailLabel.maxY + 12.f;
    return CGSizeMake(self.width, height);
}

// MARK: getter
#pragma mark —— taskTitle
- (void)setTaskTitle:(NSString *)taskTitle {
    _taskTitle = taskTitle;
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:taskTitle];
    [attributedText addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlineStyleSingle)
                           range:NSMakeRange(0, taskTitle.length)];
    [attributedText addAttribute:NSBaselineOffsetAttributeName value:@(NSUnderlineStyleNone)
                           range:NSMakeRange(0, taskTitle.length)];
    self.taskTitleLabel.attributedText = attributedText;
    //self.taskTitleLabel.text = taskTitle;
}

#pragma mark —— startTime
- (void)setStartTime:(NSString *)startTime {
    _startTime = startTime;
    self.startTimeLabel.text = startTime;
}

#pragma mark —— endTime
- (void)setEndTime:(NSString *)endTime {
    _endTime = endTime;
    self.endTimeLabel.text = endTime;
}

@end
