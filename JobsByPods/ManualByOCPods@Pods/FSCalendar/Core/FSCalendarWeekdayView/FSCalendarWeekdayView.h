//
//  FSCalendarWeekdayView.h
//  FSCalendar
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_FSCALENDAR_CORE_FSCALENDARWEEKDAYVIEW_FSCALENDARWEEKDAYVIEW_H
#define JOBS_FSCALENDAR_CORE_FSCALENDARWEEKDAYVIEW_FSCALENDARWEEKDAYVIEW_H

#pragma once

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class FSCalendar;

@interface FSCalendarWeekdayView : UIView

/**
 An array of UILabel objects displaying the weekday symbols.
 */
@property (readonly, nonatomic) NSArray<UILabel *> *weekdayLabels;

- (void)configureAppearance;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_FSCALENDAR_CORE_FSCALENDARWEEKDAYVIEW_FSCALENDARWEEKDAYVIEW_H */
