//
//  FSCalendarTransitionCoordinator.h
//  FSCalendar
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_FSCALENDAR_CORE_FSCALENDARTRANSITIONCOORDINATOR_FSCALENDARTRANSITIONCOORDINATOR_H
#define JOBS_FSCALENDAR_CORE_FSCALENDARTRANSITIONCOORDINATOR_FSCALENDARTRANSITIONCOORDINATOR_H

#pragma once

#import <UIKit/UIKit.h>
#import <FSCalendar/FSCalendar.h>
#import <FSCalendar/FSCalendarCollectionView.h>
#import <FSCalendar/FSCalendarCollectionViewLayout.h>

typedef NS_ENUM(NSUInteger, FSCalendarTransitionState) {
    FSCalendarTransitionStateIdle,
    FSCalendarTransitionStateChanging,
    FSCalendarTransitionStateFinishing,
};

@interface FSCalendarTransitionCoordinator : NSObject <UIGestureRecognizerDelegate>

@property (assign, nonatomic) FSCalendarTransitionState state;

@property (assign, nonatomic) CGSize cachedMonthSize;

@property (readonly, nonatomic) FSCalendarScope representingScope;

- (instancetype)initWithCalendar:(FSCalendar *)calendar;

- (void)performScopeTransitionFromScope:(FSCalendarScope)fromScope toScope:(FSCalendarScope)toScope animated:(BOOL)animated;
- (void)performBoundingRectTransitionFromMonth:(NSDate *)fromMonth toMonth:(NSDate *)toMonth duration:(CGFloat)duration;
- (CGRect)boundingRectForScope:(FSCalendarScope)scope page:(NSDate *)page;

- (void)handleScopeGesture:(id)sender;

@end

@interface FSCalendarTransitionAttributes : NSObject

@property (assign, nonatomic) CGRect sourceBounds;
@property (assign, nonatomic) CGRect targetBounds;
@property (strong, nonatomic) NSDate *sourcePage;
@property (strong, nonatomic) NSDate *targetPage;
@property (assign, nonatomic) NSInteger focusedRow;
@property (strong, nonatomic) NSDate *focusedDate;
@property (assign, nonatomic) FSCalendarScope targetScope;

- (void)revert;
    
@end

#endif /* JOBS_FSCALENDAR_CORE_FSCALENDARTRANSITIONCOORDINATOR_FSCALENDARTRANSITIONCOORDINATOR_H */
