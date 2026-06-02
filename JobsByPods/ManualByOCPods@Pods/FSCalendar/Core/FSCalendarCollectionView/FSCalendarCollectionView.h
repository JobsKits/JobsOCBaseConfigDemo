//
//  FSCalendarCollectionView.h
//  FSCalendar
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_FSCALENDAR_CORE_FSCALENDARCOLLECTIONVIEW_FSCALENDARCOLLECTIONVIEW_H
#define JOBS_FSCALENDAR_CORE_FSCALENDARCOLLECTIONVIEW_FSCALENDARCOLLECTIONVIEW_H

#pragma once

#import <UIKit/UIKit.h>
@class FSCalendarCollectionView;

@protocol FSCalendarCollectionViewInternalDelegate <UICollectionViewDelegate>

@optional
- (void)collectionViewDidFinishLayoutSubviews:(FSCalendarCollectionView *)collectionView;

@end

@interface FSCalendarCollectionView : UICollectionView

@property (weak, nonatomic) id<FSCalendarCollectionViewInternalDelegate> internalDelegate;

@end

#endif /* JOBS_FSCALENDAR_CORE_FSCALENDARCOLLECTIONVIEW_FSCALENDARCOLLECTIONVIEW_H */
