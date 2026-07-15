//
//  FSCalendar+DSL.h
//  JobsOCDSL
//
//  Auto-generated from FSCalendar public headers on 2026年6月10日，星期三。
//

#ifndef JOBS_HEADER_GUARD_FSCALENDAR_DSL
#define JOBS_HEADER_GUARD_FSCALENDAR_DSL

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#if __has_include(<FSCalendar/FSCalendarDynamicHeader.h>)
#import <FSCalendar/FSCalendarDynamicHeader.h>
#elif __has_include(<FSCalendar/FSCalendar.h>)
#import <FSCalendar/FSCalendar.h>
#import <FSCalendar/FSCalendarCell.h>
#import <FSCalendar/FSCalendarHeaderView.h>
#import <FSCalendar/FSCalendarStickyHeader.h>
#import <FSCalendar/FSCalendarCollectionView.h>
#import <FSCalendar/FSCalendarCollectionViewLayout.h>
#import <FSCalendar/FSCalendarCalculator.h>
#import <FSCalendar/FSCalendarDelegationProxy.h>
#endif

#if __has_include(<FSCalendar/FSCalendarExtensions.h>)
#import <FSCalendar/FSCalendarExtensions.h>
#endif

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface FSCalendar (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarByFSCalendarAppearanceBlockBlock _Nonnull)byAppearanceBlock;
-(JobsRetFSCalendarByFSCalendarHeaderViewBlockBlock _Nonnull)byCalendarHeaderViewBlock;
-(JobsRetFSCalendarByFSCalendarSwipeToChooseGestureBlockBlock _Nonnull)bySwipeToChooseGestureBlock;
-(JobsRetFSCalendarByTimeZoneBlock _Nonnull)byTimeZone;
-(JobsRetFSCalendarByDelegateBlock _Nonnull)byDelegate;
-(JobsRetFSCalendarByDataSourceBlock _Nonnull)byDataSource;
-(JobsRetFSCalendarByTodayBlock _Nonnull)byToday;
-(JobsRetFSCalendarByCurrentPageBlock _Nonnull)byCurrentPage;
-(JobsRetFSCalendarByLocaleBlock _Nonnull)byLocale;
-(JobsRetFSCalendarByScrollDirectionBlock _Nonnull)byScrollDirection;
-(JobsRetFSCalendarByScopeBlock _Nonnull)byScope;
-(JobsRetFSCalendarByGetScopeGestureBlock _Nonnull)byGetScopeGesture;
-(JobsRetFSCalendarByGetSwipeToChooseGestureBlock _Nonnull)byGetSwipeToChooseGesture;
-(JobsRetFSCalendarByPlaceholderTypeBlock _Nonnull)byPlaceholderType;
-(JobsRetFSCalendarByFirstWeekdayBlock _Nonnull)byFirstWeekday;
-(JobsRetFSCalendarByHeaderHeightBlock _Nonnull)byHeaderHeight;
-(JobsRetFSCalendarByWeekdayHeightBlock _Nonnull)byWeekdayHeight;
-(JobsRetFSCalendarByCalendarWeekdayViewBlock _Nonnull)byCalendarWeekdayView;
-(JobsRetFSCalendarByCalendarHeaderViewBlock _Nonnull)byCalendarHeaderView;
-(JobsRetFSCalendarByBOOLBlock _Nonnull)byAllowsSelection;
-(JobsRetFSCalendarByBOOLBlock _Nonnull)byAllowsMultipleSelection;
-(JobsRetFSCalendarByBOOLBlock _Nonnull)byAdjustsBoundingRectWhenChangingMonths;
-(JobsRetFSCalendarByBOOLBlock _Nonnull)byPagingEnabled;
-(JobsRetFSCalendarByBOOLBlock _Nonnull)byScrollEnabled;
-(JobsRetFSCalendarByRowHeightBlock _Nonnull)byRowHeight;
-(JobsRetFSCalendarByGetAppearanceBlock _Nonnull)byGetAppearance;
-(JobsRetDateByVoidBlock _Nonnull)byGetMinimumDate;
-(JobsRetDateByVoidBlock _Nonnull)byGetMaximumDate;
-(JobsRetDateByVoidBlock _Nonnull)byGetSelectedDate;
-(JobsRetFSCalendarByGetSelectedDatesBlock _Nonnull)byGetSelectedDates;
-(JobsRetFSCalendarCollectionViewByVoidBlock _Nonnull)byGetCollectionView;
-(JobsRetFSCalendarLayoutByVoidBlock _Nonnull)byGetCollectionViewLayout;
-(JobsRetFSCalendarByGetTransitionCoordinatorBlock _Nonnull)byGetTransitionCoordinator;
-(JobsRetFSCalendarByGetCalculatorBlock _Nonnull)byGetCalculator;
-(JobsRetBOOLByVoidBlock _Nonnull)byGetFloatingMode;
-(JobsRetArrByVoidBlock _Nonnull)byGetVisibleStickyHeaders;
-(JobsRetCGFloatByVoidBlock _Nonnull)byGetPreferredHeaderHeight;
-(JobsRetCGFloatByVoidBlock _Nonnull)byGetPreferredWeekdayHeight;
-(JobsRetFSCalendarByGetGregorianBlock _Nonnull)byGetGregorian;
-(JobsRetDateFormatterByVoidBlock _Nonnull)byGetFormatter;
-(JobsRetViewByVoidBlock _Nonnull)byGetContentView;
-(JobsRetViewByVoidBlock _Nonnull)byGetDaysContainer;
-(JobsRetFSCalendarByBOOLBlock _Nonnull)byNeedsAdjustingViewFrame;
#pragma mark —— Methods
-(JobsRetFSCalendarByVoidBlock _Nonnull)byReloadData;
-(JobsRetFSCalendarByDateBlock _Nonnull)bySelectDate;
-(JobsRetFSCalendarByDateBlock _Nonnull)byDeselectDate;
-(JobsRetFSCalendarByDateForCellBlock _Nonnull)byDateForCell;
-(JobsRetFSCalendarByMonthPositionForCellBlock _Nonnull)byMonthPositionForCell;
-(JobsRetFSCalendarByVisibleCellsBlock _Nonnull)byVisibleCells;
-(JobsRetFSCalendarByFrameForDateBlock _Nonnull)byFrameForDate;
-(JobsRetFSCalendarByPanGestureRecognizerBlock _Nonnull)byHandleScopeGesture;
-(JobsRetFSCalendarByVoidBlock _Nonnull)byAdjustMonthPosition;
-(JobsRetFSCalendarByVoidBlock _Nonnull)byConfigureAppearance;
@end

@interface FSCalendarAppearance (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarAppearanceByTitleFontBlock _Nonnull)byTitleFont;
-(JobsRetFSCalendarAppearanceBySubtitleFontBlock _Nonnull)bySubtitleFont;
-(JobsRetFSCalendarAppearanceByWeekdayFontBlock _Nonnull)byWeekdayFont;
-(JobsRetFSCalendarAppearanceByHeaderTitleFontBlock _Nonnull)byHeaderTitleFont;
-(JobsRetFSCalendarAppearanceByHeaderTitleOffsetBlock _Nonnull)byHeaderTitleOffset;
-(JobsRetFSCalendarAppearanceByTitleOffsetBlock _Nonnull)byTitleOffset;
-(JobsRetFSCalendarAppearanceBySubtitleOffsetBlock _Nonnull)bySubtitleOffset;
-(JobsRetFSCalendarAppearanceByEventOffsetBlock _Nonnull)byEventOffset;
-(JobsRetFSCalendarAppearanceByImageOffsetBlock _Nonnull)byImageOffset;
-(JobsRetFSCalendarAppearanceByEventDefaultColorBlock _Nonnull)byEventDefaultColor;
-(JobsRetFSCalendarAppearanceByEventSelectionColorBlock _Nonnull)byEventSelectionColor;
-(JobsRetFSCalendarAppearanceByWeekdayTextColorBlock _Nonnull)byWeekdayTextColor;
-(JobsRetFSCalendarAppearanceByHeaderTitleColorBlock _Nonnull)byHeaderTitleColor;
-(JobsRetFSCalendarAppearanceByHeaderSeparatorColorBlock _Nonnull)byHeaderSeparatorColor;
-(JobsRetFSCalendarAppearanceByHeaderDateFormatBlock _Nonnull)byHeaderDateFormat;
-(JobsRetFSCalendarAppearanceByHeaderTitleAlignmentBlock _Nonnull)byHeaderTitleAlignment;
-(JobsRetFSCalendarAppearanceByHeaderMinimumDissolvedAlphaBlock _Nonnull)byHeaderMinimumDissolvedAlpha;
-(JobsRetFSCalendarAppearanceByTitleDefaultColorBlock _Nonnull)byTitleDefaultColor;
-(JobsRetFSCalendarAppearanceByTitleSelectionColorBlock _Nonnull)byTitleSelectionColor;
-(JobsRetFSCalendarAppearanceByTitleTodayColorBlock _Nonnull)byTitleTodayColor;
-(JobsRetFSCalendarAppearanceByTitlePlaceholderColorBlock _Nonnull)byTitlePlaceholderColor;
-(JobsRetFSCalendarAppearanceByTitleWeekendColorBlock _Nonnull)byTitleWeekendColor;
-(JobsRetFSCalendarAppearanceBySubtitleDefaultColorBlock _Nonnull)bySubtitleDefaultColor;
-(JobsRetFSCalendarAppearanceBySubtitleSelectionColorBlock _Nonnull)bySubtitleSelectionColor;
-(JobsRetFSCalendarAppearanceBySubtitleTodayColorBlock _Nonnull)bySubtitleTodayColor;
-(JobsRetFSCalendarAppearanceBySubtitlePlaceholderColorBlock _Nonnull)bySubtitlePlaceholderColor;
-(JobsRetFSCalendarAppearanceBySubtitleWeekendColorBlock _Nonnull)bySubtitleWeekendColor;
-(JobsRetFSCalendarAppearanceBySelectionColorBlock _Nonnull)bySelectionColor;
-(JobsRetFSCalendarAppearanceByTodayColorBlock _Nonnull)byTodayColor;
-(JobsRetFSCalendarAppearanceByTodaySelectionColorBlock _Nonnull)byTodaySelectionColor;
-(JobsRetFSCalendarAppearanceByBorderDefaultColorBlock _Nonnull)byBorderDefaultColor;
-(JobsRetFSCalendarAppearanceByBorderSelectionColorBlock _Nonnull)byBorderSelectionColor;
-(JobsRetFSCalendarAppearanceByBorderRadiusBlock _Nonnull)byBorderRadius;
-(JobsRetFSCalendarAppearanceByCaseOptionsBlock _Nonnull)byCaseOptions;
-(JobsRetFSCalendarAppearanceBySeparatorsBlock _Nonnull)bySeparators;
-(JobsRetFSCalendarAppearanceByCalendarBlock _Nonnull)byCalendar;
-(JobsRetDicByVoidBlock _Nonnull)byGetBackgroundColors;
-(JobsRetDicByVoidBlock _Nonnull)byGetTitleColors;
-(JobsRetDicByVoidBlock _Nonnull)byGetSubtitleColors;
-(JobsRetDicByVoidBlock _Nonnull)byGetBorderColors;
@end

@interface FSCalendarCell (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarCellByTitleLabelBlock _Nonnull)byTitleLabel;
-(JobsRetFSCalendarCellBySubtitleLabelBlock _Nonnull)bySubtitleLabel;
-(JobsRetFSCalendarCellByShapeLayerBlock _Nonnull)byShapeLayer;
-(JobsRetFSCalendarCellByImageViewBlock _Nonnull)byImageView;
-(JobsRetFSCalendarCellByEventIndicatorBlock _Nonnull)byEventIndicator;
-(JobsRetFSCalendarCellByPlaceholderBlock _Nonnull)byPlaceholder;
-(JobsRetFSCalendarCellByCalendarBlock _Nonnull)byCalendar;
-(JobsRetFSCalendarCellByAppearanceBlock _Nonnull)byAppearance;
-(JobsRetFSCalendarCellBySubtitleBlock _Nonnull)bySubtitle;
-(JobsRetFSCalendarCellByImageBlock _Nonnull)byImage;
-(JobsRetFSCalendarCellByMonthPositionBlock _Nonnull)byMonthPosition;
-(JobsRetFSCalendarCellByNumberOfEventsBlock _Nonnull)byNumberOfEvents;
-(JobsRetFSCalendarCellByDateIsTodayBlock _Nonnull)byDateIsToday;
-(JobsRetFSCalendarCellByWeekendBlock _Nonnull)byWeekend;
-(JobsRetFSCalendarCellByPreferredFillDefaultColorBlock _Nonnull)byPreferredFillDefaultColor;
-(JobsRetFSCalendarCellByPreferredFillSelectionColorBlock _Nonnull)byPreferredFillSelectionColor;
-(JobsRetFSCalendarCellByPreferredTitleDefaultColorBlock _Nonnull)byPreferredTitleDefaultColor;
-(JobsRetFSCalendarCellByPreferredTitleSelectionColorBlock _Nonnull)byPreferredTitleSelectionColor;
-(JobsRetFSCalendarCellByPreferredSubtitleDefaultColorBlock _Nonnull)byPreferredSubtitleDefaultColor;
-(JobsRetFSCalendarCellByPreferredSubtitleSelectionColorBlock _Nonnull)byPreferredSubtitleSelectionColor;
-(JobsRetFSCalendarCellByPreferredBorderDefaultColorBlock _Nonnull)byPreferredBorderDefaultColor;
-(JobsRetFSCalendarCellByPreferredBorderSelectionColorBlock _Nonnull)byPreferredBorderSelectionColor;
-(JobsRetFSCalendarCellByPreferredTitleOffsetBlock _Nonnull)byPreferredTitleOffset;
-(JobsRetFSCalendarCellByPreferredSubtitleOffsetBlock _Nonnull)byPreferredSubtitleOffset;
-(JobsRetFSCalendarCellByPreferredImageOffsetBlock _Nonnull)byPreferredImageOffset;
-(JobsRetFSCalendarCellByPreferredEventOffsetBlock _Nonnull)byPreferredEventOffset;
-(JobsRetFSCalendarCellByPreferredEventDefaultColorsBlock _Nonnull)byPreferredEventDefaultColors;
-(JobsRetFSCalendarCellByPreferredEventSelectionColorsBlock _Nonnull)byPreferredEventSelectionColors;
-(JobsRetFSCalendarCellByPreferredBorderRadiusBlock _Nonnull)byPreferredBorderRadius;
#pragma mark —— Methods
-(JobsRetFSCalendarCellByLayoutSubviewsBlock _Nonnull)byLayoutSubviews;
-(JobsRetFSCalendarCellByConfigureAppearanceBlock _Nonnull)byConfigureAppearance;
-(JobsRetFSCalendarCellByColorForCurrentStateInDictionaryBlock _Nonnull)byColorForCurrentStateInDictionary;
-(JobsRetFSCalendarCellByPerformSelectingBlock _Nonnull)byPerformSelecting;
@end

@interface FSCalendarEventIndicator (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarEventIndicatorByNumberOfEventsBlock _Nonnull)byNumberOfEvents;
-(JobsRetFSCalendarEventIndicatorByColorBlock _Nonnull)byColor;
@end

@interface FSCalendarBlankCell (JobsFSCalendarDSL)
#pragma mark —— Methods
-(JobsRetFSCalendarBlankCellByConfigureAppearanceBlock _Nonnull)byConfigureAppearance;
@end

@interface FSCalendarCollectionView (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarCollectionViewByInternalDelegateBlock _Nonnull)byInternalDelegate;
@end

@interface FSCalendarCollectionViewLayout (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarCollectionViewLayoutByCalendarBlock _Nonnull)byCalendar;
-(JobsRetFSCalendarCollectionViewLayoutBySectionInsetsBlock _Nonnull)bySectionInsets;
-(JobsRetFSCalendarCollectionViewLayoutByScrollDirectionBlock _Nonnull)byScrollDirection;
-(JobsRetFSCalendarCollectionViewLayoutByGetEstimatedItemSizeBlock _Nonnull)byGetEstimatedItemSize;
@end

@interface FSCalendarCalculator (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarCalculatorByCalendarBlock _Nonnull)byCalendar;
-(JobsRetNSIntegerByVoidBlock _Nonnull)byGetNumberOfSections;
#pragma mark —— Methods
-(JobsRetDateByDateBlock _Nonnull)bySafeDateForDate;
-(JobsRetDateByIndexPathBlock _Nonnull)byDateForIndexPath;
-(JobsRetFSCalendarCalculatorByIndexPathForDateBlock _Nonnull)byIndexPathForDate;
-(JobsRetDateByNSIntegerBlock _Nonnull)byPageForSection;
-(JobsRetDateByNSIntegerBlock _Nonnull)byWeekForSection;
-(JobsRetDateByNSIntegerBlock _Nonnull)byMonthForSection;
-(JobsRetDateByNSIntegerBlock _Nonnull)byMonthHeadForSection;
-(JobsRetIntegerByDateBlock _Nonnull)byNumberOfHeadPlaceholdersForMonth;
-(JobsRetIntegerByDateBlock _Nonnull)byNumberOfRowsInMonth;
-(JobsRetByNSIntegerBlock _Nonnull)byNumberOfRowsInSection;
-(JobsRetFSCalendarCalculatorByMonthPositionForIndexPathBlock _Nonnull)byMonthPositionForIndexPath;
-(JobsRetFSCalendarCalculatorByCoordinateForIndexPathBlock _Nonnull)byCoordinateForIndexPath;
-(JobsRetFSCalendarCalculatorByReloadSectionsBlock _Nonnull)byReloadSections;
@end

@interface FSCalendarDelegationProxy (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarDelegationProxyByDelegationBlock _Nonnull)byDelegation;
-(JobsRetFSCalendarDelegationProxyByProtocolBlock _Nonnull)byProtocol;
-(JobsRetFSCalendarDelegationProxyByDeprecationsBlock _Nonnull)byDeprecations;
#pragma mark —— Methods
-(JobsRetFSCalendarDelegationProxyByDeprecatedSelectorOfSelectorBlock _Nonnull)byDeprecatedSelectorOfSelector;
@end

@interface UIView (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetViewByCGFloatBlock _Nonnull)byFs_width;
-(JobsRetViewByCGFloatBlock _Nonnull)byFs_height;
-(JobsRetViewByCGFloatBlock _Nonnull)byFs_top;
-(JobsRetViewByCGFloatBlock _Nonnull)byFs_left;
-(JobsRetViewByCGFloatBlock _Nonnull)byFs_bottom;
-(JobsRetViewByCGFloatBlock _Nonnull)byFs_right;
@end

@interface CALayer (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetCALayerByCGFloatBlock _Nonnull)byFs_width;
-(JobsRetCALayerByCGFloatBlock _Nonnull)byFs_height;
-(JobsRetCALayerByCGFloatBlock _Nonnull)byFs_top;
-(JobsRetCALayerByCGFloatBlock _Nonnull)byFs_left;
-(JobsRetCALayerByCGFloatBlock _Nonnull)byFs_bottom;
-(JobsRetCALayerByCGFloatBlock _Nonnull)byFs_right;
@end

@interface NSCalendar (JobsFSCalendarDSL)
#pragma mark —— Methods
-(JobsRetCalendarByNSUIntegerBlock _Nonnull)byMinimumDaysInFirstWeek;
-(JobsRetDateByDateBlock _Nonnull)byFs_firstDayOfMonth;
-(JobsRetDateByDateBlock _Nonnull)byFs_lastDayOfMonth;
-(JobsRetDateByDateBlock _Nonnull)byFs_firstDayOfWeek;
-(JobsRetDateByDateBlock _Nonnull)byFs_lastDayOfWeek;
-(JobsRetDateByDateBlock _Nonnull)byFs_middleDayOfWeek;
-(JobsRetIntegerByDateBlock _Nonnull)byFs_numberOfDaysInMonth;
@end

@interface NSMapTable (JobsFSCalendarDSL)
#pragma mark —— Methods
-(JobsRetNSMapTableByObjectForKeyedSubscriptBlock _Nonnull)byObjectForKeyedSubscript;
-(JobsRetNSMapTableByIDBlock _Nonnull)byRemoveObjectForKey;
-(JobsRetNSMapTableByVoidBlock _Nonnull)byRemoveAllObjects;
@end

@interface NSCache (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetNSCacheByNSUIntegerBlock _Nonnull)byTotalCostLimit;
-(JobsRetNSCacheByNSUIntegerBlock _Nonnull)byCountLimit;
-(JobsRetNSCacheByBOOLBlock _Nonnull)byEvictsObjectsWithDiscardedContent;
#pragma mark —— Methods
-(JobsRetNSCacheByObjectForKeyedSubscriptBlock _Nonnull)byObjectForKeyedSubscript;
-(JobsRetNSCacheByIDBlock _Nonnull)byRemoveObjectForKey;
-(JobsRetNSCacheByVoidBlock _Nonnull)byRemoveAllObjects;
@end

@interface NSObject (JobsFSCalendarDSL)
#pragma mark —— Methods
-(JobsRetIDByStrBlock _Nonnull)byFs_variableForKey;
@end

@interface FSCalendarHeaderView (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarHeaderViewByCollectionViewBlock _Nonnull)byCollectionView;
-(JobsRetFSCalendarHeaderViewByCollectionViewLayoutBlock _Nonnull)byCollectionViewLayout;
-(JobsRetFSCalendarHeaderViewByCalendarBlock _Nonnull)byCalendar;
-(JobsRetFSCalendarHeaderViewByScrollDirectionBlock _Nonnull)byScrollDirection;
-(JobsRetFSCalendarHeaderViewByScrollEnabledBlock _Nonnull)byScrollEnabled;
#pragma mark —— Methods
-(JobsRetFSCalendarHeaderViewBySetScrollOffsetBlock _Nonnull)bySetScrollOffset;
-(JobsRetFSCalendarHeaderViewByVoidBlock _Nonnull)byReloadData;
-(JobsRetFSCalendarHeaderViewByVoidBlock _Nonnull)byConfigureAppearance;
@end

@interface FSCalendarHeaderCell (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarHeaderCellByTitleLabelBlock _Nonnull)byTitleLabel;
-(JobsRetFSCalendarHeaderCellByHeaderBlock _Nonnull)byHeader;
@end

@interface FSCalendarHeaderTouchDeliver (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarHeaderTouchDeliverByCalendarBlock _Nonnull)byCalendar;
-(JobsRetFSCalendarHeaderTouchDeliverByHeaderBlock _Nonnull)byHeader;
@end

@interface FSCalendarStickyHeader (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarStickyHeaderByCalendarBlock _Nonnull)byCalendar;
-(JobsRetFSCalendarStickyHeaderByTitleLabelBlock _Nonnull)byTitleLabel;
-(JobsRetFSCalendarStickyHeaderByMonthBlock _Nonnull)byMonth;
#pragma mark —— Methods
-(JobsRetFSCalendarStickyHeaderByConfigureAppearanceBlock _Nonnull)byConfigureAppearance;
@end

@interface FSCalendarTransitionCoordinator (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarTransitionCoordinatorByStateBlock _Nonnull)byState;
-(JobsRetFSCalendarTransitionCoordinatorByCachedMonthSizeBlock _Nonnull)byCachedMonthSize;
-(JobsRetNSIntegerByVoidBlock _Nonnull)byGetRepresentingScope;
#pragma mark —— Methods
-(JobsRetFSCalendarTransitionCoordinatorByHandleScopeGestureBlock _Nonnull)byHandleScopeGesture;
@end

@interface FSCalendarTransitionAttributes (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarTransitionAttributesBySourceBoundsBlock _Nonnull)bySourceBounds;
-(JobsRetFSCalendarTransitionAttributesByTargetBoundsBlock _Nonnull)byTargetBounds;
-(JobsRetFSCalendarTransitionAttributesBySourcePageBlock _Nonnull)bySourcePage;
-(JobsRetFSCalendarTransitionAttributesByTargetPageBlock _Nonnull)byTargetPage;
-(JobsRetFSCalendarTransitionAttributesByFocusedRowBlock _Nonnull)byFocusedRow;
-(JobsRetFSCalendarTransitionAttributesByFocusedDateBlock _Nonnull)byFocusedDate;
-(JobsRetFSCalendarTransitionAttributesByTargetScopeBlock _Nonnull)byTargetScope;
#pragma mark —— Methods
-(JobsRetFSCalendarTransitionAttributesByRevertBlock _Nonnull)byRevert;
@end

@interface FSCalendarWeekdayView (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarWeekdayViewByGetWeekdayLabelsBlock _Nonnull)byGetWeekdayLabels;
-(JobsRetFSCalendarWeekdayViewByCalendarBlock _Nonnull)byCalendar;
#pragma mark —— Methods
-(JobsRetFSCalendarWeekdayViewByConfigureAppearanceBlock _Nonnull)byConfigureAppearance;
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_FSCALENDAR_DSL */
