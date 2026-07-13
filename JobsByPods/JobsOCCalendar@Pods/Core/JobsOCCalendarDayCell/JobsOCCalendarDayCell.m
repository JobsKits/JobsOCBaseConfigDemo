//
//  JobsOCCalendarDayCell.m
//  JobsOCCalendar
//
//  Created by Jobs on 2026年7月1日，星期三.
//

#import "JobsOCCalendarDayCell.h"

@interface JobsOCCalendarDayCell ()

Prop_strong(readwrite)UILabel *titleLabel;
Prop_strong(readwrite)UILabel *subtitleLabel;
Prop_strong(readwrite)UIImageView *imageView;
Prop_strong(readwrite)UIView *eventDotView;
Prop_strong()UIView *selectionView;

@end

@implementation JobsOCCalendarDayCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.byBgColor(UIColor.clearColor);
        self.selectionView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byUserInteractionEnabled(NO)
                .byHidden(YES)
                .addOn(self);
        });
        self.titleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextAlignment(NSTextAlignmentCenter)
                .byUserInteractionEnabled(NO)
                .addOn(self);
        });
        self.subtitleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextAlignment(NSTextAlignmentCenter)
                .byUserInteractionEnabled(NO)
                .addOn(self);
        });
        self.imageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byContentMode(UIViewContentModeScaleAspectFit)
                .byUserInteractionEnabled(NO)
                .addOn(self);
        });
        self.eventDotView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byUserInteractionEnabled(NO)
                .byHidden(YES)
                .addOn(self);
        });
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
                 appearance:(JobsOCCalendarAppearance *)appearance
              monthPosition:(JobsOCCalendarMonthPosition)monthPosition
                    enabled:(BOOL)enabled
                   selected:(BOOL)selected
                      today:(BOOL)today
                eventsCount:(NSInteger)eventsCount{
    self.monthPosition = monthPosition;
    self.byEnabled(enabled)
        .bySelected(selected);
    self.titleLabel.byText(title);
    self.subtitleLabel.byText(subtitle);
    self.imageView.byImage(image);
    self.titleLabel.byFont(appearance.titleFont);
    self.subtitleLabel.byFont(appearance.subtitleFont);
    BOOL placeholder = monthPosition != JobsOCCalendarMonthPositionCurrent;
    self.selectionView.byHidden(!(selected || today));
    self.selectionView.byBgColor(selected ? appearance.selectionColor : appearance.todayColor);
    self.titleLabel.byTextCor(selected ? appearance.titleSelectionColor : (today ? appearance.titleTodayColor : (placeholder ? appearance.titlePlaceholderColor : appearance.titleDefaultColor)));
    self.subtitleLabel.byTextCor(selected ? appearance.subtitleSelectionColor : (placeholder ? appearance.subtitlePlaceholderColor : appearance.subtitleDefaultColor));
    self.eventDotView.byHidden(eventsCount <= 0);
    self.eventDotView.byBgColor(selected ? appearance.eventSelectionColor : appearance.eventDefaultColor);
    self.alpha = enabled ? 1 : .35f;
    [self setNeedsLayout];
}

@end
