//
//  FSCalendarStickyHeader.h
//  FSCalendar
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_FSCALENDAR_CORE_FSCALENDARSTICKYHEADER_FSCALENDARSTICKYHEADER_H
#define JOBS_FSCALENDAR_CORE_FSCALENDARSTICKYHEADER_FSCALENDARSTICKYHEADER_H

#pragma once

#import <UIKit/UIKit.h>

@class FSCalendar,FSCalendarAppearance;

@interface FSCalendarStickyHeader : UICollectionReusableView

@property (weak, nonatomic) FSCalendar *calendar;

@property (weak, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) NSDate *month;

- (void)configureAppearance;

@end

#endif /* JOBS_FSCALENDAR_CORE_FSCALENDARSTICKYHEADER_FSCALENDARSTICKYHEADER_H */
