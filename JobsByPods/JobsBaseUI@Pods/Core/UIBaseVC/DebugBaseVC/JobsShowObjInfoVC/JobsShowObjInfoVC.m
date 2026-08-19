//
//  JobsShowObjInfoVC.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsShowObjInfoVC.h"

@interface JobsShowObjInfoVC ()
/// Data
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation JobsShowObjInfoVC
- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsShowObjInfoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        id<BaseProtocol> baseProtocolSelf = (id<BaseProtocol>)self;
        if ([baseProtocolSelf.requestParams isKindOfClass:UIViewModel.class]) {
            self.byViewModel((UIViewModel *)baseProtocolSelf.requestParams);
            if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr())
                    .byTextCor(JobsRedColor);
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byTextCor(JobsGreenColor)
                    .byText(@"用户信息展示(开发测试专用)".jobsTr())
                    .byFont(UIFontWeightRegularSize(16));
            })
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            // self.viewModel.bgImage = @"启动页SLOGAN".img;
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsShowObjInfoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.makeNavByAlpha(1);
        self.tableView.byShow(self);
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsShowObjInfoVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        self.tableView.mj_beginRefreshing_header();
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsShowObjInfoVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsShowObjInfoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
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

-(UIStatusBarStyle)preferredStatusBarStyle{
    JobsRetUIStatusBarStyleByVoidBlock action = ((JobsRetUIStatusBarStyleByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsShowObjInfoVC.class, @selector(jobsPreferredStatusBarStyle)))(self, @selector(jobsPreferredStatusBarStyle));
    return action ? action() : (UIStatusBarStyle){0};
}

-(JobsRetUIStatusBarStyleByVoidBlock _Nonnull)jobsPreferredStatusBarStyle{
    @jobs_weakify(self)
    return ^UIStatusBarStyle{
        @jobs_strongify(self)
        if (!self) return (UIStatusBarStyle){0};
        return UIStatusBarStyleDefault;
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    JobsRetNSIntegerByUITableViewBlock action = ((JobsRetNSIntegerByUITableViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsShowObjInfoVC.class, @selector(jobsNumberOfSectionsInTableView)))(self, @selector(jobsNumberOfSectionsInTableView));
    return action ? action(tableView) : (NSInteger){0};
}

-(JobsRetNSIntegerByUITableViewBlock _Nonnull)jobsNumberOfSectionsInTableView{
    @jobs_weakify(self)
    return ^NSInteger(UITableView * tableView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return 1;
    };
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsBaseTableViewCell.cellHeightByModel(self.dataMutArr[indexPath.row]);
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIPasteboard.generalPasteboard.byString(self.dataMutArr[indexPath.row].subTextModel.text);
    @"复制".jobsTr().add(self.dataMutArr[indexPath.row].textModel.text).add(@"成功".jobsTr()).toast();
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBaseTableViewCell *cell = ((id<UITableViewCellProtocol>)JobsBaseTableViewCell.cellStyleValue1ByTableView(tableView))
        .byIndexPath(indexPath)
        .jobsRichElementsTableViewCellBy(self.dataMutArr[indexPath.row])
        .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byNumberOfLines(0)
                .byTextCor(JobsBrownColor);
        })
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byTextCor(JobsLabelColor);
        })
        .JobsBlock1(^(id _Nullable data) {;
        });
    return cell;
}

-(void)tableView:(UITableView *)tableView
 willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.byAlpha(self.viewModel.isVisible);
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(BaseTableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeBaseTableViewByPlain(^(__kindof BaseTableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .dataLink(self)
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .bySeparatorColor(HEXCOLOR(0xEEEEEE))
                .byTableFooterView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                }))
                .byShowsVerticalScrollIndicator(NO)
                .byMJRefreshHeader(self.view.MJRefreshNormalHeaderBy(self.refreshHeaderDataBy(^id _Nullable(id  _Nullable data) {
                    @jobs_strongify(self)
                    NSObject.feedbackGenerator(nil);/// 震动反馈
                    if (self.dataMutArr.count) [self.dataMutArr removeAllObjects];
                    /// 装载数据
                    if ([self.viewModel.requestParams isKindOfClass:NSObject.class]) {
                        NSObject *requestParams = (NSObject *)self.viewModel.requestParams;
                        NSArray <NSString *>*propertyList = requestParams.propertyList();
                        for (NSString *propertyInfo in propertyList) {
                            NSString *propertyName = [propertyInfo componentsSeparatedByString:@":"].firstObject;
                            id value = requestParams.valueForKey(propertyName);
                            NSString *subText = [value isKindOfClass:NSString.class] ? value : (value ? [value description] : @"nil");
                            self.dataMutArr.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                                viewModel.textModel.byText(propertyName);
                                viewModel.subTextModel.byText(subText);
                                viewModel.textModel.byTextCor(JobsBlueColor)
                                                   .byFont(UIFontSystemFontOfSize(10))
                                                   .bySubTextCor(JobsRedColor)
                                                   .bySubFont(UIFontSystemFontOfSize(8));
                            }));
                        }
                    }
                    self.viewModel.byIsVisible(YES);
                    if (self.dataMutArr.count) {
                        self->_tableView.endRefreshing(self.dataMutArr.count);
                    }else{
                        self->_tableView.endRefreshingWithNoMoreData(self.dataMutArr.count);
                    }
                    /// 在reloadData后做的操作，因为reloadData刷新UI是在主线程上，那么就在主线程上等待
                    @jobs_weakify(self)
                    dispatch_async(dispatch_get_main_queue(), ^(){
                        @jobs_strongify(self)
                        [self.tableView alphaAnimWithSortingType:(SortingType)SortingType_Positive
                                                  animationBlock:nil
                                                 completionBlock:nil];
                    });return nil;
                })))
                .byMJRefreshFooter(self.view.MJRefreshFooterBy(self.refreshFooterDataBy(^id _Nullable(id  _Nullable data) {
                    @jobs_strongify(self)
                    self->_tableView.endRefreshing(self.dataMutArr.count);
                    return nil;
                })))
                .byBgColor(JobsSecondarySystemBackgroundColor);
            self.view.addSubview(tableView);
            [self fullScreenConstraintTargetView:tableView topViewOffset:0];
        });
    };return _tableView;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
    };return _dataMutArr;
}

@end
