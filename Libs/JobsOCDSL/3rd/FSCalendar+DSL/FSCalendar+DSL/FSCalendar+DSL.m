//
//  FSCalendar+DSL.m
//  JobsOCDSL
//
//  Auto-generated from FSCalendar public headers on 2026年6月10日，星期三。
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "FSCalendar+DSL.h"

@implementation FSCalendar (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarByFSCalendarAppearanceBlockBlock _Nonnull)byAppearanceBlock{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(jobsByFSCalendarAppearanceBlock _Nullable data){
        @jobs_strongify(self)
        if (data) data(self.appearance);
        return self;
    };
}

-(JobsRetFSCalendarByFSCalendarHeaderViewBlockBlock _Nonnull)byCalendarHeaderViewBlock{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(jobsByFSCalendarHeaderViewBlock _Nullable data){
        @jobs_strongify(self)
        if (data) data(self.calendarHeaderView);
        return self;
    };
}

-(JobsRetFSCalendarByFSCalendarSwipeToChooseGestureBlockBlock _Nonnull)bySwipeToChooseGestureBlock{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(jobsByFSCalendarSwipeToChooseGestureBlock _Nullable data){
        @jobs_strongify(self)
        if (data) data(self.swipeToChooseGesture);
        return self;
    };
}

-(JobsRetFSCalendarByTimeZoneBlock _Nonnull)byTimeZone{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(NSTimeZone * _Nullable data){
        @jobs_strongify(self)
        if ([self respondsToSelector:NSSelectorFromString(@"setTimeZone:")]) {
            [self setValue:data forKey:@"timeZone"];
        };return self;
    };
}

-(JobsRetFSCalendarByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(id<FSCalendarDelegate> _Nullable data){
        @jobs_strongify(self)
        self.delegate = data;
        return self;
    };
}

-(JobsRetFSCalendarByDataSourceBlock _Nonnull)byDataSource{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(id<FSCalendarDataSource> _Nullable data){
        @jobs_strongify(self)
        self.dataSource = data;
        return self;
    };
}

-(JobsRetFSCalendarByTodayBlock _Nonnull)byToday{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        self.today = data;
        return self;
    };
}

-(JobsRetFSCalendarByCurrentPageBlock _Nonnull)byCurrentPage{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        self.currentPage = data;
        return self;
    };
}

-(JobsRetFSCalendarByLocaleBlock _Nonnull)byLocale{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(NSLocale * _Nullable data){
        @jobs_strongify(self)
        self.locale = data;
        return self;
    };
}

-(JobsRetFSCalendarByScrollDirectionBlock _Nonnull)byScrollDirection{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.scrollDirection = data;
        return self;
    };
}

-(JobsRetFSCalendarByScopeBlock _Nonnull)byScope{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.scope = data;
        return self;
    };
}

-(JobsRetFSCalendarByGetScopeGestureBlock _Nonnull)byGetScopeGesture{
    @jobs_weakify(self)
    return ^UIPanGestureRecognizer * _Nullable(void){
        @jobs_strongify(self)
        return self.scopeGesture;
    };
}

-(JobsRetFSCalendarByGetSwipeToChooseGestureBlock _Nonnull)byGetSwipeToChooseGesture{
    @jobs_weakify(self)
    return ^UILongPressGestureRecognizer * _Nullable(void){
        @jobs_strongify(self)
        return self.swipeToChooseGesture;
    };
}

-(JobsRetFSCalendarByPlaceholderTypeBlock _Nonnull)byPlaceholderType{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.placeholderType = data;
        return self;
    };
}

-(JobsRetFSCalendarByFirstWeekdayBlock _Nonnull)byFirstWeekday{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.firstWeekday = data;
        return self;
    };
}

-(JobsRetFSCalendarByHeaderHeightBlock _Nonnull)byHeaderHeight{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.headerHeight = data;
        return self;
    };
}

-(JobsRetFSCalendarByWeekdayHeightBlock _Nonnull)byWeekdayHeight{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.weekdayHeight = data;
        return self;
    };
}

-(JobsRetFSCalendarByCalendarWeekdayViewBlock _Nonnull)byCalendarWeekdayView{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(FSCalendarWeekdayView * _Nullable data){
        @jobs_strongify(self)
        self.calendarWeekdayView = data;
        return self;
    };
}

-(JobsRetFSCalendarByCalendarHeaderViewBlock _Nonnull)byCalendarHeaderView{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(FSCalendarHeaderView * _Nullable data){
        @jobs_strongify(self)
        self.calendarHeaderView = data;
        return self;
    };
}

-(JobsRetFSCalendarByBOOLBlock _Nonnull)byAllowsSelection{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(BOOL data){
        @jobs_strongify(self)
        self.allowsSelection = data;
        return self;
    };
}

-(JobsRetFSCalendarByBOOLBlock _Nonnull)byAllowsMultipleSelection{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(BOOL data){
        @jobs_strongify(self)
        self.allowsMultipleSelection = data;
        return self;
    };
}

-(JobsRetFSCalendarByBOOLBlock _Nonnull)byAdjustsBoundingRectWhenChangingMonths{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(BOOL data){
        @jobs_strongify(self)
        self.adjustsBoundingRectWhenChangingMonths = data;
        return self;
    };
}

-(JobsRetFSCalendarByBOOLBlock _Nonnull)byPagingEnabled{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(BOOL data){
        @jobs_strongify(self)
        self.pagingEnabled = data;
        return self;
    };
}

-(JobsRetFSCalendarByBOOLBlock _Nonnull)byScrollEnabled{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(BOOL data){
        @jobs_strongify(self)
        self.scrollEnabled = data;
        return self;
    };
}

-(JobsRetFSCalendarByRowHeightBlock _Nonnull)byRowHeight{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.rowHeight = data;
        return self;
    };
}

-(JobsRetFSCalendarByGetAppearanceBlock _Nonnull)byGetAppearance{
    @jobs_weakify(self)
    return ^FSCalendarAppearance * _Nullable(void){
        @jobs_strongify(self)
        return self.appearance;
    };
}

-(JobsRetDateByVoidBlock _Nonnull)byGetMinimumDate{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(void){
        @jobs_strongify(self)
        return self.minimumDate;
    };
}

-(JobsRetDateByVoidBlock _Nonnull)byGetMaximumDate{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(void){
        @jobs_strongify(self)
        return self.maximumDate;
    };
}

-(JobsRetDateByVoidBlock _Nonnull)byGetSelectedDate{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(void){
        @jobs_strongify(self)
        return self.selectedDate;
    };
}

-(JobsRetFSCalendarByGetSelectedDatesBlock _Nonnull)byGetSelectedDates{
    @jobs_weakify(self)
    return ^NSArray<NSDate *> * _Nullable(void){
        @jobs_strongify(self)
        return self.selectedDates;
    };
}

-(JobsRetFSCalendarCollectionViewByVoidBlock _Nonnull)byGetCollectionView{
    @jobs_weakify(self)
    return ^FSCalendarCollectionView * _Nullable(void){
        @jobs_strongify(self)
        return self.collectionView;
    };
}

-(JobsRetFSCalendarLayoutByVoidBlock _Nonnull)byGetCollectionViewLayout{
    @jobs_weakify(self)
    return ^FSCalendarCollectionViewLayout * _Nullable(void){
        @jobs_strongify(self)
        return self.collectionViewLayout;
    };
}

-(JobsRetFSCalendarByGetTransitionCoordinatorBlock _Nonnull)byGetTransitionCoordinator{
    @jobs_weakify(self)
    return ^FSCalendarTransitionCoordinator * _Nullable(void){
        @jobs_strongify(self)
        return self.transitionCoordinator;
    };
}

-(JobsRetFSCalendarByGetCalculatorBlock _Nonnull)byGetCalculator{
    @jobs_weakify(self)
    return ^FSCalendarCalculator * _Nullable(void){
        @jobs_strongify(self)
        return self.calculator;
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)byGetFloatingMode{
    @jobs_weakify(self)
    return ^BOOL(void){
        @jobs_strongify(self)
        return self.floatingMode;
    };
}

-(JobsRetArrByVoidBlock _Nonnull)byGetVisibleStickyHeaders{
    @jobs_weakify(self)
    return ^NSArray * _Nullable(void){
        @jobs_strongify(self)
        return self.visibleStickyHeaders;
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)byGetPreferredHeaderHeight{
    @jobs_weakify(self)
    return ^CGFloat(void){
        @jobs_strongify(self)
        return self.preferredHeaderHeight;
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)byGetPreferredWeekdayHeight{
    @jobs_weakify(self)
    return ^CGFloat(void){
        @jobs_strongify(self)
        return self.preferredWeekdayHeight;
    };
}

-(JobsRetFSCalendarByGetGregorianBlock _Nonnull)byGetGregorian{
    @jobs_weakify(self)
    return ^NSCalendar * _Nullable(void){
        @jobs_strongify(self)
        return self.gregorian;
    };
}

-(JobsRetDateFormatterByVoidBlock _Nonnull)byGetFormatter{
    @jobs_weakify(self)
    return ^NSDateFormatter * _Nullable(void){
        @jobs_strongify(self)
        return self.formatter;
    };
}

-(JobsRetViewByVoidBlock _Nonnull)byGetContentView{
    @jobs_weakify(self)
    return ^UIView * _Nullable(void){
        @jobs_strongify(self)
        return self.contentView;
    };
}

-(JobsRetViewByVoidBlock _Nonnull)byGetDaysContainer{
    @jobs_weakify(self)
    return ^UIView * _Nullable(void){
        @jobs_strongify(self)
        return self.daysContainer;
    };
}

-(JobsRetFSCalendarByBOOLBlock _Nonnull)byNeedsAdjustingViewFrame{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(BOOL data){
        @jobs_strongify(self)
        self.needsAdjustingViewFrame = data;
        return self;
    };
}

#pragma mark —— Methods
-(JobsRetFSCalendarByVoidBlock _Nonnull)byReloadData{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(void){
        @jobs_strongify(self)
        [self reloadData];
        return self;
    };
}

-(JobsRetFSCalendarByDateBlock _Nonnull)bySelectDate{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        [self selectDate:data];
        return self;
    };
}

-(JobsRetFSCalendarByDateBlock _Nonnull)byDeselectDate{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        [self deselectDate:data];
        return self;
    };
}

-(JobsRetFSCalendarByDateForCellBlock _Nonnull)byDateForCell{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(FSCalendarCell * _Nullable data){
        @jobs_strongify(self)
        return [self dateForCell:data];
    };
}

-(JobsRetFSCalendarByMonthPositionForCellBlock _Nonnull)byMonthPositionForCell{
    @jobs_weakify(self)
    return ^NSInteger(FSCalendarCell * _Nullable data){
        @jobs_strongify(self)
        return [self monthPositionForCell:data];
    };
}

-(JobsRetFSCalendarByVisibleCellsBlock _Nonnull)byVisibleCells{
    @jobs_weakify(self)
    return ^NSArray<__kindof FSCalendarCell *> * _Nullable(void){
        @jobs_strongify(self)
        return [self visibleCells];
    };
}

-(JobsRetFSCalendarByFrameForDateBlock _Nonnull)byFrameForDate{
    @jobs_weakify(self)
    return ^CGRect(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self frameForDate:data];
    };
}

-(JobsRetFSCalendarByPanGestureRecognizerBlock _Nonnull)byHandleScopeGesture{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(UIPanGestureRecognizer * _Nullable data){
        @jobs_strongify(self)
        [self handleScopeGesture:data];
        return self;
    };
}

-(JobsRetFSCalendarByVoidBlock _Nonnull)byAdjustMonthPosition{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(void){
        @jobs_strongify(self)
        [self adjustMonthPosition];
        return self;
    };
}

-(JobsRetFSCalendarByVoidBlock _Nonnull)byConfigureAppearance{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(void){
        @jobs_strongify(self)
        [self configureAppearance];
        return self;
    };
}

@end

@implementation FSCalendarAppearance (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarAppearanceByTitleFontBlock _Nonnull)byTitleFont{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIFont * _Nullable data){
        @jobs_strongify(self)
        self.titleFont = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceBySubtitleFontBlock _Nonnull)bySubtitleFont{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIFont * _Nullable data){
        @jobs_strongify(self)
        self.subtitleFont = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByWeekdayFontBlock _Nonnull)byWeekdayFont{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIFont * _Nullable data){
        @jobs_strongify(self)
        self.weekdayFont = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByHeaderTitleFontBlock _Nonnull)byHeaderTitleFont{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIFont * _Nullable data){
        @jobs_strongify(self)
        self.headerTitleFont = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByHeaderTitleOffsetBlock _Nonnull)byHeaderTitleOffset{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(CGPoint data){
        @jobs_strongify(self)
        self.headerTitleOffset = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByTitleOffsetBlock _Nonnull)byTitleOffset{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(CGPoint data){
        @jobs_strongify(self)
        self.titleOffset = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceBySubtitleOffsetBlock _Nonnull)bySubtitleOffset{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(CGPoint data){
        @jobs_strongify(self)
        self.subtitleOffset = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByEventOffsetBlock _Nonnull)byEventOffset{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(CGPoint data){
        @jobs_strongify(self)
        self.eventOffset = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByImageOffsetBlock _Nonnull)byImageOffset{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(CGPoint data){
        @jobs_strongify(self)
        self.imageOffset = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByEventDefaultColorBlock _Nonnull)byEventDefaultColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.eventDefaultColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByEventSelectionColorBlock _Nonnull)byEventSelectionColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.eventSelectionColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByWeekdayTextColorBlock _Nonnull)byWeekdayTextColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.weekdayTextColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByHeaderTitleColorBlock _Nonnull)byHeaderTitleColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.headerTitleColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByHeaderSeparatorColorBlock _Nonnull)byHeaderSeparatorColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.headerSeparatorColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByHeaderDateFormatBlock _Nonnull)byHeaderDateFormat{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        self.headerDateFormat = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByHeaderTitleAlignmentBlock _Nonnull)byHeaderTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(NSTextAlignment data){
        @jobs_strongify(self)
        self.headerTitleAlignment = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByHeaderMinimumDissolvedAlphaBlock _Nonnull)byHeaderMinimumDissolvedAlpha{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.headerMinimumDissolvedAlpha = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByTitleDefaultColorBlock _Nonnull)byTitleDefaultColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.titleDefaultColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByTitleSelectionColorBlock _Nonnull)byTitleSelectionColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.titleSelectionColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByTitleTodayColorBlock _Nonnull)byTitleTodayColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.titleTodayColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByTitlePlaceholderColorBlock _Nonnull)byTitlePlaceholderColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.titlePlaceholderColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByTitleWeekendColorBlock _Nonnull)byTitleWeekendColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.titleWeekendColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceBySubtitleDefaultColorBlock _Nonnull)bySubtitleDefaultColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.subtitleDefaultColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceBySubtitleSelectionColorBlock _Nonnull)bySubtitleSelectionColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.subtitleSelectionColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceBySubtitleTodayColorBlock _Nonnull)bySubtitleTodayColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.subtitleTodayColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceBySubtitlePlaceholderColorBlock _Nonnull)bySubtitlePlaceholderColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.subtitlePlaceholderColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceBySubtitleWeekendColorBlock _Nonnull)bySubtitleWeekendColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.subtitleWeekendColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceBySelectionColorBlock _Nonnull)bySelectionColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.selectionColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByTodayColorBlock _Nonnull)byTodayColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.todayColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByTodaySelectionColorBlock _Nonnull)byTodaySelectionColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.todaySelectionColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByBorderDefaultColorBlock _Nonnull)byBorderDefaultColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.borderDefaultColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByBorderSelectionColorBlock _Nonnull)byBorderSelectionColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.borderSelectionColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByBorderRadiusBlock _Nonnull)byBorderRadius{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.borderRadius = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByCaseOptionsBlock _Nonnull)byCaseOptions{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.caseOptions = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceBySeparatorsBlock _Nonnull)bySeparators{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.separators = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByCalendarBlock _Nonnull)byCalendar{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(FSCalendar * _Nullable data){
        @jobs_strongify(self)
        self.calendar = data;
        return self;
    };
}

-(JobsRetDicByVoidBlock _Nonnull)byGetBackgroundColors{
    @jobs_weakify(self)
    return ^NSDictionary * _Nullable(void){
        @jobs_strongify(self)
        return self.backgroundColors;
    };
}

-(JobsRetDicByVoidBlock _Nonnull)byGetTitleColors{
    @jobs_weakify(self)
    return ^NSDictionary * _Nullable(void){
        @jobs_strongify(self)
        return self.titleColors;
    };
}

-(JobsRetDicByVoidBlock _Nonnull)byGetSubtitleColors{
    @jobs_weakify(self)
    return ^NSDictionary * _Nullable(void){
        @jobs_strongify(self)
        return self.subtitleColors;
    };
}

-(JobsRetDicByVoidBlock _Nonnull)byGetBorderColors{
    @jobs_weakify(self)
    return ^NSDictionary * _Nullable(void){
        @jobs_strongify(self)
        return self.borderColors;
    };
}

@end

@implementation FSCalendarCell (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarCellByTitleLabelBlock _Nonnull)byTitleLabel{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UILabel * _Nullable data){
        @jobs_strongify(self)
        self.titleLabel = data;
        return self;
    };
}

-(JobsRetFSCalendarCellBySubtitleLabelBlock _Nonnull)bySubtitleLabel{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UILabel * _Nullable data){
        @jobs_strongify(self)
        self.subtitleLabel = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByShapeLayerBlock _Nonnull)byShapeLayer{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(CAShapeLayer * _Nullable data){
        @jobs_strongify(self)
        self.shapeLayer = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByImageViewBlock _Nonnull)byImageView{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UIImageView * _Nullable data){
        @jobs_strongify(self)
        self.imageView = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByEventIndicatorBlock _Nonnull)byEventIndicator{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(FSCalendarEventIndicator * _Nullable data){
        @jobs_strongify(self)
        self.eventIndicator = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPlaceholderBlock _Nonnull)byPlaceholder{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(BOOL data){
        @jobs_strongify(self)
        self.placeholder = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByCalendarBlock _Nonnull)byCalendar{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(FSCalendar * _Nullable data){
        @jobs_strongify(self)
        self.calendar = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByAppearanceBlock _Nonnull)byAppearance{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(FSCalendarAppearance * _Nullable data){
        @jobs_strongify(self)
        self.appearance = data;
        return self;
    };
}

-(JobsRetFSCalendarCellBySubtitleBlock _Nonnull)bySubtitle{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        self.subtitle = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByImageBlock)byImage{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UIImage * _Nullable data){
        @jobs_strongify(self)
        self.image = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByMonthPositionBlock _Nonnull)byMonthPosition{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.monthPosition = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByNumberOfEventsBlock _Nonnull)byNumberOfEvents{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.numberOfEvents = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByDateIsTodayBlock _Nonnull)byDateIsToday{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(BOOL data){
        @jobs_strongify(self)
        self.dateIsToday = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByWeekendBlock _Nonnull)byWeekend{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(BOOL data){
        @jobs_strongify(self)
        self.weekend = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredFillDefaultColorBlock _Nonnull)byPreferredFillDefaultColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.preferredFillDefaultColor = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredFillSelectionColorBlock _Nonnull)byPreferredFillSelectionColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.preferredFillSelectionColor = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredTitleDefaultColorBlock _Nonnull)byPreferredTitleDefaultColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.preferredTitleDefaultColor = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredTitleSelectionColorBlock _Nonnull)byPreferredTitleSelectionColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.preferredTitleSelectionColor = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredSubtitleDefaultColorBlock _Nonnull)byPreferredSubtitleDefaultColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.preferredSubtitleDefaultColor = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredSubtitleSelectionColorBlock _Nonnull)byPreferredSubtitleSelectionColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.preferredSubtitleSelectionColor = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredBorderDefaultColorBlock _Nonnull)byPreferredBorderDefaultColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.preferredBorderDefaultColor = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredBorderSelectionColorBlock _Nonnull)byPreferredBorderSelectionColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.preferredBorderSelectionColor = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredTitleOffsetBlock _Nonnull)byPreferredTitleOffset{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(CGPoint data){
        @jobs_strongify(self)
        self.preferredTitleOffset = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredSubtitleOffsetBlock _Nonnull)byPreferredSubtitleOffset{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(CGPoint data){
        @jobs_strongify(self)
        self.preferredSubtitleOffset = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredImageOffsetBlock _Nonnull)byPreferredImageOffset{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(CGPoint data){
        @jobs_strongify(self)
        self.preferredImageOffset = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredEventOffsetBlock _Nonnull)byPreferredEventOffset{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(CGPoint data){
        @jobs_strongify(self)
        self.preferredEventOffset = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredEventDefaultColorsBlock _Nonnull)byPreferredEventDefaultColors{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(NSArray<UIColor *> * _Nullable data){
        @jobs_strongify(self)
        self.preferredEventDefaultColors = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredEventSelectionColorsBlock _Nonnull)byPreferredEventSelectionColors{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(NSArray<UIColor *> * _Nullable data){
        @jobs_strongify(self)
        self.preferredEventSelectionColors = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredBorderRadiusBlock _Nonnull)byPreferredBorderRadius{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.preferredBorderRadius = data;
        return self;
    };
}

#pragma mark —— Methods
-(JobsRetFSCalendarCellByLayoutSubviewsBlock _Nonnull)byLayoutSubviews{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(void){
        @jobs_strongify(self)
        [self layoutSubviews];
        return self;
    };
}

-(JobsRetFSCalendarCellByConfigureAppearanceBlock _Nonnull)byConfigureAppearance{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(void){
        @jobs_strongify(self)
        [self configureAppearance];
        return self;
    };
}

-(JobsRetFSCalendarCellByColorForCurrentStateInDictionaryBlock _Nonnull)byColorForCurrentStateInDictionary{
    @jobs_weakify(self)
    return ^UIColor * _Nullable(NSDictionary * _Nullable data){
        @jobs_strongify(self)
        return [self colorForCurrentStateInDictionary:data];
    };
}

-(JobsRetFSCalendarCellByPerformSelectingBlock _Nonnull)byPerformSelecting{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(void){
        @jobs_strongify(self)
        [self performSelecting];
        return self;
    };
}

@end

@implementation FSCalendarEventIndicator (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarEventIndicatorByNumberOfEventsBlock _Nonnull)byNumberOfEvents{
    @jobs_weakify(self)
    return ^__kindof FSCalendarEventIndicator * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.numberOfEvents = data;
        return self;
    };
}

-(JobsRetFSCalendarEventIndicatorByColorBlock _Nonnull)byColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarEventIndicator * _Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.color = data;
        return self;
    };
}

@end

@implementation FSCalendarBlankCell (JobsFSCalendarDSL)
#pragma mark —— Methods
-(JobsRetFSCalendarBlankCellByConfigureAppearanceBlock _Nonnull)byConfigureAppearance{
    @jobs_weakify(self)
    return ^__kindof FSCalendarBlankCell * _Nullable(void){
        @jobs_strongify(self)
        [self configureAppearance];
        return self;
    };
}

@end

@implementation FSCalendarCollectionView (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarCollectionViewByInternalDelegateBlock _Nonnull)byInternalDelegate{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCollectionView * _Nullable(id<FSCalendarCollectionViewInternalDelegate> _Nullable data){
        @jobs_strongify(self)
        self.internalDelegate = data;
        return self;
    };
}

@end

@implementation FSCalendarCollectionViewLayout (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarCollectionViewLayoutByCalendarBlock _Nonnull)byCalendar{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCollectionViewLayout * _Nullable(FSCalendar * _Nullable data){
        @jobs_strongify(self)
        self.calendar = data;
        return self;
    };
}

-(JobsRetFSCalendarCollectionViewLayoutBySectionInsetsBlock _Nonnull)bySectionInsets{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCollectionViewLayout * _Nullable(UIEdgeInsets data){
        @jobs_strongify(self)
        self.sectionInsets = data;
        return self;
    };
}

-(JobsRetFSCalendarCollectionViewLayoutByScrollDirectionBlock _Nonnull)byScrollDirection{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCollectionViewLayout * _Nullable(UICollectionViewScrollDirection data){
        @jobs_strongify(self)
        self.scrollDirection = data;
        return self;
    };
}

-(JobsRetFSCalendarCollectionViewLayoutByGetEstimatedItemSizeBlock _Nonnull)byGetEstimatedItemSize{
    @jobs_weakify(self)
    return ^CGSize(void){
        @jobs_strongify(self)
        return self.estimatedItemSize;
    };
}

@end

@implementation FSCalendarCalculator (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarCalculatorByCalendarBlock _Nonnull)byCalendar{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCalculator * _Nullable(FSCalendar * _Nullable data){
        @jobs_strongify(self)
        self.calendar = data;
        return self;
    };
}

-(JobsRetNSIntegerByVoidBlock _Nonnull)byGetNumberOfSections{
    @jobs_weakify(self)
    return ^NSInteger(void){
        @jobs_strongify(self)
        return self.numberOfSections;
    };
}

#pragma mark —— Methods
-(JobsRetDateByDateBlock _Nonnull)bySafeDateForDate{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self safeDateForDate:data];
    };
}

-(JobsRetDateByIndexPathBlock _Nonnull)byDateForIndexPath{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSIndexPath * _Nullable data){
        @jobs_strongify(self)
        return [self dateForIndexPath:data];
    };
}

-(JobsRetFSCalendarCalculatorByIndexPathForDateBlock _Nonnull)byIndexPathForDate{
    @jobs_weakify(self)
    return ^NSIndexPath * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self indexPathForDate:data];
    };
}

-(JobsRetDateByNSIntegerBlock _Nonnull)byPageForSection{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSInteger data){
        @jobs_strongify(self)
        return [self pageForSection:data];
    };
}

-(JobsRetDateByNSIntegerBlock _Nonnull)byWeekForSection{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSInteger data){
        @jobs_strongify(self)
        return [self weekForSection:data];
    };
}

-(JobsRetDateByNSIntegerBlock _Nonnull)byMonthForSection{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSInteger data){
        @jobs_strongify(self)
        return [self monthForSection:data];
    };
}

-(JobsRetDateByNSIntegerBlock _Nonnull)byMonthHeadForSection{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSInteger data){
        @jobs_strongify(self)
        return [self monthHeadForSection:data];
    };
}

-(JobsRetIntegerByDateBlock _Nonnull)byNumberOfHeadPlaceholdersForMonth{
    @jobs_weakify(self)
    return ^NSInteger(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self numberOfHeadPlaceholdersForMonth:data];
    };
}

-(JobsRetIntegerByDateBlock _Nonnull)byNumberOfRowsInMonth{
    @jobs_weakify(self)
    return ^NSInteger(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self numberOfRowsInMonth:data];
    };
}

-(JobsRetByNSIntegerBlock _Nonnull)byNumberOfRowsInSection{
    @jobs_weakify(self)
    return ^NSInteger(NSInteger data){
        @jobs_strongify(self)
        return [self numberOfRowsInSection:data];
    };
}

-(JobsRetFSCalendarCalculatorByMonthPositionForIndexPathBlock _Nonnull)byMonthPositionForIndexPath{
    @jobs_weakify(self)
    return ^NSInteger(NSIndexPath * _Nullable data){
        @jobs_strongify(self)
        return [self monthPositionForIndexPath:data];
    };
}

-(JobsRetFSCalendarCalculatorByCoordinateForIndexPathBlock _Nonnull)byCoordinateForIndexPath{
    @jobs_weakify(self)
    return ^NSValue * _Nullable(NSIndexPath * _Nullable data){
        @jobs_strongify(self)
        FSCalendarCoordinate coordinate = [self coordinateForIndexPath:data];
        return [NSValue value:&coordinate withObjCType:@encode(FSCalendarCoordinate)];
    };
}

-(JobsRetFSCalendarCalculatorByReloadSectionsBlock _Nonnull)byReloadSections{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCalculator * _Nullable(void){
        @jobs_strongify(self)
        [self reloadSections];
        return self;
    };
}

@end

@implementation FSCalendarDelegationProxy (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarDelegationProxyByDelegationBlock _Nonnull)byDelegation{
    @jobs_weakify(self)
    return ^__kindof FSCalendarDelegationProxy * _Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.delegation = data;
        return self;
    };
}

-(JobsRetFSCalendarDelegationProxyByProtocolBlock _Nonnull)byProtocol{
    @jobs_weakify(self)
    return ^__kindof FSCalendarDelegationProxy * _Nullable(Protocol * _Nullable data){
        @jobs_strongify(self)
        self.protocol = data;
        return self;
    };
}

-(JobsRetFSCalendarDelegationProxyByDeprecationsBlock _Nonnull)byDeprecations{
    @jobs_weakify(self)
    return ^__kindof FSCalendarDelegationProxy * _Nullable(NSDictionary<NSString *,NSString *> * _Nullable data){
        @jobs_strongify(self)
        self.deprecations = data;
        return self;
    };
}

#pragma mark —— Methods
-(JobsRetFSCalendarDelegationProxyByDeprecatedSelectorOfSelectorBlock _Nonnull)byDeprecatedSelectorOfSelector{
    @jobs_weakify(self)
    return ^SEL _Nullable(SEL _Nullable data){
        @jobs_strongify(self)
        return [self deprecatedSelectorOfSelector:data];
    };
}

@end

@implementation UIView (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetViewByCGFloatBlock _Nonnull)byFs_width{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_width = data;
        return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)byFs_height{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_height = data;
        return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)byFs_top{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_top = data;
        return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)byFs_left{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_left = data;
        return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)byFs_bottom{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_bottom = data;
        return self;
    };
}

-(JobsRetViewByCGFloatBlock _Nonnull)byFs_right{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_right = data;
        return self;
    };
}

@end

@implementation CALayer (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetCALayerByCGFloatBlock _Nonnull)byFs_width{
    @jobs_weakify(self)
    return ^__kindof CALayer * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_width = data;
        return self;
    };
}

-(JobsRetCALayerByCGFloatBlock _Nonnull)byFs_height{
    @jobs_weakify(self)
    return ^__kindof CALayer * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_height = data;
        return self;
    };
}

-(JobsRetCALayerByCGFloatBlock _Nonnull)byFs_top{
    @jobs_weakify(self)
    return ^__kindof CALayer * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_top = data;
        return self;
    };
}

-(JobsRetCALayerByCGFloatBlock _Nonnull)byFs_left{
    @jobs_weakify(self)
    return ^__kindof CALayer * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_left = data;
        return self;
    };
}

-(JobsRetCALayerByCGFloatBlock _Nonnull)byFs_bottom{
    @jobs_weakify(self)
    return ^__kindof CALayer * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_bottom = data;
        return self;
    };
}

-(JobsRetCALayerByCGFloatBlock _Nonnull)byFs_right{
    @jobs_weakify(self)
    return ^__kindof CALayer * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_right = data;
        return self;
    };
}

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN NSCalendar
@interface NSCalendar (JobsPropertyDSLSetterAutogen_cc2aebeb90)
-(void)setLocale:(NSLocale * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END NSCalendar

@implementation NSCalendar (JobsFSCalendarDSL)
-(JobsRetCalendarByTimeZoneBlock _Nonnull)byTimeZone{
    @jobs_weakify(self)
    return ^__kindof NSCalendar *(NSTimeZone *timeZone){
        @jobs_strongify(self)
        self.timeZone = timeZone;
        return self;
    };
}
#pragma mark —— Methods
-(JobsRetCalendarByNSUIntegerBlock _Nonnull)byMinimumDaysInFirstWeek{
    @jobs_weakify(self)
    return ^__kindof NSCalendar *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.minimumDaysInFirstWeek = data;
        return self;
    };
}

-(JobsRetDateByDateBlock _Nonnull)byFs_firstDayOfMonth{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self fs_firstDayOfMonth:data];
    };
}

-(JobsRetDateByDateBlock _Nonnull)byFs_lastDayOfMonth{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self fs_lastDayOfMonth:data];
    };
}

-(JobsRetDateByDateBlock _Nonnull)byFs_firstDayOfWeek{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self fs_firstDayOfWeek:data];
    };
}

-(JobsRetDateByDateBlock _Nonnull)byFs_lastDayOfWeek{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self fs_lastDayOfWeek:data];
    };
}

-(JobsRetDateByDateBlock _Nonnull)byFs_middleDayOfWeek{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self fs_middleDayOfWeek:data];
    };
}

-(JobsRetIntegerByDateBlock _Nonnull)byFs_numberOfDaysInMonth{
    @jobs_weakify(self)
    return ^NSInteger(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self fs_numberOfDaysInMonth:data];
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN NSCalendar
-(JobsRetNSCalendarByNSLocaleBlock _Nonnull)byLocale{
    @jobs_weakify(self)
    return ^__kindof NSCalendar * _Nullable(NSLocale * _Nullable data){
        @jobs_strongify(self)
        [self setLocale:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END NSCalendar
@end

@implementation NSMapTable (JobsFSCalendarDSL)
#pragma mark —— Methods
-(JobsRetNSMapTableByObjectForKeyedSubscriptBlock _Nonnull)byObjectForKeyedSubscript{
    @jobs_weakify(self)
    return ^id _Nullable(id<NSCopying> _Nullable data){
        @jobs_strongify(self)
        return [self objectForKeyedSubscript:data];
    };
}

-(JobsRetNSMapTableByIDBlock _Nonnull)byRemoveObjectForKey{
    @jobs_weakify(self)
    return ^__kindof NSMapTable *_Nullable(id<NSCopying> _Nullable data){
        @jobs_strongify(self)
        if (data) [self removeObjectForKey:data];
        return self;
    };
}

-(JobsRetNSMapTableByVoidBlock _Nonnull)byRemoveAllObjects{
    @jobs_weakify(self)
    return ^__kindof NSMapTable *_Nullable(void){
        @jobs_strongify(self)
        [self removeAllObjects];
        return self;
    };
}

@end

@implementation NSCache (JobsFSCalendarDSL)
#pragma mark —— Methods
-(JobsRetNSCacheByNSUIntegerBlock _Nonnull)byTotalCostLimit{
    @jobs_weakify(self)
    return ^__kindof NSCache *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.totalCostLimit = data;
        return self;
    };
}

-(JobsRetNSCacheByNSUIntegerBlock _Nonnull)byCountLimit{
    @jobs_weakify(self)
    return ^__kindof NSCache *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.countLimit = data;
        return self;
    };
}

-(JobsRetNSCacheByBOOLBlock _Nonnull)byEvictsObjectsWithDiscardedContent{
    @jobs_weakify(self)
    return ^__kindof NSCache *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.evictsObjectsWithDiscardedContent = data;
        return self;
    };
}

-(JobsRetNSCacheByObjectForKeyedSubscriptBlock _Nonnull)byObjectForKeyedSubscript{
    @jobs_weakify(self)
    return ^id _Nullable(id<NSCopying> _Nullable data){
        @jobs_strongify(self)
        return [self objectForKeyedSubscript:data];
    };
}

-(JobsRetNSCacheByIDBlock _Nonnull)byRemoveObjectForKey{
    @jobs_weakify(self)
    return ^__kindof NSCache *_Nullable(id<NSCopying> _Nullable data){
        @jobs_strongify(self)
        if (data) [self removeObjectForKey:data];
        return self;
    };
}

-(JobsRetNSCacheByVoidBlock _Nonnull)byRemoveAllObjects{
    @jobs_weakify(self)
    return ^__kindof NSCache *_Nullable(void){
        @jobs_strongify(self)
        [self removeAllObjects];
        return self;
    };
}

@end

@implementation NSObject (JobsFSCalendarDSL)
#pragma mark —— Methods
-(JobsRetIDByStrBlock _Nonnull)byFs_variableForKey{
    @jobs_weakify(self)
    return ^id _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        return [self fs_variableForKey:data];
    };
}

@end

@implementation FSCalendarHeaderView (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarHeaderViewByCollectionViewBlock _Nonnull)byCollectionView{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderView * _Nullable(FSCalendarCollectionView * _Nullable data){
        @jobs_strongify(self)
        self.collectionView = data;
        return self;
    };
}

-(JobsRetFSCalendarHeaderViewByCollectionViewLayoutBlock _Nonnull)byCollectionViewLayout{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderView * _Nullable(FSCalendarHeaderLayout * _Nullable data){
        @jobs_strongify(self)
        self.collectionViewLayout = data;
        return self;
    };
}

-(JobsRetFSCalendarHeaderViewByCalendarBlock _Nonnull)byCalendar{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderView * _Nullable(FSCalendar * _Nullable data){
        @jobs_strongify(self)
        self.calendar = data;
        return self;
    };
}

-(JobsRetFSCalendarHeaderViewByScrollDirectionBlock _Nonnull)byScrollDirection{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderView * _Nullable(UICollectionViewScrollDirection data){
        @jobs_strongify(self)
        self.scrollDirection = data;
        return self;
    };
}

-(JobsRetFSCalendarHeaderViewByScrollEnabledBlock _Nonnull)byScrollEnabled{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderView * _Nullable(BOOL data){
        @jobs_strongify(self)
        self.scrollEnabled = data;
        return self;
    };
}

#pragma mark —— Methods
-(JobsRetFSCalendarHeaderViewBySetScrollOffsetBlock _Nonnull)bySetScrollOffset{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setScrollOffset:data];
        return self;
    };
}

-(JobsRetFSCalendarHeaderViewByVoidBlock _Nonnull)byReloadData{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderView * _Nullable(void){
        @jobs_strongify(self)
        [self reloadData];
        return self;
    };
}

-(JobsRetFSCalendarHeaderViewByVoidBlock _Nonnull)byConfigureAppearance{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderView * _Nullable(void){
        @jobs_strongify(self)
        [self configureAppearance];
        return self;
    };
}

@end

@implementation FSCalendarHeaderCell (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarHeaderCellByTitleLabelBlock _Nonnull)byTitleLabel{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderCell * _Nullable(UILabel * _Nullable data){
        @jobs_strongify(self)
        self.titleLabel = data;
        return self;
    };
}

-(JobsRetFSCalendarHeaderCellByHeaderBlock _Nonnull)byHeader{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderCell * _Nullable(FSCalendarHeaderView * _Nullable data){
        @jobs_strongify(self)
        self.header = data;
        return self;
    };
}

@end

@implementation FSCalendarHeaderTouchDeliver (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarHeaderTouchDeliverByCalendarBlock _Nonnull)byCalendar{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderTouchDeliver * _Nullable(FSCalendar * _Nullable data){
        @jobs_strongify(self)
        self.calendar = data;
        return self;
    };
}

-(JobsRetFSCalendarHeaderTouchDeliverByHeaderBlock _Nonnull)byHeader{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderTouchDeliver * _Nullable(FSCalendarHeaderView * _Nullable data){
        @jobs_strongify(self)
        self.header = data;
        return self;
    };
}

@end

@implementation FSCalendarStickyHeader (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarStickyHeaderByCalendarBlock _Nonnull)byCalendar{
    @jobs_weakify(self)
    return ^__kindof FSCalendarStickyHeader * _Nullable(FSCalendar * _Nullable data){
        @jobs_strongify(self)
        self.calendar = data;
        return self;
    };
}

-(JobsRetFSCalendarStickyHeaderByTitleLabelBlock _Nonnull)byTitleLabel{
    @jobs_weakify(self)
    return ^__kindof FSCalendarStickyHeader * _Nullable(UILabel * _Nullable data){
        @jobs_strongify(self)
        self.titleLabel = data;
        return self;
    };
}

-(JobsRetFSCalendarStickyHeaderByMonthBlock _Nonnull)byMonth{
    @jobs_weakify(self)
    return ^__kindof FSCalendarStickyHeader * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        self.month = data;
        return self;
    };
}

#pragma mark —— Methods
-(JobsRetFSCalendarStickyHeaderByConfigureAppearanceBlock _Nonnull)byConfigureAppearance{
    @jobs_weakify(self)
    return ^__kindof FSCalendarStickyHeader * _Nullable(void){
        @jobs_strongify(self)
        [self configureAppearance];
        return self;
    };
}

@end

@implementation FSCalendarTransitionCoordinator (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarTransitionCoordinatorByStateBlock _Nonnull)byState{
    @jobs_weakify(self)
    return ^__kindof FSCalendarTransitionCoordinator * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.state = data;
        return self;
    };
}

-(JobsRetFSCalendarTransitionCoordinatorByCachedMonthSizeBlock _Nonnull)byCachedMonthSize{
    @jobs_weakify(self)
    return ^__kindof FSCalendarTransitionCoordinator * _Nullable(CGSize data){
        @jobs_strongify(self)
        self.cachedMonthSize = data;
        return self;
    };
}

-(JobsRetNSIntegerByVoidBlock _Nonnull)byGetRepresentingScope{
    @jobs_weakify(self)
    return ^NSInteger(void){
        @jobs_strongify(self)
        return self.representingScope;
    };
}

#pragma mark —— Methods
-(JobsRetFSCalendarTransitionCoordinatorByHandleScopeGestureBlock _Nonnull)byHandleScopeGesture{
    @jobs_weakify(self)
    return ^__kindof FSCalendarTransitionCoordinator * _Nullable(id _Nullable data){
        @jobs_strongify(self)
        [self handleScopeGesture:data];
        return self;
    };
}

@end

@implementation FSCalendarTransitionAttributes (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarTransitionAttributesBySourceBoundsBlock _Nonnull)bySourceBounds{
    @jobs_weakify(self)
    return ^__kindof FSCalendarTransitionAttributes * _Nullable(CGRect data){
        @jobs_strongify(self)
        self.sourceBounds = data;
        return self;
    };
}

-(JobsRetFSCalendarTransitionAttributesByTargetBoundsBlock _Nonnull)byTargetBounds{
    @jobs_weakify(self)
    return ^__kindof FSCalendarTransitionAttributes * _Nullable(CGRect data){
        @jobs_strongify(self)
        self.targetBounds = data;
        return self;
    };
}

-(JobsRetFSCalendarTransitionAttributesBySourcePageBlock _Nonnull)bySourcePage{
    @jobs_weakify(self)
    return ^__kindof FSCalendarTransitionAttributes * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        self.sourcePage = data;
        return self;
    };
}

-(JobsRetFSCalendarTransitionAttributesByTargetPageBlock _Nonnull)byTargetPage{
    @jobs_weakify(self)
    return ^__kindof FSCalendarTransitionAttributes * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        self.targetPage = data;
        return self;
    };
}

-(JobsRetFSCalendarTransitionAttributesByFocusedRowBlock _Nonnull)byFocusedRow{
    @jobs_weakify(self)
    return ^__kindof FSCalendarTransitionAttributes * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.focusedRow = data;
        return self;
    };
}

-(JobsRetFSCalendarTransitionAttributesByFocusedDateBlock _Nonnull)byFocusedDate{
    @jobs_weakify(self)
    return ^__kindof FSCalendarTransitionAttributes * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        self.focusedDate = data;
        return self;
    };
}

-(JobsRetFSCalendarTransitionAttributesByTargetScopeBlock _Nonnull)byTargetScope{
    @jobs_weakify(self)
    return ^__kindof FSCalendarTransitionAttributes * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.targetScope = data;
        return self;
    };
}

#pragma mark —— Methods
-(JobsRetFSCalendarTransitionAttributesByRevertBlock _Nonnull)byRevert{
    @jobs_weakify(self)
    return ^__kindof FSCalendarTransitionAttributes * _Nullable(void){
        @jobs_strongify(self)
        [self revert];
        return self;
    };
}

@end

@implementation FSCalendarWeekdayView (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarWeekdayViewByGetWeekdayLabelsBlock _Nonnull)byGetWeekdayLabels{
    @jobs_weakify(self)
    return ^NSArray<UILabel *> * _Nullable(void){
        @jobs_strongify(self)
        return self.weekdayLabels;
    };
}

-(JobsRetFSCalendarWeekdayViewByCalendarBlock _Nonnull)byCalendar{
    @jobs_weakify(self)
    return ^__kindof FSCalendarWeekdayView * _Nullable(FSCalendar * _Nullable data){
        @jobs_strongify(self)
        self.calendar = data;
        return self;
    };
}

#pragma mark —— Methods
-(JobsRetFSCalendarWeekdayViewByConfigureAppearanceBlock _Nonnull)byConfigureAppearance{
    @jobs_weakify(self)
    return ^__kindof FSCalendarWeekdayView * _Nullable(void){
        @jobs_strongify(self)
        [self configureAppearance];
        return self;
    };
}

@end
