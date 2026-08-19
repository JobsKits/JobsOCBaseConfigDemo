//
//  ZMJTaskView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
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
        self.setupViews();
    };return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.setupViews();
    };return self;
}

- (jobsByVoidBlock _Nonnull)setupViews {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
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
                    .byText(@"Start time:".jobsTr())
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
                    .byText(@"End time:".jobsTr())
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
                    .byText(@"View the detail".jobsTr())
                    .byTextCor(ValueColor)
                    .addOn(self);
            });
        });
    };
}

- (void)layoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ZMJTaskView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
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
    };
}

- (CGSize)intrinsicContentSize {
    JobsRetCGSizeByVoidBlock action = ((JobsRetCGSizeByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ZMJTaskView.class, @selector(jobsIntrinsicContentSize)))(self, @selector(jobsIntrinsicContentSize));
    return action ? action() : (CGSize){0};
}

-(JobsRetCGSizeByVoidBlock _Nonnull)jobsIntrinsicContentSize{
    @jobs_weakify(self)
    return ^CGSize{
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        CGFloat height = 0.f;
        [self layoutIfNeeded];
        height = self.viewDetailLabel.maxY + 12.f;
        return CGSizeMake(self.width, height);
    };
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
