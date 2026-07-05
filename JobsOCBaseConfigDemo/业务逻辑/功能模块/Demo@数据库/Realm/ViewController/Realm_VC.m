//
//  Realm_VC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "Realm_VC.h"

@interface Realm_VC ()<UITableViewDelegate,UITableViewDataSource>
/// Data
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation Realm_VC

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
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byTextCor(HEXCOLOR(0x3D4A58));
            data.byText(data.attributedTitle.string);
            data.byFont(UIFontWeightRegularSize(18));
        })
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byBgImage(@"新首页的底图".img)
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.makeNavByAlpha(1);
    self.tableView.byShow(self);
    [self reloadRealmDemoData];
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
    return JobsWidth(56);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return self.dataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JobsBaseTableViewCell *cell = ((id<UITableViewCellProtocol>)JobsBaseTableViewCell.cellStyleValue1ByTableView(tableView))
        .byIndexPath(indexPath)
        .jobsRichElementsTableViewCellBy(self.dataMutArr[indexPath.row])
        .byAccessoryType(UITableViewCellAccessoryNone)
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byNumberOfLines(1);
        })
        .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byNumberOfLines(1);
        });
    return cell;
}
#pragma mark —— Demo 数据刷新
-(void)reloadRealmDemoData{
    NSArray <User_Realm *>*users = self.fetchAllUsers;
    if (users.count == 0) {
        /// 插入数据
        [self insertUserWithName:@"Alice" age:25];
        [self insertUserWithName:@"Bob" age:30];
        users = self.fetchAllUsers;
    }
    /// 更新用户
    if (users.count > 0) {
        User_Realm *user = users.firstObject;
        [self updateUser:user newName:@"Alice Smith" newAge:26];
    }
    /// 删除用户
    if (users.count > 1) {
        User_Realm *user = users[1];
        [self deleteUser:user];
    }
    /// 获取更新后的用户列表
    users = self.fetchAllUsers;
    [self reloadDataMutArrByUsers:users];
    [self.tableView reloadData];
    JobsLog(@"Updated Users: %@", users);
}

-(void)reloadDataMutArrByUsers:(NSArray <User_Realm *>*_Nullable)users{
    [self.dataMutArr removeAllObjects];
    for (User_Realm *user in users) {
        self.dataMutArr.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.textModel.byText(user.name ? : @"-")
                          .byTextCor(HEXCOLOR(0x3D4A58))
                          .byFont(UIFontWeightRegularSize(16));
            data.subTextModel.byText([NSString stringWithFormat:@"%@：%ld".tr,@"年龄".tr,(long)user.age])
                              .byTextCor(HEXCOLOR(0x757575))
                              .byFont(UIFontWeightRegularSize(14));
        }));
    }
}
#pragma mark —— Realm 的增删查改
/// 插入数据
- (void)insertUserWithName:(NSString *)name age:(NSInteger)age {
    RLMRealm *realm = RLMRealm.defaultRealm;
    [realm transactionWithBlock:^{
        User_Realm *newUser = User_Realm.new;
        newUser.name = name;
        newUser.age = age;
        [realm addObject:newUser];
    }];
}
/// 查询数据
- (NSArray *)fetchAllUsers {
    RLMResults<User_Realm *> *results = User_Realm.allObjects;
    NSMutableArray *users = NSMutableArray.array;
    for (User_Realm *user in results) {
        [users addObject:user];
    };return users;
}
/// 更新/改正 数据
- (void)updateUser:(User_Realm *)user
           newName:(NSString *)newName
            newAge:(NSInteger)newAge {
    RLMRealm *realm = RLMRealm.defaultRealm;
    [realm transactionWithBlock:^{
        user.name = newName;
        user.age = newAge;
    }];
}
/// 删除数据
- (void)deleteUser:(User_Realm *)user {
    RLMRealm *realm = RLMRealm.defaultRealm;
    [realm transactionWithBlock:^{
        [realm deleteObject:user];
    }];
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
