//
//  FSCalendar+DSL.m
//  JobsOCDSL
//
//  Auto-generated from FSCalendar public headers on 2026年6月10日，星期三。
//

#import "FSCalendar+DSL.h"

@implementation FSCalendar (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarByTimeZoneBlock)byTimeZone{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(NSTimeZone * _Nullable data){
        @jobs_strongify(self)
        self.timeZone = data;
        return self;
    };
}

-(JobsRetFSCalendarByDelegateBlock)byDelegate{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(id<FSCalendarDelegate> _Nullable data){
        @jobs_strongify(self)
        self.delegate = data;
        return self;
    };
}

-(JobsRetFSCalendarByDataSourceBlock)byDataSource{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(id<FSCalendarDataSource> _Nullable data){
        @jobs_strongify(self)
        self.dataSource = data;
        return self;
    };
}

-(JobsRetFSCalendarByTodayBlock)byToday{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        self.today = data;
        return self;
    };
}

-(JobsRetFSCalendarByCurrentPageBlock)byCurrentPage{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        self.currentPage = data;
        return self;
    };
}

-(JobsRetFSCalendarByLocaleBlock)byLocale{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(NSLocale * _Nullable data){
        @jobs_strongify(self)
        self.locale = data;
        return self;
    };
}

-(JobsRetFSCalendarByScrollDirectionBlock)byScrollDirection{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.scrollDirection = data;
        return self;
    };
}

-(JobsRetFSCalendarByScopeBlock)byScope{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.scope = data;
        return self;
    };
}

-(JobsRetFSCalendarByGetScopeGestureBlock)byGetScopeGesture{
    @jobs_weakify(self)
    return ^UIPanGestureRecognizer * _Nullable(void){
        @jobs_strongify(self)
        return self.scopeGesture;
    };
}

-(JobsRetFSCalendarByGetSwipeToChooseGestureBlock)byGetSwipeToChooseGesture{
    @jobs_weakify(self)
    return ^UILongPressGestureRecognizer * _Nullable(void){
        @jobs_strongify(self)
        return self.swipeToChooseGesture;
    };
}

-(JobsRetFSCalendarByPlaceholderTypeBlock)byPlaceholderType{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.placeholderType = data;
        return self;
    };
}

-(JobsRetFSCalendarByFirstWeekdayBlock)byFirstWeekday{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.firstWeekday = data;
        return self;
    };
}

-(JobsRetFSCalendarByHeaderHeightBlock)byHeaderHeight{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.headerHeight = data;
        return self;
    };
}

-(JobsRetFSCalendarByWeekdayHeightBlock)byWeekdayHeight{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.weekdayHeight = data;
        return self;
    };
}

-(JobsRetFSCalendarByCalendarWeekdayViewBlock)byCalendarWeekdayView{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(FSCalendarWeekdayView * _Nullable data){
        @jobs_strongify(self)
        self.calendarWeekdayView = data;
        return self;
    };
}

-(JobsRetFSCalendarByCalendarHeaderViewBlock)byCalendarHeaderView{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(FSCalendarHeaderView * _Nullable data){
        @jobs_strongify(self)
        self.calendarHeaderView = data;
        return self;
    };
}

-(JobsRetFSCalendarByAllowsSelectionBlock)byAllowsSelection{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(BOOL data){
        @jobs_strongify(self)
        self.allowsSelection = data;
        return self;
    };
}

-(JobsRetFSCalendarByAllowsMultipleSelectionBlock)byAllowsMultipleSelection{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(BOOL data){
        @jobs_strongify(self)
        self.allowsMultipleSelection = data;
        return self;
    };
}

-(JobsRetFSCalendarByAdjustsBoundingRectWhenChangingMonthsBlock)byAdjustsBoundingRectWhenChangingMonths{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(BOOL data){
        @jobs_strongify(self)
        self.adjustsBoundingRectWhenChangingMonths = data;
        return self;
    };
}

-(JobsRetFSCalendarByPagingEnabledBlock)byPagingEnabled{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(BOOL data){
        @jobs_strongify(self)
        self.pagingEnabled = data;
        return self;
    };
}

-(JobsRetFSCalendarByScrollEnabledBlock)byScrollEnabled{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(BOOL data){
        @jobs_strongify(self)
        self.scrollEnabled = data;
        return self;
    };
}

-(JobsRetFSCalendarByRowHeightBlock)byRowHeight{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.rowHeight = data;
        return self;
    };
}

-(JobsRetFSCalendarByGetAppearanceBlock)byGetAppearance{
    @jobs_weakify(self)
    return ^FSCalendarAppearance * _Nullable(void){
        @jobs_strongify(self)
        return self.appearance;
    };
}

-(JobsRetFSCalendarByGetMinimumDateBlock)byGetMinimumDate{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(void){
        @jobs_strongify(self)
        return self.minimumDate;
    };
}

-(JobsRetFSCalendarByGetMaximumDateBlock)byGetMaximumDate{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(void){
        @jobs_strongify(self)
        return self.maximumDate;
    };
}

-(JobsRetFSCalendarByGetSelectedDateBlock)byGetSelectedDate{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(void){
        @jobs_strongify(self)
        return self.selectedDate;
    };
}

-(JobsRetFSCalendarByGetSelectedDatesBlock)byGetSelectedDates{
    @jobs_weakify(self)
    return ^NSArray<NSDate *> * _Nullable(void){
        @jobs_strongify(self)
        return self.selectedDates;
    };
}

-(JobsRetFSCalendarByGetCollectionViewBlock)byGetCollectionView{
    @jobs_weakify(self)
    return ^FSCalendarCollectionView * _Nullable(void){
        @jobs_strongify(self)
        return self.collectionView;
    };
}

-(JobsRetFSCalendarByGetCollectionViewLayoutBlock)byGetCollectionViewLayout{
    @jobs_weakify(self)
    return ^FSCalendarCollectionViewLayout * _Nullable(void){
        @jobs_strongify(self)
        return self.collectionViewLayout;
    };
}

-(JobsRetFSCalendarByGetTransitionCoordinatorBlock)byGetTransitionCoordinator{
    @jobs_weakify(self)
    return ^FSCalendarTransitionCoordinator * _Nullable(void){
        @jobs_strongify(self)
        return self.transitionCoordinator;
    };
}

-(JobsRetFSCalendarByGetCalculatorBlock)byGetCalculator{
    @jobs_weakify(self)
    return ^FSCalendarCalculator * _Nullable(void){
        @jobs_strongify(self)
        return self.calculator;
    };
}

-(JobsRetFSCalendarByGetFloatingModeBlock)byGetFloatingMode{
    @jobs_weakify(self)
    return ^BOOL(void){
        @jobs_strongify(self)
        return self.floatingMode;
    };
}

-(JobsRetFSCalendarByGetVisibleStickyHeadersBlock)byGetVisibleStickyHeaders{
    @jobs_weakify(self)
    return ^NSArray * _Nullable(void){
        @jobs_strongify(self)
        return self.visibleStickyHeaders;
    };
}

-(JobsRetFSCalendarByGetPreferredHeaderHeightBlock)byGetPreferredHeaderHeight{
    @jobs_weakify(self)
    return ^CGFloat(void){
        @jobs_strongify(self)
        return self.preferredHeaderHeight;
    };
}

-(JobsRetFSCalendarByGetPreferredWeekdayHeightBlock)byGetPreferredWeekdayHeight{
    @jobs_weakify(self)
    return ^CGFloat(void){
        @jobs_strongify(self)
        return self.preferredWeekdayHeight;
    };
}

-(JobsRetFSCalendarByGetGregorianBlock)byGetGregorian{
    @jobs_weakify(self)
    return ^NSCalendar * _Nullable(void){
        @jobs_strongify(self)
        return self.gregorian;
    };
}

-(JobsRetFSCalendarByGetFormatterBlock)byGetFormatter{
    @jobs_weakify(self)
    return ^NSDateFormatter * _Nullable(void){
        @jobs_strongify(self)
        return self.formatter;
    };
}

-(JobsRetFSCalendarByGetContentViewBlock)byGetContentView{
    @jobs_weakify(self)
    return ^UIView * _Nullable(void){
        @jobs_strongify(self)
        return self.contentView;
    };
}

-(JobsRetFSCalendarByGetDaysContainerBlock)byGetDaysContainer{
    @jobs_weakify(self)
    return ^UIView * _Nullable(void){
        @jobs_strongify(self)
        return self.daysContainer;
    };
}

-(JobsRetFSCalendarByNeedsAdjustingViewFrameBlock)byNeedsAdjustingViewFrame{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(BOOL data){
        @jobs_strongify(self)
        self.needsAdjustingViewFrame = data;
        return self;
    };
}

#pragma mark —— Methods
-(JobsRetFSCalendarByReloadDataBlock)byReloadData{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(void){
        @jobs_strongify(self)
        [self reloadData];
        return self;
    };
}

-(JobsRetFSCalendarBySelectDateBlock)bySelectDate{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        [self selectDate:data];
        return self;
    };
}

-(JobsRetFSCalendarByDeselectDateBlock)byDeselectDate{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        [self deselectDate:data];
        return self;
    };
}

-(JobsRetFSCalendarByDateForCellBlock)byDateForCell{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(FSCalendarCell * _Nullable data){
        @jobs_strongify(self)
        return [self dateForCell:data];
    };
}

-(JobsRetFSCalendarByMonthPositionForCellBlock)byMonthPositionForCell{
    @jobs_weakify(self)
    return ^NSInteger(FSCalendarCell * _Nullable data){
        @jobs_strongify(self)
        return [self monthPositionForCell:data];
    };
}

-(JobsRetFSCalendarByVisibleCellsBlock)byVisibleCells{
    @jobs_weakify(self)
    return ^NSArray<__kindof FSCalendarCell *> * _Nullable(void){
        @jobs_strongify(self)
        return [self visibleCells];
    };
}

-(JobsRetFSCalendarByFrameForDateBlock)byFrameForDate{
    @jobs_weakify(self)
    return ^CGRect(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self frameForDate:data];
    };
}

-(JobsRetFSCalendarByHandleScopeGestureBlock)byHandleScopeGesture{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(UIPanGestureRecognizer * _Nullable data){
        @jobs_strongify(self)
        [self handleScopeGesture:data];
        return self;
    };
}

-(JobsRetFSCalendarByAdjustMonthPositionBlock)byAdjustMonthPosition{
    @jobs_weakify(self)
    return ^__kindof FSCalendar * _Nullable(void){
        @jobs_strongify(self)
        [self adjustMonthPosition];
        return self;
    };
}

-(JobsRetFSCalendarByConfigureAppearanceBlock)byConfigureAppearance{
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
-(JobsRetFSCalendarAppearanceByTitleFontBlock)byTitleFont{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIFont * _Nullable data){
        @jobs_strongify(self)
        self.titleFont = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceBySubtitleFontBlock)bySubtitleFont{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIFont * _Nullable data){
        @jobs_strongify(self)
        self.subtitleFont = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByWeekdayFontBlock)byWeekdayFont{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIFont * _Nullable data){
        @jobs_strongify(self)
        self.weekdayFont = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByHeaderTitleFontBlock)byHeaderTitleFont{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIFont * _Nullable data){
        @jobs_strongify(self)
        self.headerTitleFont = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByHeaderTitleOffsetBlock)byHeaderTitleOffset{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(CGPoint data){
        @jobs_strongify(self)
        self.headerTitleOffset = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByTitleOffsetBlock)byTitleOffset{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(CGPoint data){
        @jobs_strongify(self)
        self.titleOffset = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceBySubtitleOffsetBlock)bySubtitleOffset{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(CGPoint data){
        @jobs_strongify(self)
        self.subtitleOffset = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByEventOffsetBlock)byEventOffset{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(CGPoint data){
        @jobs_strongify(self)
        self.eventOffset = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByImageOffsetBlock)byImageOffset{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(CGPoint data){
        @jobs_strongify(self)
        self.imageOffset = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByEventDefaultColorBlock)byEventDefaultColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.eventDefaultColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByEventSelectionColorBlock)byEventSelectionColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.eventSelectionColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByWeekdayTextColorBlock)byWeekdayTextColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.weekdayTextColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByHeaderTitleColorBlock)byHeaderTitleColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.headerTitleColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByHeaderSeparatorColorBlock)byHeaderSeparatorColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.headerSeparatorColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByHeaderDateFormatBlock)byHeaderDateFormat{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        self.headerDateFormat = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByHeaderTitleAlignmentBlock)byHeaderTitleAlignment{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(NSTextAlignment data){
        @jobs_strongify(self)
        self.headerTitleAlignment = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByHeaderMinimumDissolvedAlphaBlock)byHeaderMinimumDissolvedAlpha{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.headerMinimumDissolvedAlpha = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByTitleDefaultColorBlock)byTitleDefaultColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.titleDefaultColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByTitleSelectionColorBlock)byTitleSelectionColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.titleSelectionColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByTitleTodayColorBlock)byTitleTodayColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.titleTodayColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByTitlePlaceholderColorBlock)byTitlePlaceholderColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.titlePlaceholderColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByTitleWeekendColorBlock)byTitleWeekendColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.titleWeekendColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceBySubtitleDefaultColorBlock)bySubtitleDefaultColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.subtitleDefaultColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceBySubtitleSelectionColorBlock)bySubtitleSelectionColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.subtitleSelectionColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceBySubtitleTodayColorBlock)bySubtitleTodayColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.subtitleTodayColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceBySubtitlePlaceholderColorBlock)bySubtitlePlaceholderColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.subtitlePlaceholderColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceBySubtitleWeekendColorBlock)bySubtitleWeekendColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.subtitleWeekendColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceBySelectionColorBlock)bySelectionColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.selectionColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByTodayColorBlock)byTodayColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.todayColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByTodaySelectionColorBlock)byTodaySelectionColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.todaySelectionColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByBorderDefaultColorBlock)byBorderDefaultColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.borderDefaultColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByBorderSelectionColorBlock)byBorderSelectionColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.borderSelectionColor = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByBorderRadiusBlock)byBorderRadius{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.borderRadius = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByCaseOptionsBlock)byCaseOptions{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.caseOptions = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceBySeparatorsBlock)bySeparators{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.separators = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByCalendarBlock)byCalendar{
    @jobs_weakify(self)
    return ^__kindof FSCalendarAppearance * _Nullable(FSCalendar * _Nullable data){
        @jobs_strongify(self)
        self.calendar = data;
        return self;
    };
}

-(JobsRetFSCalendarAppearanceByGetBackgroundColorsBlock)byGetBackgroundColors{
    @jobs_weakify(self)
    return ^NSDictionary * _Nullable(void){
        @jobs_strongify(self)
        return self.backgroundColors;
    };
}

-(JobsRetFSCalendarAppearanceByGetTitleColorsBlock)byGetTitleColors{
    @jobs_weakify(self)
    return ^NSDictionary * _Nullable(void){
        @jobs_strongify(self)
        return self.titleColors;
    };
}

-(JobsRetFSCalendarAppearanceByGetSubtitleColorsBlock)byGetSubtitleColors{
    @jobs_weakify(self)
    return ^NSDictionary * _Nullable(void){
        @jobs_strongify(self)
        return self.subtitleColors;
    };
}

-(JobsRetFSCalendarAppearanceByGetBorderColorsBlock)byGetBorderColors{
    @jobs_weakify(self)
    return ^NSDictionary * _Nullable(void){
        @jobs_strongify(self)
        return self.borderColors;
    };
}

@end

@implementation FSCalendarCell (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarCellByTitleLabelBlock)byTitleLabel{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UILabel * _Nullable data){
        @jobs_strongify(self)
        self.titleLabel = data;
        return self;
    };
}

-(JobsRetFSCalendarCellBySubtitleLabelBlock)bySubtitleLabel{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UILabel * _Nullable data){
        @jobs_strongify(self)
        self.subtitleLabel = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByShapeLayerBlock)byShapeLayer{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(CAShapeLayer * _Nullable data){
        @jobs_strongify(self)
        self.shapeLayer = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByImageViewBlock)byImageView{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UIImageView * _Nullable data){
        @jobs_strongify(self)
        self.imageView = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByEventIndicatorBlock)byEventIndicator{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(FSCalendarEventIndicator * _Nullable data){
        @jobs_strongify(self)
        self.eventIndicator = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPlaceholderBlock)byPlaceholder{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(BOOL data){
        @jobs_strongify(self)
        self.placeholder = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByCalendarBlock)byCalendar{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(FSCalendar * _Nullable data){
        @jobs_strongify(self)
        self.calendar = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByAppearanceBlock)byAppearance{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(FSCalendarAppearance * _Nullable data){
        @jobs_strongify(self)
        self.appearance = data;
        return self;
    };
}

-(JobsRetFSCalendarCellBySubtitleBlock)bySubtitle{
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

-(JobsRetFSCalendarCellByMonthPositionBlock)byMonthPosition{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.monthPosition = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByNumberOfEventsBlock)byNumberOfEvents{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.numberOfEvents = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByDateIsTodayBlock)byDateIsToday{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(BOOL data){
        @jobs_strongify(self)
        self.dateIsToday = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByWeekendBlock)byWeekend{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(BOOL data){
        @jobs_strongify(self)
        self.weekend = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredFillDefaultColorBlock)byPreferredFillDefaultColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.preferredFillDefaultColor = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredFillSelectionColorBlock)byPreferredFillSelectionColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.preferredFillSelectionColor = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredTitleDefaultColorBlock)byPreferredTitleDefaultColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.preferredTitleDefaultColor = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredTitleSelectionColorBlock)byPreferredTitleSelectionColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.preferredTitleSelectionColor = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredSubtitleDefaultColorBlock)byPreferredSubtitleDefaultColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.preferredSubtitleDefaultColor = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredSubtitleSelectionColorBlock)byPreferredSubtitleSelectionColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.preferredSubtitleSelectionColor = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredBorderDefaultColorBlock)byPreferredBorderDefaultColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.preferredBorderDefaultColor = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredBorderSelectionColorBlock)byPreferredBorderSelectionColor{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        self.preferredBorderSelectionColor = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredTitleOffsetBlock)byPreferredTitleOffset{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(CGPoint data){
        @jobs_strongify(self)
        self.preferredTitleOffset = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredSubtitleOffsetBlock)byPreferredSubtitleOffset{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(CGPoint data){
        @jobs_strongify(self)
        self.preferredSubtitleOffset = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredImageOffsetBlock)byPreferredImageOffset{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(CGPoint data){
        @jobs_strongify(self)
        self.preferredImageOffset = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredEventOffsetBlock)byPreferredEventOffset{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(CGPoint data){
        @jobs_strongify(self)
        self.preferredEventOffset = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredEventDefaultColorsBlock)byPreferredEventDefaultColors{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(NSArray<UIColor *> * _Nullable data){
        @jobs_strongify(self)
        self.preferredEventDefaultColors = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredEventSelectionColorsBlock)byPreferredEventSelectionColors{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(NSArray<UIColor *> * _Nullable data){
        @jobs_strongify(self)
        self.preferredEventSelectionColors = data;
        return self;
    };
}

-(JobsRetFSCalendarCellByPreferredBorderRadiusBlock)byPreferredBorderRadius{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.preferredBorderRadius = data;
        return self;
    };
}

#pragma mark —— Methods
-(JobsRetFSCalendarCellByLayoutSubviewsBlock)byLayoutSubviews{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(void){
        @jobs_strongify(self)
        [self layoutSubviews];
        return self;
    };
}

-(JobsRetFSCalendarCellByConfigureAppearanceBlock)byConfigureAppearance{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCell * _Nullable(void){
        @jobs_strongify(self)
        [self configureAppearance];
        return self;
    };
}

-(JobsRetFSCalendarCellByColorForCurrentStateInDictionaryBlock)byColorForCurrentStateInDictionary{
    @jobs_weakify(self)
    return ^UIColor * _Nullable(NSDictionary * _Nullable data){
        @jobs_strongify(self)
        return [self colorForCurrentStateInDictionary:data];
    };
}

-(JobsRetFSCalendarCellByPerformSelectingBlock)byPerformSelecting{
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
-(JobsRetFSCalendarEventIndicatorByNumberOfEventsBlock)byNumberOfEvents{
    @jobs_weakify(self)
    return ^__kindof FSCalendarEventIndicator * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.numberOfEvents = data;
        return self;
    };
}

-(JobsRetFSCalendarEventIndicatorByColorBlock)byColor{
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
-(JobsRetFSCalendarBlankCellByConfigureAppearanceBlock)byConfigureAppearance{
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
-(JobsRetFSCalendarCollectionViewByInternalDelegateBlock)byInternalDelegate{
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
-(JobsRetFSCalendarCollectionViewLayoutByCalendarBlock)byCalendar{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCollectionViewLayout * _Nullable(FSCalendar * _Nullable data){
        @jobs_strongify(self)
        self.calendar = data;
        return self;
    };
}

-(JobsRetFSCalendarCollectionViewLayoutBySectionInsetsBlock)bySectionInsets{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCollectionViewLayout * _Nullable(UIEdgeInsets data){
        @jobs_strongify(self)
        self.sectionInsets = data;
        return self;
    };
}

-(JobsRetFSCalendarCollectionViewLayoutByScrollDirectionBlock)byScrollDirection{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCollectionViewLayout * _Nullable(UICollectionViewScrollDirection data){
        @jobs_strongify(self)
        self.scrollDirection = data;
        return self;
    };
}

-(JobsRetFSCalendarCollectionViewLayoutByGetEstimatedItemSizeBlock)byGetEstimatedItemSize{
    @jobs_weakify(self)
    return ^CGSize(void){
        @jobs_strongify(self)
        return self.estimatedItemSize;
    };
}

@end

@implementation FSCalendarCalculator (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarCalculatorByCalendarBlock)byCalendar{
    @jobs_weakify(self)
    return ^__kindof FSCalendarCalculator * _Nullable(FSCalendar * _Nullable data){
        @jobs_strongify(self)
        self.calendar = data;
        return self;
    };
}

-(JobsRetFSCalendarCalculatorByGetNumberOfSectionsBlock)byGetNumberOfSections{
    @jobs_weakify(self)
    return ^NSInteger(void){
        @jobs_strongify(self)
        return self.numberOfSections;
    };
}

#pragma mark —— Methods
-(JobsRetFSCalendarCalculatorBySafeDateForDateBlock)bySafeDateForDate{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self safeDateForDate:data];
    };
}

-(JobsRetFSCalendarCalculatorByDateForIndexPathBlock)byDateForIndexPath{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSIndexPath * _Nullable data){
        @jobs_strongify(self)
        return [self dateForIndexPath:data];
    };
}

-(JobsRetFSCalendarCalculatorByIndexPathForDateBlock)byIndexPathForDate{
    @jobs_weakify(self)
    return ^NSIndexPath * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self indexPathForDate:data];
    };
}

-(JobsRetFSCalendarCalculatorByPageForSectionBlock)byPageForSection{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSInteger data){
        @jobs_strongify(self)
        return [self pageForSection:data];
    };
}

-(JobsRetFSCalendarCalculatorByWeekForSectionBlock)byWeekForSection{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSInteger data){
        @jobs_strongify(self)
        return [self weekForSection:data];
    };
}

-(JobsRetFSCalendarCalculatorByMonthForSectionBlock)byMonthForSection{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSInteger data){
        @jobs_strongify(self)
        return [self monthForSection:data];
    };
}

-(JobsRetFSCalendarCalculatorByMonthHeadForSectionBlock)byMonthHeadForSection{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSInteger data){
        @jobs_strongify(self)
        return [self monthHeadForSection:data];
    };
}

-(JobsRetFSCalendarCalculatorByNumberOfHeadPlaceholdersForMonthBlock)byNumberOfHeadPlaceholdersForMonth{
    @jobs_weakify(self)
    return ^NSInteger(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self numberOfHeadPlaceholdersForMonth:data];
    };
}

-(JobsRetFSCalendarCalculatorByNumberOfRowsInMonthBlock)byNumberOfRowsInMonth{
    @jobs_weakify(self)
    return ^NSInteger(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self numberOfRowsInMonth:data];
    };
}

-(JobsRetFSCalendarCalculatorByNumberOfRowsInSectionBlock)byNumberOfRowsInSection{
    @jobs_weakify(self)
    return ^NSInteger(NSInteger data){
        @jobs_strongify(self)
        return [self numberOfRowsInSection:data];
    };
}

-(JobsRetFSCalendarCalculatorByMonthPositionForIndexPathBlock)byMonthPositionForIndexPath{
    @jobs_weakify(self)
    return ^NSInteger(NSIndexPath * _Nullable data){
        @jobs_strongify(self)
        return [self monthPositionForIndexPath:data];
    };
}

-(JobsRetFSCalendarCalculatorByCoordinateForIndexPathBlock)byCoordinateForIndexPath{
    @jobs_weakify(self)
    return ^NSValue * _Nullable(NSIndexPath * _Nullable data){
        @jobs_strongify(self)
        FSCalendarCoordinate coordinate = [self coordinateForIndexPath:data];
        return [NSValue value:&coordinate withObjCType:@encode(FSCalendarCoordinate)];
    };
}

-(JobsRetFSCalendarCalculatorByReloadSectionsBlock)byReloadSections{
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
-(JobsRetFSCalendarDelegationProxyByDelegationBlock)byDelegation{
    @jobs_weakify(self)
    return ^__kindof FSCalendarDelegationProxy * _Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.delegation = data;
        return self;
    };
}

-(JobsRetFSCalendarDelegationProxyByProtocolBlock)byProtocol{
    @jobs_weakify(self)
    return ^__kindof FSCalendarDelegationProxy * _Nullable(Protocol * _Nullable data){
        @jobs_strongify(self)
        self.protocol = data;
        return self;
    };
}

-(JobsRetFSCalendarDelegationProxyByDeprecationsBlock)byDeprecations{
    @jobs_weakify(self)
    return ^__kindof FSCalendarDelegationProxy * _Nullable(NSDictionary<NSString *,NSString *> * _Nullable data){
        @jobs_strongify(self)
        self.deprecations = data;
        return self;
    };
}

#pragma mark —— Methods
-(JobsRetFSCalendarDelegationProxyByDeprecatedSelectorOfSelectorBlock)byDeprecatedSelectorOfSelector{
    @jobs_weakify(self)
    return ^SEL _Nullable(SEL _Nullable data){
        @jobs_strongify(self)
        return [self deprecatedSelectorOfSelector:data];
    };
}

@end

@implementation UIView (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetUIViewByFs_widthBlock)byFs_width{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_width = data;
        return self;
    };
}

-(JobsRetUIViewByFs_heightBlock)byFs_height{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_height = data;
        return self;
    };
}

-(JobsRetUIViewByFs_topBlock)byFs_top{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_top = data;
        return self;
    };
}

-(JobsRetUIViewByFs_leftBlock)byFs_left{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_left = data;
        return self;
    };
}

-(JobsRetUIViewByFs_bottomBlock)byFs_bottom{
    @jobs_weakify(self)
    return ^__kindof UIView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_bottom = data;
        return self;
    };
}

-(JobsRetUIViewByFs_rightBlock)byFs_right{
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
-(JobsRetCALayerByFs_widthBlock)byFs_width{
    @jobs_weakify(self)
    return ^__kindof CALayer * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_width = data;
        return self;
    };
}

-(JobsRetCALayerByFs_heightBlock)byFs_height{
    @jobs_weakify(self)
    return ^__kindof CALayer * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_height = data;
        return self;
    };
}

-(JobsRetCALayerByFs_topBlock)byFs_top{
    @jobs_weakify(self)
    return ^__kindof CALayer * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_top = data;
        return self;
    };
}

-(JobsRetCALayerByFs_leftBlock)byFs_left{
    @jobs_weakify(self)
    return ^__kindof CALayer * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_left = data;
        return self;
    };
}

-(JobsRetCALayerByFs_bottomBlock)byFs_bottom{
    @jobs_weakify(self)
    return ^__kindof CALayer * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_bottom = data;
        return self;
    };
}

-(JobsRetCALayerByFs_rightBlock)byFs_right{
    @jobs_weakify(self)
    return ^__kindof CALayer * _Nullable(CGFloat data){
        @jobs_strongify(self)
        self.fs_right = data;
        return self;
    };
}

@end

@implementation NSCalendar (JobsFSCalendarDSL)
#pragma mark —— Methods
-(JobsRetNSCalendarByFs_firstDayOfMonthBlock)byFs_firstDayOfMonth{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self fs_firstDayOfMonth:data];
    };
}

-(JobsRetNSCalendarByFs_lastDayOfMonthBlock)byFs_lastDayOfMonth{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self fs_lastDayOfMonth:data];
    };
}

-(JobsRetNSCalendarByFs_firstDayOfWeekBlock)byFs_firstDayOfWeek{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self fs_firstDayOfWeek:data];
    };
}

-(JobsRetNSCalendarByFs_lastDayOfWeekBlock)byFs_lastDayOfWeek{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self fs_lastDayOfWeek:data];
    };
}

-(JobsRetNSCalendarByFs_middleDayOfWeekBlock)byFs_middleDayOfWeek{
    @jobs_weakify(self)
    return ^NSDate * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self fs_middleDayOfWeek:data];
    };
}

-(JobsRetNSCalendarByFs_numberOfDaysInMonthBlock)byFs_numberOfDaysInMonth{
    @jobs_weakify(self)
    return ^NSInteger(NSDate * _Nullable data){
        @jobs_strongify(self)
        return [self fs_numberOfDaysInMonth:data];
    };
}

@end

@implementation NSMapTable (JobsFSCalendarDSL)
#pragma mark —— Methods
-(JobsRetNSMapTableByObjectForKeyedSubscriptBlock)byObjectForKeyedSubscript{
    @jobs_weakify(self)
    return ^id _Nullable(id<NSCopying> _Nullable data){
        @jobs_strongify(self)
        return [self objectForKeyedSubscript:data];
    };
}

@end

@implementation NSCache (JobsFSCalendarDSL)
#pragma mark —— Methods
-(JobsRetNSCacheByObjectForKeyedSubscriptBlock)byObjectForKeyedSubscript{
    @jobs_weakify(self)
    return ^id _Nullable(id<NSCopying> _Nullable data){
        @jobs_strongify(self)
        return [self objectForKeyedSubscript:data];
    };
}

@end

@implementation NSObject (JobsFSCalendarDSL)
#pragma mark —— Methods
-(JobsRetNSObjectByFs_variableForKeyBlock)byFs_variableForKey{
    @jobs_weakify(self)
    return ^id _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        return [self fs_variableForKey:data];
    };
}

@end

@implementation FSCalendarHeaderView (JobsFSCalendarDSL)
#pragma mark —— Properties
-(JobsRetFSCalendarHeaderViewByCollectionViewBlock)byCollectionView{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderView * _Nullable(FSCalendarCollectionView * _Nullable data){
        @jobs_strongify(self)
        self.collectionView = data;
        return self;
    };
}

-(JobsRetFSCalendarHeaderViewByCollectionViewLayoutBlock)byCollectionViewLayout{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderView * _Nullable(FSCalendarHeaderLayout * _Nullable data){
        @jobs_strongify(self)
        self.collectionViewLayout = data;
        return self;
    };
}

-(JobsRetFSCalendarHeaderViewByCalendarBlock)byCalendar{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderView * _Nullable(FSCalendar * _Nullable data){
        @jobs_strongify(self)
        self.calendar = data;
        return self;
    };
}

-(JobsRetFSCalendarHeaderViewByScrollDirectionBlock)byScrollDirection{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderView * _Nullable(UICollectionViewScrollDirection data){
        @jobs_strongify(self)
        self.scrollDirection = data;
        return self;
    };
}

-(JobsRetFSCalendarHeaderViewByScrollEnabledBlock)byScrollEnabled{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderView * _Nullable(BOOL data){
        @jobs_strongify(self)
        self.scrollEnabled = data;
        return self;
    };
}

#pragma mark —— Methods
-(JobsRetFSCalendarHeaderViewBySetScrollOffsetBlock)bySetScrollOffset{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setScrollOffset:data];
        return self;
    };
}

-(JobsRetFSCalendarHeaderViewByReloadDataBlock)byReloadData{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderView * _Nullable(void){
        @jobs_strongify(self)
        [self reloadData];
        return self;
    };
}

-(JobsRetFSCalendarHeaderViewByConfigureAppearanceBlock)byConfigureAppearance{
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
-(JobsRetFSCalendarHeaderCellByTitleLabelBlock)byTitleLabel{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderCell * _Nullable(UILabel * _Nullable data){
        @jobs_strongify(self)
        self.titleLabel = data;
        return self;
    };
}

-(JobsRetFSCalendarHeaderCellByHeaderBlock)byHeader{
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
-(JobsRetFSCalendarHeaderTouchDeliverByCalendarBlock)byCalendar{
    @jobs_weakify(self)
    return ^__kindof FSCalendarHeaderTouchDeliver * _Nullable(FSCalendar * _Nullable data){
        @jobs_strongify(self)
        self.calendar = data;
        return self;
    };
}

-(JobsRetFSCalendarHeaderTouchDeliverByHeaderBlock)byHeader{
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
-(JobsRetFSCalendarStickyHeaderByCalendarBlock)byCalendar{
    @jobs_weakify(self)
    return ^__kindof FSCalendarStickyHeader * _Nullable(FSCalendar * _Nullable data){
        @jobs_strongify(self)
        self.calendar = data;
        return self;
    };
}

-(JobsRetFSCalendarStickyHeaderByTitleLabelBlock)byTitleLabel{
    @jobs_weakify(self)
    return ^__kindof FSCalendarStickyHeader * _Nullable(UILabel * _Nullable data){
        @jobs_strongify(self)
        self.titleLabel = data;
        return self;
    };
}

-(JobsRetFSCalendarStickyHeaderByMonthBlock)byMonth{
    @jobs_weakify(self)
    return ^__kindof FSCalendarStickyHeader * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        self.month = data;
        return self;
    };
}

#pragma mark —— Methods
-(JobsRetFSCalendarStickyHeaderByConfigureAppearanceBlock)byConfigureAppearance{
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
-(JobsRetFSCalendarTransitionCoordinatorByStateBlock)byState{
    @jobs_weakify(self)
    return ^__kindof FSCalendarTransitionCoordinator * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.state = data;
        return self;
    };
}

-(JobsRetFSCalendarTransitionCoordinatorByCachedMonthSizeBlock)byCachedMonthSize{
    @jobs_weakify(self)
    return ^__kindof FSCalendarTransitionCoordinator * _Nullable(CGSize data){
        @jobs_strongify(self)
        self.cachedMonthSize = data;
        return self;
    };
}

-(JobsRetFSCalendarTransitionCoordinatorByGetRepresentingScopeBlock)byGetRepresentingScope{
    @jobs_weakify(self)
    return ^NSInteger(void){
        @jobs_strongify(self)
        return self.representingScope;
    };
}

#pragma mark —— Methods
-(JobsRetFSCalendarTransitionCoordinatorByHandleScopeGestureBlock)byHandleScopeGesture{
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
-(JobsRetFSCalendarTransitionAttributesBySourceBoundsBlock)bySourceBounds{
    @jobs_weakify(self)
    return ^__kindof FSCalendarTransitionAttributes * _Nullable(CGRect data){
        @jobs_strongify(self)
        self.sourceBounds = data;
        return self;
    };
}

-(JobsRetFSCalendarTransitionAttributesByTargetBoundsBlock)byTargetBounds{
    @jobs_weakify(self)
    return ^__kindof FSCalendarTransitionAttributes * _Nullable(CGRect data){
        @jobs_strongify(self)
        self.targetBounds = data;
        return self;
    };
}

-(JobsRetFSCalendarTransitionAttributesBySourcePageBlock)bySourcePage{
    @jobs_weakify(self)
    return ^__kindof FSCalendarTransitionAttributes * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        self.sourcePage = data;
        return self;
    };
}

-(JobsRetFSCalendarTransitionAttributesByTargetPageBlock)byTargetPage{
    @jobs_weakify(self)
    return ^__kindof FSCalendarTransitionAttributes * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        self.targetPage = data;
        return self;
    };
}

-(JobsRetFSCalendarTransitionAttributesByFocusedRowBlock)byFocusedRow{
    @jobs_weakify(self)
    return ^__kindof FSCalendarTransitionAttributes * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.focusedRow = data;
        return self;
    };
}

-(JobsRetFSCalendarTransitionAttributesByFocusedDateBlock)byFocusedDate{
    @jobs_weakify(self)
    return ^__kindof FSCalendarTransitionAttributes * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        self.focusedDate = data;
        return self;
    };
}

-(JobsRetFSCalendarTransitionAttributesByTargetScopeBlock)byTargetScope{
    @jobs_weakify(self)
    return ^__kindof FSCalendarTransitionAttributes * _Nullable(NSInteger data){
        @jobs_strongify(self)
        self.targetScope = data;
        return self;
    };
}

#pragma mark —— Methods
-(JobsRetFSCalendarTransitionAttributesByRevertBlock)byRevert{
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
-(JobsRetFSCalendarWeekdayViewByGetWeekdayLabelsBlock)byGetWeekdayLabels{
    @jobs_weakify(self)
    return ^NSArray<UILabel *> * _Nullable(void){
        @jobs_strongify(self)
        return self.weekdayLabels;
    };
}

-(JobsRetFSCalendarWeekdayViewByCalendarBlock)byCalendar{
    @jobs_weakify(self)
    return ^__kindof FSCalendarWeekdayView * _Nullable(FSCalendar * _Nullable data){
        @jobs_strongify(self)
        self.calendar = data;
        return self;
    };
}

#pragma mark —— Methods
-(JobsRetFSCalendarWeekdayViewByConfigureAppearanceBlock)byConfigureAppearance{
    @jobs_weakify(self)
    return ^__kindof FSCalendarWeekdayView * _Nullable(void){
        @jobs_strongify(self)
        [self configureAppearance];
        return self;
    };
}

@end

