//
//  FSCalendarDynamicHeader.h
//  FSCalendar
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_FSCALENDAR_FSCALENDARDYNAMICHEADER_H
#define JOBS_FSCALENDAR_FSCALENDARDYNAMICHEADER_H

#pragma once

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <FSCalendar/FSCalendar.h>
#import <FSCalendar/FSCalendarCell.h>
#import <FSCalendar/FSCalendarHeaderView.h>
#import <FSCalendar/FSCalendarStickyHeader.h>
#import <FSCalendar/FSCalendarCollectionView.h>
#import <FSCalendar/FSCalendarCollectionViewLayout.h>
#import <FSCalendar/FSCalendarCalculator.h>
#import <FSCalendar/FSCalendarTransitionCoordinator.h>
#import <FSCalendar/FSCalendarDelegationProxy.h>

@interface FSCalendar (Dynamic)

@property (readonly, nonatomic) FSCalendarCollectionView *collectionView;
@property (readonly, nonatomic) FSCalendarCollectionViewLayout *collectionViewLayout;
@property (readonly, nonatomic) FSCalendarTransitionCoordinator *transitionCoordinator;
@property (readonly, nonatomic) FSCalendarCalculator *calculator;
@property (readonly, nonatomic) BOOL floatingMode;
@property (readonly, nonatomic) NSArray *visibleStickyHeaders;
@property (readonly, nonatomic) CGFloat preferredHeaderHeight;
@property (readonly, nonatomic) CGFloat preferredWeekdayHeight;

@property (readonly, nonatomic) NSCalendar *gregorian;
@property (readonly, nonatomic) NSDateFormatter *formatter;

@property (readonly, nonatomic) UIView *contentView;
@property (readonly, nonatomic) UIView *daysContainer;

@property (assign, nonatomic) BOOL needsAdjustingViewFrame;

- (void)adjustMonthPosition;
- (void)configureAppearance;

- (CGSize)sizeThatFits:(CGSize)size scope:(FSCalendarScope)scope;

@end

@interface FSCalendarAppearance (Dynamic)

@property (readwrite, nonatomic) FSCalendar *calendar;

@property (readonly, nonatomic) NSDictionary *backgroundColors;
@property (readonly, nonatomic) NSDictionary *titleColors;
@property (readonly, nonatomic) NSDictionary *subtitleColors;
@property (readonly, nonatomic) NSDictionary *borderColors;

@end

@interface FSCalendarWeekdayView (Dynamic)

@property (readwrite, nonatomic) FSCalendar *calendar;

@end

@interface FSCalendarCollectionViewLayout (Dynamic)

@property (readonly, nonatomic) CGSize estimatedItemSize;

@end

@interface FSCalendarDelegationProxy()<FSCalendarDataSource,FSCalendarDelegate,FSCalendarDelegateAppearance>
@end

#endif /* JOBS_FSCALENDAR_FSCALENDARDYNAMICHEADER_H */
