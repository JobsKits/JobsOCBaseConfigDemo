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

-(jobsByVoidBlock _Nonnull)jobsCommonInit;
-(jobsByVoidBlock _Nonnull)jobsScheduleBoundsReloadIfNeeded;
-(jobsByVoidBlock _Nonnull)jobsInstallSubviews;
-(jobsByVoidBlock _Nonnull)jobsInstallGestureRecognizers;
-(jobsByVoidBlock _Nonnull)jobsReloadCalendarData;
-(jobsByVoidBlock _Nonnull)jobsReloadHeader;
-(jobsByVoidBlock _Nonnull)jobsReloadWeekdayLabels;
-(jobsByVoidBlock _Nonnull)jobsReloadDayCells;
-(jobsByNSIntegerBlock _Nonnull)jobsMoveCurrentPageByMonthOffset;
-(jobsByJobsOCCalendarDayCellBlock _Nonnull)jobsCellClickEvent;
-(JobsRetDateByDateBlock _Nonnull)jobsStartOfDayByDate;
-(JobsRetDateByDateBlock _Nonnull)jobsStartOfMonthByDate;
-(NSDate *)jobsDateByAddingUnit:(NSCalendarUnit)unit value:(NSInteger)value toDate:(NSDate *)date;
-(BOOL)jobsDate:(NSDate *)date isSameDayAsDate:(NSDate *)otherDate;
-(BOOL)jobsDate:(NSDate *)date isSameMonthAsDate:(NSDate *)otherDate;
-(JobsRetBOOLByDateBlock _Nonnull)jobsDateIsSelectable;
-(JobsRetJobsOCCalendarMonthPositionByNSDateBlock _Nonnull)jobsMonthPositionByDate;
-(jobsByBOOLBlock _Nonnull)jobsNotifyBoundingRectIfNeeded;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCCalendar
@interface JobsOCCalendar (JobsPropertyDSLSetterAutogen_fc9ebfb48d)
-(void)setAppearance:(JobsOCCalendarAppearance * _Nullable)data;
-(void)setDayCells:(NSMutableArray<JobsOCCalendarDayCell *> * _Nullable)data;
-(void)setJobsDayFormatter:(NSDateFormatter * _Nullable)data;
-(void)setJobsLastStableBoundsSize:(CGSize)data;
-(void)setJobsMutableSelectedDates:(NSMutableArray<NSDate *> * _Nullable)data;
-(void)setJobsPendingBoundsReload:(BOOL)data;
-(void)setJobsVisibleDates:(NSArray<NSDate *> * _Nullable)data;
-(void)setMaximumDate:(NSDate * _Nullable)data;
-(void)setMinimumDate:(NSDate * _Nullable)data;
-(void)setSelectedDates:(NSArray<NSDate *> * _Nullable)data;
-(void)setWeekdayLabels:(NSMutableArray<UILabel *> * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCCalendar

@implementation JobsOCCalendar

#define JobsOCCalendarObjectDSL(_method_, _property_, _block_type_, _input_type_) \
-(_block_type_ _Nonnull)_method_{ \
    @jobs_weakify(self) \
    return ^__kindof JobsOCCalendar *_Nullable(_input_type_ _Nullable value){ \
        @jobs_strongify(self) \
        self._property_ = value; \
        return self; \
    }; \
}

#define JobsOCCalendarValueDSL(_method_, _property_, _block_type_, _input_type_) \
-(_block_type_ _Nonnull)_method_{ \
    @jobs_weakify(self) \
    return ^__kindof JobsOCCalendar *_Nullable(_input_type_ value){ \
        @jobs_strongify(self) \
        self._property_ = value; \
        return self; \
    }; \
}

JobsOCCalendarObjectDSL(byGregorian, gregorian, JobsRetJobsOCCalendarByCalendarBlock, NSCalendar *)
JobsOCCalendarObjectDSL(byFormatter, formatter, JobsRetJobsOCCalendarByDateFormatterBlock, NSDateFormatter *)
JobsOCCalendarObjectDSL(byToday, today, JobsRetJobsOCCalendarByDateBlock, NSDate *)
JobsOCCalendarObjectDSL(byCurrentPage, currentPage, JobsRetJobsOCCalendarByDateBlock, NSDate *)
JobsOCCalendarValueDSL(byAllowsMultipleSelection, allowsMultipleSelection, JobsRetJobsOCCalendarByBOOLBlock, BOOL)
JobsOCCalendarValueDSL(bySwipeToChooseEnabled, swipeToChooseEnabled, JobsRetJobsOCCalendarByBOOLBlock, BOOL)
JobsOCCalendarValueDSL(byAdjustsBoundingRectWhenChangingMonths, adjustsBoundingRectWhenChangingMonths, JobsRetJobsOCCalendarByBOOLBlock, BOOL)
JobsOCCalendarValueDSL(byScope, scope, JobsRetJobsOCCalendarByScopeBlock, JobsOCCalendarScope)
JobsOCCalendarValueDSL(byPlaceholderType, placeholderType, JobsRetJobsOCCalendarByPlaceholderTypeBlock, JobsOCCalendarPlaceholderType)
JobsOCCalendarValueDSL(byJobsAutomaticallyInvalidateLayoutOnBoundsChange, jobsAutomaticallyInvalidateLayoutOnBoundsChange, JobsRetJobsOCCalendarByBOOLBlock, BOOL)
JobsOCCalendarValueDSL(byJobsReloadDataAfterBoundsChange, jobsReloadDataAfterBoundsChange, JobsRetJobsOCCalendarByBOOLBlock, BOOL)

#undef JobsOCCalendarObjectDSL
#undef JobsOCCalendarValueDSL

-(JobsRetJobsOCCalendarByBOOLBlock _Nonnull)byScrollEnabled{
    @jobs_weakify(self)
    return ^__kindof JobsOCCalendar *_Nullable(BOOL scrollEnabled){
        @jobs_strongify(self)
        self.scrollEnabled = scrollEnabled;
        return self;
    };
}
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

-(JobsRetJobsOCCalendarByJobsOCCalendarAppearanceBlockBlock _Nonnull)byAppearanceBlock{
    @jobs_weakify(self)
    return ^__kindof JobsOCCalendar *_Nullable(jobsByJobsOCCalendarAppearanceBlock _Nullable block) {
        @jobs_strongify(self)
        if (block) block(self.appearance);
        return self;
    };
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.jobsCommonInit();
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        self.jobsCommonInit();
    };return self;
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCCalendar.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
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
        self.headerLabel.byFrame(CGRectOffset(CGRectMake(0, 0, width, headerHeight), self.appearance.headerTitleOffset.x, self.appearance.headerTitleOffset.y));
        [self.weekdayLabels enumerateObjectsUsingBlock:^(UILabel *label, NSUInteger idx, BOOL *stop) {
            label.byFrame(CGRectMake(columnWidth * idx, headerHeight, columnWidth, weekdayHeight));
        }];
        [self.dayCells enumerateObjectsUsingBlock:^(JobsOCCalendarDayCell *cell, NSUInteger idx, BOOL *stop) {
            NSInteger row = idx / 7;
            NSInteger column = idx % 7;
            cell
                .byHidden(row >= rowCount)
                .byFrame(CGRectMake(columnWidth * column, gridY + rowHeight * row, columnWidth, rowHeight));
        }];
        if (self.jobsAutomaticallyInvalidateLayoutOnBoundsChange && sizeChanged) {
            self.byJobsLastStableBoundsSize(boundsSize);
            if (self.jobsReloadDataAfterBoundsChange) self.jobsScheduleBoundsReloadIfNeeded();
        }
    };
}

-(void)reloadData{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCCalendar.class, @selector(jobsReloadData)))(self, @selector(jobsReloadData));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsReloadData{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!NSThread.isMainThread) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self reloadData];
            });
            return;
        }
        self.jobsReloadCalendarData();
        [self setNeedsLayout];
    };
}

-(void)setCurrentPage:(NSDate *)currentPage{
    [self setCurrentPage:currentPage animated:NO];
}

-(void)setCurrentPage:(NSDate *)currentPage animated:(BOOL)animated{
    if (!currentPage) return;
    NSDate *date = self.jobsStartOfMonthByDate(currentPage);
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
    self.jobsNotifyBoundingRectIfNeeded(YES);
}

-(void)setPlaceholderType:(JobsOCCalendarPlaceholderType)placeholderType{
    if (_placeholderType == placeholderType) return;
    _placeholderType = placeholderType;
    [self reloadData];
}

-(jobsByDateBlock _Nonnull)selectDate{
    @jobs_weakify(self)
    return ^(NSDate *date){
        @jobs_strongify(self)
        if (!self || !date) return;
        NSDate *day = self.jobsStartOfDayByDate(date);
        if (!self.jobsDateIsSelectable(day)) return;
        if (!self.allowsMultipleSelection) [self.jobsMutableSelectedDates removeAllObjects];
        __block BOOL exists = NO;
        [self.jobsMutableSelectedDates enumerateObjectsUsingBlock:^(NSDate *selectedDate, NSUInteger idx, BOOL *stop) {
            exists = [self jobsDate:selectedDate isSameDayAsDate:day];
            *stop = exists;
        }];
        if (!exists) [self.jobsMutableSelectedDates addObject:day];
        self.bySelectedDates(self.jobsMutableSelectedDates.copy);
        [self reloadData];
    };
}

-(jobsByDateBlock _Nonnull)deselectDate{
    @jobs_weakify(self)
    return ^(NSDate *date){
        @jobs_strongify(self)
        if (!self || !date) return;
        NSDate *day = self.jobsStartOfDayByDate(date);
        NSIndexSet *indexes = [self.jobsMutableSelectedDates indexesOfObjectsPassingTest:^BOOL(NSDate *selectedDate, NSUInteger idx, BOOL *stop) {
            return [self jobsDate:selectedDate isSameDayAsDate:day];
        }];
        if (indexes.count) [self.jobsMutableSelectedDates removeObjectsAtIndexes:indexes];
        self.bySelectedDates(self.jobsMutableSelectedDates.copy);
        [self reloadData];
    };
}

-(JobsRetCGRectByJobsOCCalendarScopeBlock _Nonnull)boundingRectForScope{
    @jobs_weakify(self)
    return ^CGRect(JobsOCCalendarScope scope){
        @jobs_strongify(self)
        if (!self) return (CGRect){0};
        NSInteger rowCount = scope == JobsOCCalendarScopeWeek ? 1 : 6;
        CGFloat rowHeight = 42;
        CGFloat height = self.appearance.headerHeight + self.appearance.weekdayHeight + rowHeight * rowCount;
        return CGRectMake(0, 0, CGRectGetWidth(self.bounds), height);
    };
}

-(jobsByVoidBlock _Nonnull)jobsInvalidateCalendarLayout{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!NSThread.isMainThread) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.jobsInvalidateCalendarLayout();
            });
            return;
        }
        [self setNeedsLayout];
        [self layoutIfNeeded];
    };
}

-(jobsByVoidBlock _Nonnull)jobsReloadDataSafely{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!NSThread.isMainThread) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.jobsReloadDataSafely();
            });
            return;
        }
        [self reloadData];
    };
}

-(jobsByVoidBlock _Nonnull)jobsCommonInit{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byAppearance(JobsOCCalendarAppearance.new);
        self.byGregorian([NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian]);
        self.gregorian.byLocale(NSLocale.currentLocale);
        self.gregorian.byTimeZone(NSTimeZone.localTimeZone);
        self.byFormatter(jobsMakeDateFormatter(^(NSDateFormatter *object){}));
        self.formatter.byCalendar(self.gregorian);
        self.formatter.byLocale(NSLocale.currentLocale);
        self.byJobsDayFormatter(jobsMakeDateFormatter(^(NSDateFormatter *object){}));
        self.jobsDayFormatter.byCalendar(self.gregorian);
        self.jobsDayFormatter.byLocale(NSLocale.currentLocale);
        self.jobsDayFormatter.byDateFormat(@"dd");
        self.byToday(self.jobsStartOfDayByDate(NSDate.date));
        _currentPage = self.jobsStartOfMonthByDate(self.today);
        self.byMinimumDate(self.jobsStartOfDayByDate([NSDate distantPast]));
        self.byMaximumDate(self.jobsStartOfDayByDate([NSDate distantFuture]));
        self.byJobsMutableSelectedDates(NSMutableArray.array);
        self.bySelectedDates(NSArray.array);
        self.byWeekdayLabels(NSMutableArray.array);
        self.byDayCells(NSMutableArray.array);
        self.byJobsVisibleDates(NSArray.array);
        self.byScrollEnabled(YES);
        self.byAdjustsBoundingRectWhenChangingMonths(YES);
        self.byScope(JobsOCCalendarScopeMonth);
        self.byPlaceholderType(JobsOCCalendarPlaceholderTypeFillSixRows);
        self.byJobsAutomaticallyInvalidateLayoutOnBoundsChange(YES);
        self.byJobsReloadDataAfterBoundsChange(YES);
        self.byJobsLastStableBoundsSize(CGSizeZero);
        self.byClipsToBounds(YES);
        self.jobsInstallSubviews();
        self.jobsInstallGestureRecognizers();
        [self reloadData];
    };
}

-(jobsByVoidBlock _Nonnull)jobsInstallSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
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
                .onJobsTap(^(__kindof UIControl * _Nullable control) {
                    weak_self.jobsCellClickEvent((JobsOCCalendarDayCell *)control);
                })
                .addOn(self);
            [self.dayCells addObject:cell];
        }
    };
}

-(jobsByVoidBlock _Nonnull)jobsInstallGestureRecognizers{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UISwipeGestureRecognizer *left = [UISwipeGestureRecognizer.alloc initWithTarget:self action:@selector(jobsSwipeGestureEvent:)];
        left.byDirection(UISwipeGestureRecognizerDirectionLeft);
        [self addGestureRecognizer:left];
        UISwipeGestureRecognizer *right = [UISwipeGestureRecognizer.alloc initWithTarget:self action:@selector(jobsSwipeGestureEvent:)];
        right.byDirection(UISwipeGestureRecognizerDirectionRight);
        [self addGestureRecognizer:right];
    };
}

-(void)jobsSwipeGestureEvent:(UISwipeGestureRecognizer *)gesture{
    jobsBySwipeGestureRecognizerBlock action = ((jobsBySwipeGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCCalendar.class, @selector(jobsJobsSwipeGestureEvent)))(self, @selector(jobsJobsSwipeGestureEvent));
    if (action) action(gesture);
}

-(jobsBySwipeGestureRecognizerBlock _Nonnull)jobsJobsSwipeGestureEvent{
    @jobs_weakify(self)
    return ^(UISwipeGestureRecognizer * gesture){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.scrollEnabled) return;
        if (gesture.direction == UISwipeGestureRecognizerDirectionLeft) {
            self.jobsMoveCurrentPageByMonthOffset(1);
        }else if (gesture.direction == UISwipeGestureRecognizerDirectionRight) {
            self.jobsMoveCurrentPageByMonthOffset(-1);
        }
    };
}

-(jobsByVoidBlock _Nonnull)jobsScheduleBoundsReloadIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!NSThread.isMainThread) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.jobsScheduleBoundsReloadIfNeeded();
            });
            return;
        }
        if (self.jobsPendingBoundsReload) return;
        self.byJobsPendingBoundsReload(YES);
        dispatch_async(dispatch_get_main_queue(), ^{
            self.byJobsPendingBoundsReload(NO);
            [self reloadData];
        });
    };
}

-(jobsByVoidBlock _Nonnull)jobsReloadCalendarData{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if ([self.dataSource respondsToSelector:@selector(minimumDateForCalendar:)]) {
            self.byMinimumDate(self.jobsStartOfDayByDate([self.dataSource minimumDateForCalendar:self]));
        }else self.minimumDate = self.jobsStartOfDayByDate([NSDate distantPast]);
        if ([self.dataSource respondsToSelector:@selector(maximumDateForCalendar:)]) {
            self.byMaximumDate(self.jobsStartOfDayByDate([self.dataSource maximumDateForCalendar:self]));
        }else self.maximumDate = self.jobsStartOfDayByDate([NSDate distantFuture]);
        self.jobsReloadHeader();
        self.jobsReloadWeekdayLabels();
        self.jobsReloadDayCells();
    };
}

-(jobsByVoidBlock _Nonnull)jobsReloadHeader{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.formatter.byDateFormat(self.appearance.headerDateFormat);
        NSString *title = [self.formatter stringFromDate:self.currentPage];
        if (self.appearance.caseOptions & JobsOCCalendarCaseOptionsHeaderUsesUpperCase) title = title.uppercaseString;
        self.headerLabel
            .byText(title)
            .byFont(self.appearance.headerTitleFont)
            .byTextCor(self.appearance.headerTitleColor);
        self.headerLabel.byTextAlignment(self.appearance.headerTitleAlignment);
    };
}

-(jobsByVoidBlock _Nonnull)jobsReloadWeekdayLabels{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSDateFormatter *formatter = jobsMakeDateFormatter(^(NSDateFormatter *object){});
        formatter.byLocale(NSLocale.currentLocale);
        formatter.byCalendar(self.gregorian);
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
    };
}

-(jobsByVoidBlock _Nonnull)jobsReloadDayCells{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSDate *firstDayOfMonth = self.jobsStartOfMonthByDate(self.currentPage);
        NSInteger firstWeekday = [self.gregorian component:NSCalendarUnitWeekday fromDate:firstDayOfMonth];
        NSInteger offset = (firstWeekday - self.gregorian.firstWeekday + 7) % 7;
        NSDate *firstVisibleDate = [self jobsDateByAddingUnit:NSCalendarUnitDay value:-offset toDate:firstDayOfMonth];
        NSMutableArray<NSDate *> *visibleDates = NSMutableArray.array;
        for (NSInteger index = 0; index < 42; index++) {
            [visibleDates addObject:[self jobsDateByAddingUnit:NSCalendarUnitDay value:index toDate:firstVisibleDate]];
        }
        self.byJobsVisibleDates(visibleDates.copy);
        [self.dayCells enumerateObjectsUsingBlock:^(JobsOCCalendarDayCell *cell, NSUInteger idx, BOOL *stop) {
            NSDate *date = self.jobsVisibleDates[idx];
            JobsOCCalendarMonthPosition position = self.jobsMonthPositionByDate(date);
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
            cell.byDate(date);
            BOOL selected = [self.selectedDates indexOfObjectPassingTest:^BOOL(NSDate *selectedDate, NSUInteger selectedIdx, BOOL *selectedStop) {
                return [self jobsDate:selectedDate isSameDayAsDate:date];
            }] != NSNotFound;
            BOOL isToday = self.today ? [self jobsDate:date isSameDayAsDate:self.today] : NO;
            BOOL enabled = !hiddenByPlaceholder && self.jobsDateIsSelectable(date);
            [cell jobsConfigureByTitle:title subtitle:subtitle image:image appearance:self.appearance monthPosition:position enabled:enabled selected:selected today:isToday eventsCount:eventsCount];
            if ([self.delegate respondsToSelector:@selector(calendar:willDisplayCell:forDate:atMonthPosition:)]) {
                [self.delegate calendar:self willDisplayCell:cell forDate:date atMonthPosition:position];
            }
        }];
    };
}

-(jobsByNSIntegerBlock _Nonnull)jobsMoveCurrentPageByMonthOffset{
    @jobs_weakify(self)
    return ^(NSInteger monthOffset){
        @jobs_strongify(self)
        if (!self) return;
        NSDate *date = [self jobsDateByAddingUnit:NSCalendarUnitMonth value:monthOffset toDate:self.currentPage];
        [self setCurrentPage:date animated:YES];
    };
}

-(jobsByJobsOCCalendarDayCellBlock _Nonnull)jobsCellClickEvent{
    @jobs_weakify(self)
    return ^(JobsOCCalendarDayCell * cell){
        @jobs_strongify(self)
        if (!self) return;
        if (!cell.date || !cell.enabled) return;
        NSDate *date = self.jobsStartOfDayByDate(cell.date);
        JobsOCCalendarMonthPosition position = self.jobsMonthPositionByDate(date);
        BOOL selected = [self.selectedDates indexOfObjectPassingTest:^BOOL(NSDate *selectedDate, NSUInteger idx, BOOL *stop) {
            return [self jobsDate:selectedDate isSameDayAsDate:date];
        }] != NSNotFound;
        if (selected) {
            BOOL shouldDeselect = ![self.delegate respondsToSelector:@selector(calendar:shouldDeselectDate:atMonthPosition:)] || [self.delegate calendar:self shouldDeselectDate:date atMonthPosition:position];
            if (!shouldDeselect) return;
            self.deselectDate(date);
            if ([self.delegate respondsToSelector:@selector(calendar:didDeselectDate:atMonthPosition:)]) {
                [self.delegate calendar:self didDeselectDate:date atMonthPosition:position];
            };return;
        }
        BOOL shouldSelect = ![self.delegate respondsToSelector:@selector(calendar:shouldSelectDate:atMonthPosition:)] || [self.delegate calendar:self shouldSelectDate:date atMonthPosition:position];
        if (!shouldSelect) return;
        self.selectDate(date);
        if (position != JobsOCCalendarMonthPositionCurrent) [self setCurrentPage:date animated:YES];
        if ([self.delegate respondsToSelector:@selector(calendar:didSelectDate:atMonthPosition:)]) {
            [self.delegate calendar:self didSelectDate:date atMonthPosition:position];
        }
    };
}

-(JobsRetDateByDateBlock _Nonnull)jobsStartOfDayByDate{
    @jobs_weakify(self)
    return ^NSDate *(NSDate * date){
        @jobs_strongify(self)
        if (!self) return nil;
        return [self.gregorian startOfDayForDate:date ?: NSDate.date];
    };
}

-(JobsRetDateByDateBlock _Nonnull)jobsStartOfMonthByDate{
    @jobs_weakify(self)
    return ^NSDate *(NSDate * date){
        @jobs_strongify(self)
        if (!self) return nil;
        NSDateComponents *components = [self.gregorian components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:date ?: NSDate.date];
        components.byDay(1);
        return [self.gregorian dateFromComponents:components];
    };
}

-(NSDate *)jobsDateByAddingUnit:(NSCalendarUnit)unit value:(NSInteger)value toDate:(NSDate *)date{
    NSDateComponents *components = jobsMakeDateComponents(^(NSDateComponents *object){});
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

-(JobsRetBOOLByDateBlock _Nonnull)jobsDateIsSelectable{
    @jobs_weakify(self)
    return ^BOOL(NSDate * date){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        if (!date) return NO;
        return [date compare:self.minimumDate] != NSOrderedAscending && [date compare:self.maximumDate] != NSOrderedDescending;
    };
}

-(JobsRetJobsOCCalendarMonthPositionByNSDateBlock _Nonnull)jobsMonthPositionByDate{
    @jobs_weakify(self)
    return ^JobsOCCalendarMonthPosition(NSDate * date){
        @jobs_strongify(self)
        if (!self) return (JobsOCCalendarMonthPosition){0};
        if ([self jobsDate:date isSameMonthAsDate:self.currentPage]) return JobsOCCalendarMonthPositionCurrent;
        return [date compare:self.currentPage] == NSOrderedAscending ? JobsOCCalendarMonthPositionPrevious : JobsOCCalendarMonthPositionNext;
    };
}

-(jobsByBOOLBlock _Nonnull)jobsNotifyBoundingRectIfNeeded{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        if (![self.delegate respondsToSelector:@selector(calendar:boundingRectWillChange:animated:)]) return;
        [self.delegate calendar:self boundingRectWillChange:self.boundingRectForScope(self.scope) animated:animated];
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCCalendar
-(JobsRetJobsOCCalendarByBOOLBlock _Nonnull)byJobsPendingBoundsReload{
    @jobs_weakify(self)
    return ^__kindof JobsOCCalendar * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setJobsPendingBoundsReload:data];
        return self;
    };
}

-(JobsRetJobsOCCalendarByCGSizeBlock _Nonnull)byJobsLastStableBoundsSize{
    @jobs_weakify(self)
    return ^__kindof JobsOCCalendar * _Nullable(CGSize data){
        @jobs_strongify(self)
        [self setJobsLastStableBoundsSize:data];
        return self;
    };
}

-(JobsRetJobsOCCalendarByDateBlock _Nonnull)byMaximumDate{
    @jobs_weakify(self)
    return ^__kindof JobsOCCalendar * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        [self setMaximumDate:data];
        return self;
    };
}

-(JobsRetJobsOCCalendarByDateBlock _Nonnull)byMinimumDate{
    @jobs_weakify(self)
    return ^__kindof JobsOCCalendar * _Nullable(NSDate * _Nullable data){
        @jobs_strongify(self)
        [self setMinimumDate:data];
        return self;
    };
}

-(JobsRetJobsOCCalendarByDateFormatterBlock _Nonnull)byJobsDayFormatter{
    @jobs_weakify(self)
    return ^__kindof JobsOCCalendar * _Nullable(NSDateFormatter * _Nullable data){
        @jobs_strongify(self)
        [self setJobsDayFormatter:data];
        return self;
    };
}

-(JobsRetJobsOCCalendarByJobsOCCalendarAppearanceBlock _Nonnull)byAppearance{
    @jobs_weakify(self)
    return ^__kindof JobsOCCalendar * _Nullable(JobsOCCalendarAppearance * _Nullable data){
        @jobs_strongify(self)
        [self setAppearance:data];
        return self;
    };
}

-(JobsRetJobsOCCalendarByNSArrayNSDateBlock _Nonnull)byJobsVisibleDates{
    @jobs_weakify(self)
    return ^__kindof JobsOCCalendar * _Nullable(NSArray<NSDate *> * _Nullable data){
        @jobs_strongify(self)
        [self setJobsVisibleDates:data];
        return self;
    };
}

-(JobsRetJobsOCCalendarByNSArrayNSDateBlock _Nonnull)bySelectedDates{
    @jobs_weakify(self)
    return ^__kindof JobsOCCalendar * _Nullable(NSArray<NSDate *> * _Nullable data){
        @jobs_strongify(self)
        [self setSelectedDates:data];
        return self;
    };
}

-(JobsRetJobsOCCalendarByNSMutableArrayJobsOCCalendarDayCellBlock _Nonnull)byDayCells{
    @jobs_weakify(self)
    return ^__kindof JobsOCCalendar * _Nullable(NSMutableArray<JobsOCCalendarDayCell *> * _Nullable data){
        @jobs_strongify(self)
        [self setDayCells:data];
        return self;
    };
}

-(JobsRetJobsOCCalendarByNSMutableArrayNSDateBlock _Nonnull)byJobsMutableSelectedDates{
    @jobs_weakify(self)
    return ^__kindof JobsOCCalendar * _Nullable(NSMutableArray<NSDate *> * _Nullable data){
        @jobs_strongify(self)
        [self setJobsMutableSelectedDates:data];
        return self;
    };
}

-(JobsRetJobsOCCalendarByNSMutableArrayUILabelBlock _Nonnull)byWeekdayLabels{
    @jobs_weakify(self)
    return ^__kindof JobsOCCalendar * _Nullable(NSMutableArray<UILabel *> * _Nullable data){
        @jobs_strongify(self)
        [self setWeekdayLabels:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCCalendar
@end
