//
//  JobsOCCalendar.m
//  JobsOCCalendar
//
//  Created by Jobs on 2026年7月1日，星期三.
//

#import <JobsOCCalendar/JobsOCCalendar.h>

@interface JobsOCCalendar ()

Prop_strong(readwrite)JobsOCCalendarAppearance *appearance;
Prop_strong(readwrite)NSDate *minimumDate;
Prop_strong(readwrite)NSDate *maximumDate;
Prop_strong(readwrite)NSArray<NSDate *> *selectedDates;
Prop_strong()UILabel *headerLabel;
Prop_strong()NSMutableArray<UILabel *> *weekdayLabels;
Prop_strong()NSMutableArray<JobsOCCalendarDayCell *> *dayCells;
Prop_strong()NSMutableArray<NSDate *> *jobsMutableSelectedDates;
Prop_strong()NSArray<NSDate *> *jobsVisibleDates;
Prop_strong()NSDateFormatter *jobsDayFormatter;
Prop_assign()CGSize jobsLastStableBoundsSize;
Prop_assign()BOOL jobsPendingBoundsReload;

-(void)jobsCommonInit;
-(void)jobsScheduleBoundsReloadIfNeeded;
-(void)jobsInstallSubviews;
-(void)jobsInstallGestureRecognizers;
-(void)jobsReloadCalendarData;
-(void)jobsReloadHeader;
-(void)jobsReloadWeekdayLabels;
-(void)jobsReloadDayCells;
-(void)jobsMoveCurrentPageByMonthOffset:(NSInteger)monthOffset;
-(void)jobsCellClickEvent:(JobsOCCalendarDayCell *)cell;
-(NSDate *)jobsStartOfDayByDate:(NSDate *)date;
-(NSDate *)jobsStartOfMonthByDate:(NSDate *)date;
-(NSDate *)jobsDateByAddingUnit:(NSCalendarUnit)unit value:(NSInteger)value toDate:(NSDate *)date;
-(BOOL)jobsDate:(NSDate *)date isSameDayAsDate:(NSDate *)otherDate;
-(BOOL)jobsDate:(NSDate *)date isSameMonthAsDate:(NSDate *)otherDate;
-(BOOL)jobsDateIsSelectable:(NSDate *)date;
-(JobsOCCalendarMonthPosition)jobsMonthPositionByDate:(NSDate *)date;
-(void)jobsNotifyBoundingRectIfNeeded:(BOOL)animated;

@end

@implementation JobsOCCalendar

-(JobsRetJobsOCCalendarByDataSourceBlock _Nonnull)byDataSource{
    @jobs_weakify(self)
    return ^__kindof JobsOCCalendar *_Nullable(id<JobsOCCalendarDataSource> _Nullable dataSource) {
        @jobs_strongify(self)
        self.dataSource = dataSource;
        return self;
    };
}

-(JobsRetJobsOCCalendarByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof JobsOCCalendar *_Nullable(id<JobsOCCalendarDelegate> _Nullable delegate) {
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self jobsCommonInit];
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        [self jobsCommonInit];
    };return self;
}

-(void)layoutSubviews{
    CGSize boundsSize = self.bounds.size;
    BOOL sizeIsValid = boundsSize.width > 0 && boundsSize.height > 0;
    BOOL sizeChanged = sizeIsValid && !CGSizeEqualToSize(self.jobsLastStableBoundsSize, boundsSize);
    [super layoutSubviews];
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    CGFloat headerHeight = MIN(self.appearance.headerHeight, height);
    CGFloat weekdayHeight = MIN(self.appearance.weekdayHeight, MAX(0, height - headerHeight));
    NSInteger rowCount = self.scope == JobsOCCalendarScopeWeek ? 1 : 6;
    CGFloat gridY = headerHeight + weekdayHeight;
    CGFloat rowHeight = rowCount > 0 ? MAX(0, (height - gridY) / rowCount) : 0;
    CGFloat columnWidth = width / 7.f;
    self.headerLabel.frame = CGRectOffset(CGRectMake(0, 0, width, headerHeight), self.appearance.headerTitleOffset.x, self.appearance.headerTitleOffset.y);
    [self.weekdayLabels enumerateObjectsUsingBlock:^(UILabel *label, NSUInteger idx, BOOL *stop) {
        label.frame = CGRectMake(columnWidth * idx, headerHeight, columnWidth, weekdayHeight);
    }];
    [self.dayCells enumerateObjectsUsingBlock:^(JobsOCCalendarDayCell *cell, NSUInteger idx, BOOL *stop) {
        NSInteger row = idx / 7;
        NSInteger column = idx % 7;
        cell.byHidden(row >= rowCount);
        cell.frame = CGRectMake(columnWidth * column, gridY + rowHeight * row, columnWidth, rowHeight);
    }];
    if (self.jobsAutomaticallyInvalidateLayoutOnBoundsChange && sizeChanged) {
        self.jobsLastStableBoundsSize = boundsSize;
        [self jobsInvalidateCalendarLayout];
        if (self.jobsReloadDataAfterBoundsChange) [self jobsScheduleBoundsReloadIfNeeded];
    }
}

-(void)reloadData{
    if (!NSThread.isMainThread) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self reloadData];
        });
        return;
    }
    [self jobsReloadCalendarData];
    [self setNeedsLayout];
}

-(void)setCurrentPage:(NSDate *)currentPage{
    [self setCurrentPage:currentPage animated:NO];
}

-(void)setCurrentPage:(NSDate *)currentPage animated:(BOOL)animated{
    if (!currentPage) return;
    NSDate *date = [self jobsStartOfMonthByDate:currentPage];
    if ([self jobsDate:date isSameMonthAsDate:_currentPage]) return;
    _currentPage = date;
    void(^updates)(void) = ^{
        [self reloadData];
    };
    if (animated) {
        [UIView transitionWithView:self duration:.2f options:UIViewAnimationOptionTransitionCrossDissolve animations:updates completion:nil];
    }else updates();
    if ([self.delegate respondsToSelector:@selector(calendarCurrentPageDidChange:)]) {
        [self.delegate calendarCurrentPageDidChange:self];
    }
}

-(void)setScope:(JobsOCCalendarScope)scope{
    if (_scope == scope) return;
    _scope = scope;
    [self reloadData];
    [self jobsNotifyBoundingRectIfNeeded:YES];
}

-(void)setPlaceholderType:(JobsOCCalendarPlaceholderType)placeholderType{
    if (_placeholderType == placeholderType) return;
    _placeholderType = placeholderType;
    [self reloadData];
}

-(void)selectDate:(nullable NSDate *)date{
    if (!date) return;
    NSDate *day = [self jobsStartOfDayByDate:date];
    if (![self jobsDateIsSelectable:day]) return;
    if (!self.allowsMultipleSelection) [self.jobsMutableSelectedDates removeAllObjects];
    __block BOOL exists = NO;
    [self.jobsMutableSelectedDates enumerateObjectsUsingBlock:^(NSDate *selectedDate, NSUInteger idx, BOOL *stop) {
        exists = [self jobsDate:selectedDate isSameDayAsDate:day];
        *stop = exists;
    }];
    if (!exists) [self.jobsMutableSelectedDates addObject:day];
    self.selectedDates = self.jobsMutableSelectedDates.copy;
    [self reloadData];
}

-(void)deselectDate:(nullable NSDate *)date{
    if (!date) return;
    NSDate *day = [self jobsStartOfDayByDate:date];
    NSIndexSet *indexes = [self.jobsMutableSelectedDates indexesOfObjectsPassingTest:^BOOL(NSDate *selectedDate, NSUInteger idx, BOOL *stop) {
        return [self jobsDate:selectedDate isSameDayAsDate:day];
    }];
    if (indexes.count) [self.jobsMutableSelectedDates removeObjectsAtIndexes:indexes];
    self.selectedDates = self.jobsMutableSelectedDates.copy;
    [self reloadData];
}

-(CGRect)boundingRectForScope:(JobsOCCalendarScope)scope{
    NSInteger rowCount = scope == JobsOCCalendarScopeWeek ? 1 : 6;
    CGFloat rowHeight = 42;
    CGFloat height = self.appearance.headerHeight + self.appearance.weekdayHeight + rowHeight * rowCount;
    return CGRectMake(0, 0, CGRectGetWidth(self.bounds), height);
}

-(void)jobsInvalidateCalendarLayout{
    if (!NSThread.isMainThread) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self jobsInvalidateCalendarLayout];
        });
        return;
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

-(void)jobsReloadDataSafely{
    if (!NSThread.isMainThread) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self jobsReloadDataSafely];
        });
        return;
    }
    [self reloadData];
}

-(void)jobsCommonInit{
    self.appearance = JobsOCCalendarAppearance.new;
    self.gregorian = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    self.gregorian.locale = NSLocale.currentLocale;
    self.gregorian.timeZone = NSTimeZone.localTimeZone;
    self.formatter = NSDateFormatter.new;
    self.formatter.calendar = self.gregorian;
    self.formatter.locale = NSLocale.currentLocale;
    self.jobsDayFormatter = NSDateFormatter.new;
    self.jobsDayFormatter.calendar = self.gregorian;
    self.jobsDayFormatter.locale = NSLocale.currentLocale;
    self.jobsDayFormatter.dateFormat = @"dd";
    self.today = [self jobsStartOfDayByDate:NSDate.date];
    _currentPage = [self jobsStartOfMonthByDate:self.today];
    self.minimumDate = [self jobsStartOfDayByDate:[NSDate distantPast]];
    self.maximumDate = [self jobsStartOfDayByDate:[NSDate distantFuture]];
    self.jobsMutableSelectedDates = NSMutableArray.array;
    self.selectedDates = NSArray.array;
    self.weekdayLabels = NSMutableArray.array;
    self.dayCells = NSMutableArray.array;
    self.jobsVisibleDates = NSArray.array;
    self.scrollEnabled = YES;
    self.adjustsBoundingRectWhenChangingMonths = YES;
    self.scope = JobsOCCalendarScopeMonth;
    self.placeholderType = JobsOCCalendarPlaceholderTypeFillSixRows;
    self.jobsAutomaticallyInvalidateLayoutOnBoundsChange = YES;
    self.jobsReloadDataAfterBoundsChange = YES;
    self.jobsLastStableBoundsSize = CGSizeZero;
    self.clipsToBounds = YES;
    [self jobsInstallSubviews];
    [self jobsInstallGestureRecognizers];
    [self reloadData];
}

-(void)jobsInstallSubviews{
    self.headerLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byTextAlignment(NSTextAlignmentCenter)
            .addOn(self);
    });
    for (NSInteger index = 0; index < 7; index++) {
        UILabel *label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextAlignment(NSTextAlignmentCenter)
                .addOn(self);
        });
        [self.weekdayLabels addObject:label];
    }
    for (NSInteger index = 0; index < 42; index++) {
        JobsOCCalendarDayCell *cell = [JobsOCCalendarDayCell.alloc initWithFrame:CGRectZero];
        cell
            .byAddTarget(self, @selector(jobsCellClickEvent:), UIControlEventTouchUpInside)
            .addOn(self);
        [self.dayCells addObject:cell];
    }
}

-(void)jobsInstallGestureRecognizers{
    UISwipeGestureRecognizer *left = [UISwipeGestureRecognizer.alloc initWithTarget:self action:@selector(jobsSwipeGestureEvent:)];
    left.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:left];
    UISwipeGestureRecognizer *right = [UISwipeGestureRecognizer.alloc initWithTarget:self action:@selector(jobsSwipeGestureEvent:)];
    right.direction = UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:right];
}

-(void)jobsSwipeGestureEvent:(UISwipeGestureRecognizer *)gesture{
    if (!self.scrollEnabled) return;
    if (gesture.direction == UISwipeGestureRecognizerDirectionLeft) {
        [self jobsMoveCurrentPageByMonthOffset:1];
    }else if (gesture.direction == UISwipeGestureRecognizerDirectionRight) {
        [self jobsMoveCurrentPageByMonthOffset:-1];
    }
}

-(void)jobsScheduleBoundsReloadIfNeeded{
    if (!NSThread.isMainThread) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self jobsScheduleBoundsReloadIfNeeded];
        });
        return;
    }
    if (self.jobsPendingBoundsReload) return;
    self.jobsPendingBoundsReload = YES;
    dispatch_async(dispatch_get_main_queue(), ^{
        self.jobsPendingBoundsReload = NO;
        [self reloadData];
    });
}

-(void)jobsReloadCalendarData{
    if ([self.dataSource respondsToSelector:@selector(minimumDateForCalendar:)]) {
        self.minimumDate = [self jobsStartOfDayByDate:[self.dataSource minimumDateForCalendar:self]];
    }else self.minimumDate = [self jobsStartOfDayByDate:[NSDate distantPast]];
    if ([self.dataSource respondsToSelector:@selector(maximumDateForCalendar:)]) {
        self.maximumDate = [self jobsStartOfDayByDate:[self.dataSource maximumDateForCalendar:self]];
    }else self.maximumDate = [self jobsStartOfDayByDate:[NSDate distantFuture]];
    [self jobsReloadHeader];
    [self jobsReloadWeekdayLabels];
    [self jobsReloadDayCells];
}

-(void)jobsReloadHeader{
    self.formatter.dateFormat = self.appearance.headerDateFormat;
    NSString *title = [self.formatter stringFromDate:self.currentPage];
    if (self.appearance.caseOptions & JobsOCCalendarCaseOptionsHeaderUsesUpperCase) title = title.uppercaseString;
    self.headerLabel
        .byText(title)
        .byFont(self.appearance.headerTitleFont)
        .byTextCor(self.appearance.headerTitleColor);
    self.headerLabel.textAlignment = self.appearance.headerTitleAlignment;
}

-(void)jobsReloadWeekdayLabels{
    NSDateFormatter *formatter = NSDateFormatter.new;
    formatter.locale = NSLocale.currentLocale;
    formatter.calendar = self.gregorian;
    NSArray<NSString *> *symbols = formatter.shortWeekdaySymbols;
    NSMutableArray<NSString *> *orderedSymbols = NSMutableArray.array;
    NSInteger startIndex = MAX(0, self.gregorian.firstWeekday - 1);
    for (NSInteger index = 0; index < 7; index++) {
        NSString *symbol = symbols[(startIndex + index) % 7];
        if (self.appearance.caseOptions & JobsOCCalendarCaseOptionsWeekdayUsesSingleUpperCase) {
            symbol = symbol.length ? [symbol substringToIndex:1].uppercaseString : symbol;
        }else if (self.appearance.caseOptions & JobsOCCalendarCaseOptionsWeekdayUsesUpperCase) {
            symbol = symbol.uppercaseString;
        }
        [orderedSymbols addObject:symbol];
    }
    [self.weekdayLabels enumerateObjectsUsingBlock:^(UILabel *label, NSUInteger idx, BOOL *stop) {
        label
            .byText(orderedSymbols[idx])
            .byFont(self.appearance.weekdayFont)
            .byTextCor(self.appearance.weekdayTextColor);
    }];
}

-(void)jobsReloadDayCells{
    NSDate *firstDayOfMonth = [self jobsStartOfMonthByDate:self.currentPage];
    NSInteger firstWeekday = [self.gregorian component:NSCalendarUnitWeekday fromDate:firstDayOfMonth];
    NSInteger offset = (firstWeekday - self.gregorian.firstWeekday + 7) % 7;
    NSDate *firstVisibleDate = [self jobsDateByAddingUnit:NSCalendarUnitDay value:-offset toDate:firstDayOfMonth];
    NSMutableArray<NSDate *> *visibleDates = NSMutableArray.array;
    for (NSInteger index = 0; index < 42; index++) {
        [visibleDates addObject:[self jobsDateByAddingUnit:NSCalendarUnitDay value:index toDate:firstVisibleDate]];
    }
    self.jobsVisibleDates = visibleDates.copy;
    [self.dayCells enumerateObjectsUsingBlock:^(JobsOCCalendarDayCell *cell, NSUInteger idx, BOOL *stop) {
        NSDate *date = self.jobsVisibleDates[idx];
        JobsOCCalendarMonthPosition position = [self jobsMonthPositionByDate:date];
        BOOL placeholder = position != JobsOCCalendarMonthPositionCurrent;
        BOOL hiddenByPlaceholder = self.placeholderType == JobsOCCalendarPlaceholderTypeNone && placeholder;
        NSString *title = nil;
        NSString *subtitle = nil;
        UIImage *image = nil;
        NSInteger eventsCount = 0;
        if (!hiddenByPlaceholder) {
            title = [self.dataSource respondsToSelector:@selector(calendar:titleForDate:)] ? [self.dataSource calendar:self titleForDate:date] : [self.jobsDayFormatter stringFromDate:date];
            subtitle = [self.dataSource respondsToSelector:@selector(calendar:subtitleForDate:)] ? [self.dataSource calendar:self subtitleForDate:date] : nil;
            image = [self.dataSource respondsToSelector:@selector(calendar:imageForDate:)] ? [self.dataSource calendar:self imageForDate:date] : nil;
            eventsCount = [self.dataSource respondsToSelector:@selector(calendar:numberOfEventsForDate:)] ? [self.dataSource calendar:self numberOfEventsForDate:date] : 0;
        }
        cell.date = date;
        BOOL selected = [self.selectedDates indexOfObjectPassingTest:^BOOL(NSDate *selectedDate, NSUInteger selectedIdx, BOOL *selectedStop) {
            return [self jobsDate:selectedDate isSameDayAsDate:date];
        }] != NSNotFound;
        BOOL isToday = self.today ? [self jobsDate:date isSameDayAsDate:self.today] : NO;
        BOOL enabled = !hiddenByPlaceholder && [self jobsDateIsSelectable:date];
        [cell jobsConfigureByTitle:title subtitle:subtitle image:image appearance:self.appearance monthPosition:position enabled:enabled selected:selected today:isToday eventsCount:eventsCount];
        if ([self.delegate respondsToSelector:@selector(calendar:willDisplayCell:forDate:atMonthPosition:)]) {
            [self.delegate calendar:self willDisplayCell:cell forDate:date atMonthPosition:position];
        }
    }];
}

-(void)jobsMoveCurrentPageByMonthOffset:(NSInteger)monthOffset{
    NSDate *date = [self jobsDateByAddingUnit:NSCalendarUnitMonth value:monthOffset toDate:self.currentPage];
    [self setCurrentPage:date animated:YES];
}

-(void)jobsCellClickEvent:(JobsOCCalendarDayCell *)cell{
    if (!cell.date || !cell.enabled) return;
    NSDate *date = [self jobsStartOfDayByDate:cell.date];
    JobsOCCalendarMonthPosition position = [self jobsMonthPositionByDate:date];
    BOOL selected = [self.selectedDates indexOfObjectPassingTest:^BOOL(NSDate *selectedDate, NSUInteger idx, BOOL *stop) {
        return [self jobsDate:selectedDate isSameDayAsDate:date];
    }] != NSNotFound;
    if (selected) {
        BOOL shouldDeselect = ![self.delegate respondsToSelector:@selector(calendar:shouldDeselectDate:atMonthPosition:)] || [self.delegate calendar:self shouldDeselectDate:date atMonthPosition:position];
        if (!shouldDeselect) return;
        [self deselectDate:date];
        if ([self.delegate respondsToSelector:@selector(calendar:didDeselectDate:atMonthPosition:)]) {
            [self.delegate calendar:self didDeselectDate:date atMonthPosition:position];
        };return;
    }
    BOOL shouldSelect = ![self.delegate respondsToSelector:@selector(calendar:shouldSelectDate:atMonthPosition:)] || [self.delegate calendar:self shouldSelectDate:date atMonthPosition:position];
    if (!shouldSelect) return;
    [self selectDate:date];
    if (position != JobsOCCalendarMonthPositionCurrent) [self setCurrentPage:date animated:YES];
    if ([self.delegate respondsToSelector:@selector(calendar:didSelectDate:atMonthPosition:)]) {
        [self.delegate calendar:self didSelectDate:date atMonthPosition:position];
    }
}

-(NSDate *)jobsStartOfDayByDate:(NSDate *)date{
    return [self.gregorian startOfDayForDate:date ?: NSDate.date];
}

-(NSDate *)jobsStartOfMonthByDate:(NSDate *)date{
    NSDateComponents *components = [self.gregorian components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:date ?: NSDate.date];
    components.day = 1;
    return [self.gregorian dateFromComponents:components];
}

-(NSDate *)jobsDateByAddingUnit:(NSCalendarUnit)unit value:(NSInteger)value toDate:(NSDate *)date{
    NSDateComponents *components = NSDateComponents.new;
    if (unit == NSCalendarUnitDay) components.day = value;
    if (unit == NSCalendarUnitMonth) components.month = value;
    return [self.gregorian dateByAddingComponents:components toDate:date options:0];
}

-(BOOL)jobsDate:(NSDate *)date isSameDayAsDate:(NSDate *)otherDate{
    if (!date || !otherDate) return NO;
    return [self.gregorian isDate:date inSameDayAsDate:otherDate];
}

-(BOOL)jobsDate:(NSDate *)date isSameMonthAsDate:(NSDate *)otherDate{
    if (!date || !otherDate) return NO;
    NSDateComponents *left = [self.gregorian components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:date];
    NSDateComponents *right = [self.gregorian components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:otherDate];
    return left.year == right.year && left.month == right.month;
}

-(BOOL)jobsDateIsSelectable:(NSDate *)date{
    if (!date) return NO;
    return [date compare:self.minimumDate] != NSOrderedAscending && [date compare:self.maximumDate] != NSOrderedDescending;
}

-(JobsOCCalendarMonthPosition)jobsMonthPositionByDate:(NSDate *)date{
    if ([self jobsDate:date isSameMonthAsDate:self.currentPage]) return JobsOCCalendarMonthPositionCurrent;
    return [date compare:self.currentPage] == NSOrderedAscending ? JobsOCCalendarMonthPositionPrevious : JobsOCCalendarMonthPositionNext;
}

-(void)jobsNotifyBoundingRectIfNeeded:(BOOL)animated{
    if (![self.delegate respondsToSelector:@selector(calendar:boundingRectWillChange:animated:)]) return;
    [self.delegate calendar:self boundingRectWillChange:[self boundingRectForScope:self.scope] animated:animated];
}

@end
