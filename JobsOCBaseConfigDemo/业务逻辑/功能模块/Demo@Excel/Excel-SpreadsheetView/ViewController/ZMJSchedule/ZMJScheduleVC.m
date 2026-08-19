//
//  ZMJScheduleVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ZMJScheduleVC.h"

@interface ZMJScheduleVC ()

Prop_strong()SpreadsheetView *spreadsheetView;
Prop_strong()NSMutableArray<NSString *> *dates;
Prop_strong()NSMutableArray<NSString *> *days;
Prop_strong()NSMutableArray<UIColor *>  *dayColors;
Prop_strong()NSMutableArray<NSString *> *hours;
Prop_strong()NSMutableArray<NSArray<NSString *> *> *datas;
Prop_strong()UIColor *evenRowColor; //偶数
Prop_strong()UIColor *oddRowColor;  //奇数

@end

@implementation ZMJScheduleVC
- (void)dealloc{
    JobsNotificationCenter.remove(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ZMJScheduleVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byTextCor(JobsLabelColor)
                    .byText(@"ZMJSchedule".jobsTr())
                    .byFont(UIFontWeightRegularSize(18));
            })
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;// self.gk_navBackgroundImage 和 self.bgImageView
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byBgImage(@"新首页的底图".img)
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1));// self.gk_navBackgroundColor 和 self.view.backgroundColor        .byNavBgImage(@"导航栏左侧底图".img);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ZMJScheduleVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
            [super viewDidLoad];
            self.view.byBgColor(JobsSystemBackgroundColor);
            self.makeNavByAlpha(1);
        //    [self.bgImageView removeFromSuperview];
            self.spreadsheetView.byAlpha(1);
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ZMJScheduleVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
            [super viewWillAppear:animated];
        //    [self updateStatusBarCor:JobsOrangeColor];/// 在具体子类实现，不要写在父类
    };
}

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ZMJScheduleVC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewWillLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillLayoutSubviews];
        JobsLog(@"");
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ZMJScheduleVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
        JobsLog(@"");
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ZMJScheduleVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ZMJScheduleVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
            [super viewWillDisappear:animated];
        //    [self restoreStatusBarCor];
    };
}

-(void)viewDidDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ZMJScheduleVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidDisappear:animated];
    };
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
}
#pragma mark —— SpreadsheetViewDataSource
-(JobsRetNSIntegerBySpreadsheetViewBlock _Nonnull)numberOfColumns{
    @jobs_weakify(self)
    return ^NSInteger(SpreadsheetView * spreadsheetView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return 1 + self.days.count;
    };
}

-(JobsRetNSIntegerBySpreadsheetViewBlock _Nonnull)numberOfRows{
    @jobs_weakify(self)
    return ^NSInteger(SpreadsheetView * spreadsheetView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return 2 + self.hours.count;
    };
}

- (CGFloat)spreadsheetView:(SpreadsheetView *)spreadsheetView widthForColumn:(NSInteger)column {
    if (0 == column) {
        return 70.f;
    } else {
        return 120.f;
    }
}

- (CGFloat)spreadsheetView:(SpreadsheetView *)spreadsheetView heightForRow:(NSInteger)row {
    if (0 == row) {
        return 24;
    } else if (1 == row) {
        return 32;
    } else {
        return 40;
    }
}

-(JobsRetNSIntegerBySpreadsheetViewBlock _Nonnull)frozenColumns{
    @jobs_weakify(self)
    return ^NSInteger(SpreadsheetView * spreadsheetView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return 1;
    };
}

-(JobsRetNSIntegerBySpreadsheetViewBlock _Nonnull)frozenRows{
    @jobs_weakify(self)
    return ^NSInteger(SpreadsheetView * spreadsheetView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return 2;
    };
}

- (ZMJCell *)spreadsheetView:(SpreadsheetView *)spreadsheetView cellForItemAt:(NSIndexPath *)indexPath {
    if ((indexPath.column >= 1 && indexPath.row <= self.dates.count + 1) &&
        (indexPath.row    == 0)){
        DateCell *cell  = (DateCell *)[spreadsheetView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(DateCell.class)
                                                                                 forIndexPath:indexPath];
        cell.label.byText(self.dates[indexPath.column - 1]);
        return cell;
    } else if ((indexPath.column >= 1 && indexPath.column <= self.days.count + 1) &&
               (indexPath.row    == 1)){
        DayTitleCell *cell = (DayTitleCell *)[spreadsheetView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(DayTitleCell.class)
                                                                                        forIndexPath:indexPath];
        cell.label.byText(self.days[indexPath.column - 1]);
        cell.label.byTextCor(self.dayColors[indexPath.column - 1]);
        return cell;
    } else if ((indexPath.column == 0) &&
               (indexPath.row    == 1)){
        TimeTitleCell *cell = (TimeTitleCell *)[spreadsheetView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(TimeTitleCell.class)
                                                                                          forIndexPath:indexPath];
        cell.label.byText(@"TIME".jobsTr());
        return cell;
    } else if ((indexPath.column == 0) &&
               (indexPath.row    >= 2 && indexPath.row <= self.hours.count + 2)){
        TimeCell *cell = (TimeCell *)[spreadsheetView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(TimeCell.class)
                                                                                forIndexPath:indexPath];
        cell.label.byText(self.hours[indexPath.row - 2]);
        cell.byBgColor(indexPath.row % 2 == 0 ? self.evenRowColor : self.oddRowColor);
        return cell;
    } else if ((indexPath.column >= 1 && indexPath.column <= self.days.count + 1) &&
               (indexPath.row    >= 2 && indexPath.row <= self.hours.count + 2)){
        ScheduleCell *cell = (ScheduleCell *)[spreadsheetView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(ScheduleCell.class)
                                                                                        forIndexPath:indexPath];
        NSString *text = self.datas[indexPath.column - 1][indexPath.row - 2];
        if (text && text.length != 0) {
            cell.label.byText(text);
            UIColor *color  = self.dayColors[indexPath.column - 1];
            cell.label.byTextCor(color);
            cell.color           = color.colorWithAlphaComponentBy(.2f);
            cell.borders.top     = [BorderStyle.alloc initWithStyle:BorderStyle_solid width:2 color:color];
            cell.borders.bottom  = [BorderStyle.alloc initWithStyle:BorderStyle_solid width:2 color:color];
        } else {
            cell.label.byText(nil);
            cell.color          = indexPath.row % 2 == 0 ? self.evenRowColor : self.oddRowColor;
            cell.borders.top    = BorderStyle.borderStyleNone;
            cell.borders.bottom = BorderStyle.borderStyleNone;
        };return cell;
    };return nil;
}
#pragma mark —— SpreadsheetViewDelegate
- (void)spreadsheetView:(SpreadsheetView *)spreadsheetView
        didSelectItemAt:(NSIndexPath *)indexPath {
    JobsLog(@"Selected: (Row: %ld, Column: %ld", (long)indexPath.row, (long)indexPath.column);
}
#pragma mark —— lazyLoad
-(NSMutableArray<NSString *> *)dates{
    if(!_dates){
        _dates = NSMutableArray.array;
        _dates
            .add(@"7/10/2017")
            .add(@"7/11/2017")
            .add(@"7/12/2017")
            .add(@"7/13/2017")
            .add(@"7/14/2017")
            .add(@"7/15/2017")
            .add(@"7/16/2017");
    };return _dates;
}

-(NSMutableArray<NSString *> *)days{
    if(!_days){
        _days = NSMutableArray.array;
        _days
            .add(@"MONDAY")
            .add(@"TUESDAY")
            .add(@"WEDNSDAY")
            .add(@"THURSDAY")
            .add(@"FRIDAY")
            .add(@"SATURDAY")
            .add(@"SUNDAY");
    };return _days;
}

-(NSMutableArray<UIColor *> *)dayColors{
    if(!_dayColors){
        _dayColors = NSMutableArray.array;
        _dayColors
            .add([UIColor colorWithRed:0.918 green:0.224 blue:0.153 alpha:1])
            .add([UIColor colorWithRed:0.106 green:0.541 blue:0.827 alpha:1])
            .add([UIColor colorWithRed:0.200 green:0.620 blue:0.565 alpha:1])
            .add([UIColor colorWithRed:0.953 green:0.498 blue:0.098 alpha:1])
            .add([UIColor colorWithRed:0.400 green:0.584 blue:0.141 alpha:1])
            .add([UIColor colorWithRed:0.835 green:0.655 blue:0.051 alpha:1])
            .add([UIColor colorWithRed:0.153 green:0.569 blue:0.835 alpha:1]);
    };return _dayColors;
}

-(NSMutableArray<NSString *> *)hours{
    if(!_hours){
        _hours = NSMutableArray.array;
        _hours
            .add(@"6:00 AM")
            .add(@"7:00 AM")
            .add(@"8:00 AM")
            .add(@"9:00 AM")
            .add(@"10:00 AM")
            .add(@"11:00 AM")
            .add(@"12:00 AM")
            .add(@"13:00 AM")
            .add(@"14:00 AM")
            .add(@"15:00 AM")
            .add(@"16:00 AM")
            .add(@"17:00 AM")
            .add(@"18:00 AM")
            .add(@"19:00 AM")
            .add(@"20:00 AM")
            .add(@"21:00 AM")
            .add(@"22:00 AM")
            .add(@"23:00 AM")
            .add(@"24:00 AM");
    };return _hours;
}

-(UIColor *)evenRowColor{
    if(!_evenRowColor){
        _evenRowColor = [UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1];
    };return _evenRowColor;
}

-(UIColor *)oddRowColor{
    if(!_oddRowColor){
        _oddRowColor = JobsWhiteColor;
    };return _oddRowColor;
}

-(NSMutableArray<NSArray<NSString *> *> *)datas{
    if(!_datas){
        _datas = NSMutableArray.array;
        _datas
            .add(@[@"", @"", @"Take medicine", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"Movie with family", @"", @"", @"", @"", @"", @""])
            .add(@[@"Leave for cabin", @"", @"", @"", @"", @"Lunch with Tim", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @""])
            .add(@[@"", @"", @"", @"", @"Downtown parade", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @""])
            .add(@[@"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"Fireworks show", @"", @"", @""])
            .add(@[@"", @"", @"", @"", @"", @"Family BBQ", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @""])
            .add(@[@"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @""])
            .add(@[@"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"Return home", @"", @"", @"", @"", @"", @""]);
    };return _datas;
}

-(SpreadsheetView *)spreadsheetView{
    if(!_spreadsheetView){
        _spreadsheetView = SpreadsheetView.new;
        _spreadsheetView.delegate = self;
        _spreadsheetView.dataSource = self;
        _spreadsheetView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _spreadsheetView.contentInset = UIEdgeInsetsMake(4, 0, 4, 0);
        _spreadsheetView.intercellSpacing = CGSizeMake(4, 1);
        _spreadsheetView.gridStyle = GridStyle.borderStyleNone;
        [_spreadsheetView registerClass:DateCell.class forCellWithReuseIdentifier:NSStringFromClass(DateCell.class)];
        [_spreadsheetView registerClass:TimeTitleCell.class forCellWithReuseIdentifier:NSStringFromClass(TimeTitleCell.class)];
        [_spreadsheetView registerClass:TimeCell.class forCellWithReuseIdentifier:NSStringFromClass(TimeCell.class)];
        [_spreadsheetView registerClass:DayTitleCell.class forCellWithReuseIdentifier:NSStringFromClass(DayTitleCell.class)];
        [_spreadsheetView registerClass:ScheduleCell.class forCellWithReuseIdentifier:NSStringFromClass(ScheduleCell.class)];
        _spreadsheetView.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            [self make:make topOffset:10];
        });
//        if (@available(iOS 11.0, *)) {
//            _spreadsheetView.frame = self.view.safeAreaLayoutGuide.layoutFrame;
//        } else {
//            _spreadsheetView.frame = self.view.bounds;
//        }
        [_spreadsheetView flashScrollIndicators];
    };return _spreadsheetView;
}

@end
