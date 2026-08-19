//
//  JobsCalenderView.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsCalenderView.h"

@interface JobsCalenderView ()
/// UI
Prop_strong()FSCalendar *calendar;
/// Data

@end

@implementation JobsCalenderView
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsSecondarySystemBackgroundColor);
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCalenderView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
    };
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCalenderView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        /// 内部指定圆切角
        [self appointCornerCutToCircleByRoundingCorners:UIRectCornerAllCorners
                                            cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
    };
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.byBgColor(JobsSecondarySystemBackgroundColor);
    };return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.byViewModel(model);
        [self.calendar reloadData];
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
            return CGSizeMake(JobsWidth(450), JobsWidth(340));
        }else{
            return CGSizeMake(JobsWidth(340), JobsWidth(450));
        }
    };
}
#pragma mark —— FSCalendarDataSource
-(nullable NSString *)calendar:(FSCalendar *)calendar
                  titleForDate:(NSDate *)date{
    return [jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable dateFormatter){
        dateFormatter.byDateFormat(@"dd");
    }) stringFromDate:date];
}

-(nullable NSString *)calendar:(FSCalendar *)calendar
               subtitleForDate:(NSDate *)date {
    // 格式化日期，获取具体的日期字符串
    NSString *dateString = [jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable dateFormatter) {
        dateFormatter.byDateFormat(@"dd/MM");
    }) stringFromDate:date];
    if (dateString.containsString(@"01/01")) {
        return @"新年".jobsTr(); // 元旦
    } else if (dateString.containsString(@"22/01")) {
        return @"春节".jobsTr(); // 春节（需要农历日期处理，这里使用2024年的示例日期）
    } else if (dateString.containsString(@"05/04")) {
        return @"清明节".jobsTr(); // 清明节
    } else if (dateString.containsString(@"01/05")) {
        return @"劳动节".jobsTr(); // 劳动节
    } else if (dateString.containsString(@"04/06")) {
        return @"端午节".jobsTr(); // 端午节（需要农历日期处理）
    } else if (dateString.containsString(@"13/09")) {
        return @"中秋节".jobsTr(); // 中秋节（需要农历日期处理）
    } else if (dateString.containsString(@"01/10")) {
        return @"国庆节".jobsTr(); // 国庆节
    } else if (dateString.containsString(@"25/12")) {
        return @"圣诞节".jobsTr(); // 圣诞节
    } else if (dateString.containsString(@"30/11")) {
        return @"博尼法西奥日".jobsTr(); // 博尼法西奥日
    } else if (dateString.containsString(@"12/06")) {
        return @"独立日".jobsTr(); // 独立日
    } else if (dateString.containsString(@"09/04")) {
        return @"勇士日".jobsTr(); // 勇士日
    } else if (dateString.containsString(@"01/11")) {
        return @"万灵节".jobsTr(); // 万灵节
    } else if (dateString.containsString(@"30/12")) {
        return @"黎刹日".jobsTr(); // 黎刹日
    } else return nil; // 其他日期没有副标题
}

//-(nullable UIImage *)calendar:(FSCalendar *)calendar imageForDate:(NSDate *)date{
//
//}

-(NSDate *)minimumDateForCalendar:(FSCalendar *)calendar{
    JobsRetNSDateByFSCalendarBlock action = ((JobsRetNSDateByFSCalendarBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCalenderView.class, @selector(jobsMinimumDateForCalendar)))(self, @selector(jobsMinimumDateForCalendar));
    return action ? action(calendar) : nil;
}

-(JobsRetNSDateByFSCalendarBlock _Nonnull)jobsMinimumDateForCalendar{
    @jobs_weakify(self)
    return ^NSDate *(FSCalendar * calendar){
        @jobs_strongify(self)
        if (!self) return nil;
        return NSDate.dateSince(-平年一年的秒数);/// 一年前
    };
}

-(NSDate *)maximumDateForCalendar:(FSCalendar *)calendar{
    JobsRetNSDateByFSCalendarBlock action = ((JobsRetNSDateByFSCalendarBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCalenderView.class, @selector(jobsMaximumDateForCalendar)))(self, @selector(jobsMaximumDateForCalendar));
    return action ? action(calendar) : nil;
}

-(JobsRetNSDateByFSCalendarBlock _Nonnull)jobsMaximumDateForCalendar{
    @jobs_weakify(self)
    return ^NSDate *(FSCalendar * calendar){
        @jobs_strongify(self)
        if (!self) return nil;
        return NSDate.dateSince(平年一年的秒数);/// 一年后
    };
}

//-(__kindof FSCalendarCell *)calendar:(FSCalendar *)calendar
//                         cellForDate:(NSDate *)date
//                     atMonthPosition:(FSCalendarMonthPosition)position{
//
//}

//-(NSInteger)calendar:(FSCalendar *)calendar
//numberOfEventsForDate:(NSDate *)date{
//
//}
#pragma mark —— FSCalendarDelegate
//-(BOOL)calendar:(FSCalendar *)calendar
//shouldSelectDate:(NSDate *)date
//atMonthPosition:(FSCalendarMonthPosition)monthPosition{
//
//}
/// 选中日期
-(void)calendar:(FSCalendar *)calendar
  didSelectDate:(NSDate *)date
atMonthPosition:(FSCalendarMonthPosition)monthPosition{
    if(self.objBlock) self.objBlock(date);
}

//-(BOOL)calendar:(FSCalendar *)calendar
//shouldDeselectDate:(NSDate *)date
//atMonthPosition:(FSCalendarMonthPosition)monthPosition{
//
//}

-(void)calendar:(FSCalendar *)calendar
didDeselectDate:(NSDate *)date
atMonthPosition:(FSCalendarMonthPosition)monthPosition{
//    if(self.objBlock) self.objBlock(date);
}

-(void)calendar:(FSCalendar *)calendar
boundingRectWillChange:(CGRect)bounds
       animated:(BOOL)animated{
    [calendar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(bounds.size.height));
        // Do other updates
    }];[self layoutIfNeeded];
}

-(void)calendar:(FSCalendar *)calendar
willDisplayCell:(FSCalendarCell *)cell
        forDate:(NSDate *)date
atMonthPosition:(FSCalendarMonthPosition)monthPosition{
}

-(void)calendarCurrentPageDidChange:(FSCalendar *)calendar{
    jobsByFSCalendarBlock action = ((jobsByFSCalendarBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCalenderView.class, @selector(jobsCalendarCurrentPageDidChange)))(self, @selector(jobsCalendarCurrentPageDidChange));
    if (action) action(calendar);
}

-(jobsByFSCalendarBlock _Nonnull)jobsCalendarCurrentPageDidChange{
    @jobs_weakify(self)
    return ^(FSCalendar * calendar){
        @jobs_strongify(self)
        if (!self) return;
    };
}
#pragma mark —— lazyLoad
-(FSCalendar *)calendar{
    if(!_calendar){
        @jobs_weakify(self)
        _calendar = jobsMakeFSCalendar(^(__kindof FSCalendar * _Nullable calendar) {
            @jobs_strongify(self)
            calendar
                .byDataSource(self)
                .byDelegate(self)
                .byAllowsMultipleSelection(YES)
                .bySwipeToChooseGestureBlock(^(__kindof UILongPressGestureRecognizer * _Nullable data) {
                    data.byEnabled(YES);
                })
                .byCalendarHeaderViewBlock(^(__kindof FSCalendarHeaderView * _Nullable data) {
                    data.byBgColor(JobsSecondarySystemBackgroundColor);
                })
                .byAppearanceBlock(^(__kindof FSCalendarAppearance * _Nullable data) {
                    data
                        .byHeaderMinimumDissolvedAlpha(1)
                        .byHeaderDateFormat(@"yyyy年MM月")
                        .byCaseOptions(FSCalendarCaseOptionsHeaderUsesUpperCase)
                        .byHeaderTitleFont(pingFangHKBold(JobsWidth(20)))
                        .byHeaderTitleColor(JobsLabelColor);
                })
                .byFrame(CGRectMake(0, 0, self.width, self.height))
                .addOn(self)
                .byAdd(^(MASConstraintMaker *_Nonnull make){
                    make.edges.equalTo(self);
                });
        });
    };return _calendar;
}

@end
