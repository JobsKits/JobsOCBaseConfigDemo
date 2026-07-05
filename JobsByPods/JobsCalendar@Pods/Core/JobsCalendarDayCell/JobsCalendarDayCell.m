//
//  JobsCalendarDayCell.m
//  JobsCalendar
//
//  Created by Jobs on 2026年7月1日，星期三.
//

#import "JobsCalendarDayCell.h"

@interface JobsCalendarDayCell ()

Prop_strong(readwrite)UILabel *titleLabel;
Prop_strong(readwrite)UILabel *subtitleLabel;
Prop_strong(readwrite)UIImageView *imageView;
Prop_strong(readwrite)UIView *eventDotView;
Prop_strong()UIView *selectionView;

@end

@implementation JobsCalendarDayCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.clearColor;
        self.selectionView = UIView.new;
        self.selectionView.userInteractionEnabled = NO;
        self.selectionView.hidden = YES;
        [self addSubview:self.selectionView];
        self.titleLabel = UILabel.new;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.userInteractionEnabled = NO;
        [self addSubview:self.titleLabel];
        self.subtitleLabel = UILabel.new;
        self.subtitleLabel.textAlignment = NSTextAlignmentCenter;
        self.subtitleLabel.userInteractionEnabled = NO;
        [self addSubview:self.subtitleLabel];
        self.imageView = UIImageView.new;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.imageView.userInteractionEnabled = NO;
        [self addSubview:self.imageView];
        self.eventDotView = UIView.new;
        self.eventDotView.userInteractionEnabled = NO;
        self.eventDotView.hidden = YES;
        [self addSubview:self.eventDotView];
    };return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    CGFloat circleSide = MIN(MIN(width, height) * .64f, 38);
    CGFloat titleHeight = 24;
    CGFloat titleY = self.subtitleLabel.text.length ? MAX(2, (height - 42) * .34f) : MAX(2, (height - titleHeight) * .42f);
    self.selectionView.frame = CGRectMake((width - circleSide) / 2, titleY + (titleHeight - circleSide) / 2, circleSide, circleSide);
    self.selectionView.layer.cornerRadius = circleSide / 2;
    self.titleLabel.frame = CGRectMake(0, titleY, width, titleHeight);
    self.subtitleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame) - 1, width, 15);
    self.imageView.frame = CGRectMake((width - 14) / 2, CGRectGetMaxY(self.subtitleLabel.frame), 14, 14);
    self.eventDotView.frame = CGRectMake((width - 5) / 2, height - 8, 5, 5);
    self.eventDotView.layer.cornerRadius = 2.5f;
}

-(void)jobsConfigureByTitle:(nullable NSString *)title
                   subtitle:(nullable NSString *)subtitle
                      image:(nullable UIImage *)image
                 appearance:(JobsCalendarAppearance *)appearance
              monthPosition:(JobsCalendarMonthPosition)monthPosition
                    enabled:(BOOL)enabled
                   selected:(BOOL)selected
                      today:(BOOL)today
                eventsCount:(NSInteger)eventsCount{
    self.monthPosition = monthPosition;
    self.enabled = enabled;
    self.selected = selected;
    self.titleLabel.text = title;
    self.subtitleLabel.text = subtitle;
    self.imageView.image = image;
    self.titleLabel.font = appearance.titleFont;
    self.subtitleLabel.font = appearance.subtitleFont;
    BOOL placeholder = monthPosition != JobsCalendarMonthPositionCurrent;
    self.selectionView.hidden = !(selected || today);
    self.selectionView.backgroundColor = selected ? appearance.selectionColor : appearance.todayColor;
    self.titleLabel.textColor = selected ? appearance.titleSelectionColor : (today ? appearance.titleTodayColor : (placeholder ? appearance.titlePlaceholderColor : appearance.titleDefaultColor));
    self.subtitleLabel.textColor = selected ? appearance.subtitleSelectionColor : (placeholder ? appearance.subtitlePlaceholderColor : appearance.subtitleDefaultColor);
    self.eventDotView.hidden = eventsCount <= 0;
    self.eventDotView.backgroundColor = selected ? appearance.eventSelectionColor : appearance.eventDefaultColor;
    self.alpha = enabled ? 1 : .35f;
    [self setNeedsLayout];
}

@end
