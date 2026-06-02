//
//  FSCalendarCollectionViewLayout.h
//  FSCalendar
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_FSCALENDAR_CORE_FSCALENDARCOLLECTIONVIEWLAYOUT_FSCALENDARCOLLECTIONVIEWLAYOUT_H
#define JOBS_FSCALENDAR_CORE_FSCALENDARCOLLECTIONVIEWLAYOUT_FSCALENDARCOLLECTIONVIEWLAYOUT_H

#pragma once

#import <UIKit/UIKit.h>

@class FSCalendar;

@interface FSCalendarCollectionViewLayout : UICollectionViewLayout

@property (weak, nonatomic) FSCalendar *calendar;

@property (assign, nonatomic) UIEdgeInsets sectionInsets;
@property (assign, nonatomic) UICollectionViewScrollDirection scrollDirection;

@end

#endif /* JOBS_FSCALENDAR_CORE_FSCALENDARCOLLECTIONVIEWLAYOUT_FSCALENDARCOLLECTIONVIEWLAYOUT_H */
