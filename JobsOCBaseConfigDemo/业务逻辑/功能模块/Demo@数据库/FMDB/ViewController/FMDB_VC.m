//
//  FMDB_VC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2024年7月6日，星期六.
//

#import "FMDB_VC.h"

@interface FMDB_VC ()<UITableViewDelegate,UITableViewDataSource>
/// Data
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation FMDB_VC

- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel.backBtnTitleModel.text = @"返回".tr;
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedTitle.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.bgImage = @"新首页的底图".img;
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = @"导航栏左侧底图".img;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.makeNavByAlpha(1);
    self.tableView.byShow(self);
    [self reloadFMDBDemoData];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    JobsLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    JobsLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return JobsWidth(72);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return self.dataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JobsBaseTableViewCell *cell = ((id<UITableViewCellProtocol>)JobsBaseTableViewCell.cellStyleSubtitleByTableView(tableView))
        .byIndexPath(indexPath)
        .jobsRichElementsTableViewCellBy(self.dataMutArr[indexPath.row])
        .byAccessoryType(UITableViewCellAccessoryNone)
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byNumberOfLines(1);
        })
        .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byNumberOfLines(0);
        });
    return cell;
}
#pragma mark —— Demo 数据刷新
-(void)reloadFMDBDemoData{
    JobsFMDBMgr *dbManager = JobsFMDBMgr.sharedManager;
    NSArray <NSDictionary *>*users = [dbManager fetchAllUsers];
    for (NSDictionary *user in users) {
        [dbManager deleteUserWithID:[user[@"id"] integerValue]];
    }
    [self.dataMutArr removeAllObjects];
    /// 增
    [dbManager insertUserWithName:@"Alice" age:25];
    [dbManager insertUserWithName:@"Bob" age:30];
    users = [dbManager fetchAllUsers];
    [self appendDemoStepTitle:@"增：INSERT"
                       detail:@"插入 Alice(25)、Bob(30) 两条用户数据"];
    /// 查
    [self appendDemoStepTitle:@"查：SELECT"
                       detail:[NSString stringWithFormat:@"当前表数据：%@",[self userListTextByUsers:users]]];
    /// 改
    if (users.count > 0) {
        NSDictionary *user = users.firstObject;
        NSInteger userID = [user[@"id"] integerValue];
        [dbManager updateUserWithID:userID newName:@"Alice Smith" newAge:26];
        [self appendDemoStepTitle:@"改：UPDATE"
                           detail:[NSString stringWithFormat:@"#%ld Alice(25) -> Alice Smith(26)",(long)userID]];
    }
    /// 删
    if (users.count > 1) {
        NSDictionary *user = users[1];
        NSInteger userID = [user[@"id"] integerValue];
        NSString *name = user[@"name"] ? : @"-";
        NSNumber *age = user[@"age"] ? : @0;
        [dbManager deleteUserWithID:userID];
        [self appendDemoStepTitle:@"删：DELETE"
                           detail:[NSString stringWithFormat:@"删除 #%ld %@(%@)",(long)userID,name,age]];
    }
    /// 再查
    users = [dbManager fetchAllUsers];
    [self appendDemoStepTitle:@"查：最终结果"
                       detail:[NSString stringWithFormat:@"剩余数据：%@",[self userListTextByUsers:users]]];
    [self appendUserRowsByUsers:users];
    [self.tableView reloadData];
    JobsLog(@"FMDB Demo Users: %@",users);
}

-(void)appendUserRowsByUsers:(NSArray <NSDictionary *>*_Nullable)users{
    for (NSDictionary *user in users) {
        [self appendDemoStepTitle:[NSString stringWithFormat:@"当前记录 #%@",user[@"id"] ? : @0]
                           detail:[NSString stringWithFormat:@"name = %@，age = %@",user[@"name"] ? : @"-",user[@"age"] ? : @0]];
    }
}

-(void)appendDemoStepTitle:(NSString *)title
                    detail:(NSString *)detail{
    self.dataMutArr.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
        data.textModel.byText(title)
                      .byTextCor(HEXCOLOR(0x3D4A58))
                      .byFont(UIFontWeightMediumSize(16));
        data.subTextModel.byText(detail)
                         .byTextCor(HEXCOLOR(0x757575))
                         .byFont(UIFontWeightRegularSize(13));
    }));
}

-(NSString *)userListTextByUsers:(NSArray <NSDictionary *>*_Nullable)users{
    if (users.count == 0) return @"空表";
    NSMutableArray <NSString *>*items = NSMutableArray.array;
    for (NSDictionary *user in users) {
        [items addObject:[NSString stringWithFormat:@"#%@ %@(%@)",user[@"id"] ? : @0,user[@"name"] ? : @"-",user[@"age"] ? : @0]];
    };return [items componentsJoinedByString:@"，"];
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
                    /// 占位，去掉空行分割线
                }))
                .byShowsVerticalScrollIndicator(NO)
                .byBgColor(JobsWhiteColor);
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
