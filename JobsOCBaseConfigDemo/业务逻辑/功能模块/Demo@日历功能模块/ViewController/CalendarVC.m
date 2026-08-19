//
//  CalendarVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CalendarVC.h"

@interface CalendarVC ()
/// UI
Prop_strong()JobsOCCalendar *calendar;
Prop_strong()NSDateFormatter *calendarDayFormatter;
Prop_strong()NSDateFormatter *calendarHolidayFormatter;
Prop_strong()NSDictionary<NSString *, NSString *> *calendarHolidayDic;
Prop_strong()NSDate *minimumCalendarDate;
Prop_strong()NSDate *maximumCalendarDate;

@end

@implementation CalendarVC
-(void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

-(instancetype)init{
    if (self = [super init]) {
        JobsLog(@"");
    };return self;
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CalendarVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        if ([self.requestParams isKindOfClass:UIViewModel.class]) {
            self.byViewModel((UIViewModel *)self.requestParams);
            if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.bySetupNavigationBarHidden(YES);
        {
            self.viewModel
                .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                    data.byText(@"返回".jobsTr());
                })
                .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                    data
                        .byTextCor(JobsLabelColor)
                        .byText(@"日历功能".jobsTr())
                        .byFont(UIFontWeightRegularSize(16));
                })
                // 使用原则：底图有 + 底色有 = 优先使用底图数据
                // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
                // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
                .byBgCor(JobsSystemBackgroundColor)
                //    self.viewModel.bgImage = @"启动页SLOGAN".img;
                .byNavBgCor(JobsSystemBackgroundColor)
                .byNavBgImage(nil);
        }
        /// 装填用户信息数据
        /// json生成器 ： https://www.site24x7.com/zhcn/tools/json-generator.html
        self.saveUserInfo(JobsUserModel.byData(@"UserData".readLocalFileWithName()));// 保存全局唯一的一份用户档案
    };
}

-(void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CalendarVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.makeNavByAlpha(1);
        self.calendar.jobsReloadDataSafely();
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CalendarVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
        [self.calendar setNeedsLayout];
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CalendarVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CalendarVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CalendarVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
    };
}
#pragma mark —— JobsOCCalendarDataSource
-(nullable NSString *)calendar:(JobsOCCalendar *)calendar
                  titleForDate:(NSDate *)date{
    return [self.calendarDayFormatter stringFromDate:date];
}

-(nullable NSString *)calendar:(JobsOCCalendar *)calendar
               subtitleForDate:(NSDate *)date{
    // 格式化日期，获取具体的日期字符串
    NSString *dateString = [self.calendarHolidayFormatter stringFromDate:date];
    return self.calendarHolidayDic[dateString];// 根据日期字符串查找节假日名称
}

-(NSDate *)minimumDateForCalendar:(JobsOCCalendar *)calendar{
    JobsRetNSDateByJobsOCCalendarBlock action = ((JobsRetNSDateByJobsOCCalendarBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CalendarVC.class, @selector(jobsMinimumDateForCalendar)))(self, @selector(jobsMinimumDateForCalendar));
    return action ? action(calendar) : nil;
}

-(JobsRetNSDateByJobsOCCalendarBlock _Nonnull)jobsMinimumDateForCalendar{
    @jobs_weakify(self)
    return ^NSDate *(JobsOCCalendar * calendar){
        @jobs_strongify(self)
        if (!self) return nil;
        return self.minimumCalendarDate; // 一年前
    };
}

-(NSDate *)maximumDateForCalendar:(JobsOCCalendar *)calendar{
    JobsRetNSDateByJobsOCCalendarBlock action = ((JobsRetNSDateByJobsOCCalendarBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CalendarVC.class, @selector(jobsMaximumDateForCalendar)))(self, @selector(jobsMaximumDateForCalendar));
    return action ? action(calendar) : nil;
}

-(JobsRetNSDateByJobsOCCalendarBlock _Nonnull)jobsMaximumDateForCalendar{
    @jobs_weakify(self)
    return ^NSDate *(JobsOCCalendar * calendar){
        @jobs_strongify(self)
        if (!self) return nil;
        //    return NSDate.date;
            return self.maximumCalendarDate; // 一年后
    };
}

#pragma mark —— JobsOCCalendarDelegate
/// 选中日期
-(void)calendar:(JobsOCCalendar *)calendar
  didSelectDate:(NSDate *)date
atMonthPosition:(JobsOCCalendarMonthPosition)monthPosition{
    if(self.objBlock) self.objBlock(date);
}

-(void)calendar:(JobsOCCalendar *)calendar
didDeselectDate:(NSDate *)date
atMonthPosition:(JobsOCCalendarMonthPosition)monthPosition{
    if(self.objBlock) self.objBlock(date);
}

-(void)calendar:(JobsOCCalendar *)calendar
boundingRectWillChange:(CGRect)bounds
       animated:(BOOL)animated{
    [calendar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(bounds.size.height));
    }];
    [calendar setNeedsLayout];
    [self.view setNeedsLayout];
}

-(void)calendar:(JobsOCCalendar *)calendar
willDisplayCell:(JobsOCCalendarDayCell *)cell
        forDate:(NSDate *)date
atMonthPosition:(JobsOCCalendarMonthPosition)monthPosition{
}

-(void)calendarCurrentPageDidChange:(JobsOCCalendar *)calendar{
    jobsByJobsOCCalendarBlock action = ((jobsByJobsOCCalendarBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CalendarVC.class, @selector(jobsCalendarCurrentPageDidChange)))(self, @selector(jobsCalendarCurrentPageDidChange));
    if (action) action(calendar);
}

-(jobsByJobsOCCalendarBlock _Nonnull)jobsCalendarCurrentPageDidChange{
    @jobs_weakify(self)
    return ^(JobsOCCalendar * calendar){
        @jobs_strongify(self)
        if (!self) return;
    };
}
#pragma mark —— lazyLoad
-(JobsOCCalendar *)calendar{
    if(!_calendar){
        @jobs_weakify(self)
        _calendar = jobsMakeJobsOCCalendar(^(__kindof JobsOCCalendar * _Nullable calendar) {
            @jobs_strongify(self)
            calendar
                .byDataSource(self)
                .byDelegate(self)
                .byAllowsMultipleSelection(YES)
                .bySwipeToChooseEnabled(YES)
                .byJobsAutomaticallyInvalidateLayoutOnBoundsChange(YES)
                .byJobsReloadDataAfterBoundsChange(YES)
                .byAppearanceBlock(^(__kindof JobsOCCalendarAppearance * _Nullable appearance) {
                    appearance
                        .byHeaderMinimumDissolvedAlpha(0)
                        .byHeaderDateFormat(@"yyyy"
                            .add(@"年".jobsTr())
                            .add(@"MM")
                            .add(@"月".jobsTr()))
                        .byCaseOptions(JobsOCCalendarCaseOptionsHeaderUsesUpperCase)
                        .byHeaderTitleFont(UIFontSystemFontOfSize(JobsWidth(20)))
                        .byHeaderTitleColor(JobsLabelColor);
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    [self make:make topOffset:10];
                    make.left.equalTo(self.view).offset(JobsWidth(12));
                    make.right.equalTo(self.view).offset(-JobsWidth(12));
                    make.height.mas_equalTo(JobsWidth(340));
                })
                .byBgColor(JobsSecondarySystemBackgroundColor);
        });
    };return _calendar;
}

-(NSDateFormatter *)calendarDayFormatter{
    if(!_calendarDayFormatter){
        _calendarDayFormatter = jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable dateFormatter){
            dateFormatter.byDateFormat(@"dd");
        });
    };return _calendarDayFormatter;
}

-(NSDateFormatter *)calendarHolidayFormatter{
    if(!_calendarHolidayFormatter){
        _calendarHolidayFormatter = jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable dateFormatter) {
            dateFormatter.byDateFormat(@"dd/MM");
        });
    };return _calendarHolidayFormatter;
}

-(NSDictionary<NSString *,NSString *> *)calendarHolidayDic{
    if(!_calendarHolidayDic){
        _calendarHolidayDic = @{
            // 中国节假日
            @"01/01": @"新年".jobsTr(),     // 元旦
            @"22/01": @"春节".jobsTr(),     // 春节 (农历日期需特殊处理)
            @"05/04": @"清明节".jobsTr(),   // 清明节
            @"01/05": @"劳动节".jobsTr(),   // 劳动节
            @"04/06": @"端午节".jobsTr(),   // 端午节 (农历日期需特殊处理)
            @"01/10": @"国庆节".jobsTr(),   // 国庆节
            @"13/09": @"中秋节".jobsTr(),   // 中秋节 (农历日期需特殊处理)
            // 菲律宾节假日
            @"25/12": @"圣诞节".jobsTr(),   // 圣诞节
            @"30/11": @"博尼法西奥日".jobsTr(), // 博尼法西奥日
            @"12/06": @"独立日".jobsTr(),   // 独立日
            @"09/04": @"勇士日".jobsTr(),   // 勇士日
            @"01/11": @"万灵节".jobsTr(),   // 万灵节
            @"30/12": @"黎刹日".jobsTr()    // 黎刹日
        };
    };return _calendarHolidayDic;
}

-(NSDate *)minimumCalendarDate{
    if(!_minimumCalendarDate){
        _minimumCalendarDate = [NSCalendar.currentCalendar startOfDayForDate:[NSDate dateWithTimeIntervalSinceNow:-365*24*60*60]];
    };return _minimumCalendarDate;
}

-(NSDate *)maximumCalendarDate{
    if(!_maximumCalendarDate){
        _maximumCalendarDate = [NSCalendar.currentCalendar startOfDayForDate:[NSDate dateWithTimeIntervalSinceNow:365*24*60*60]];
    };return _maximumCalendarDate;
}
@synthesize backBtnModel = _backBtnModel;
-(UIButtonModel *)backBtnModel{
    if(!_backBtnModel){
        @jobs_weakify(self)
        _backBtnModel = self.jobsMakeBackBtnModel()
            .byTitleFont(bayonRegular(JobsWidth(18)))
            .byTitleCor(JobsRedColor)
            .bySelectedTitleCor(JobsWhiteColor)
            .byLongPressGestureEventBlock(^id(__kindof UIButton *x) {
                JobsLog(@"按钮的长按事件触发");
                return nil;
            })
            .byClickEventBlock(^id(BaseButton *x){
                @jobs_strongify(self)
                self.jobsBackBtnClickEvent(x);
                self.popToRootVCBy(YES);
                return nil;
            });
    };return _backBtnModel;
}

@end
