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
Prop_strong()NSMutableArray <User_Realm *>*userMutArr;
Prop_strong()UIView *editorView;
Prop_strong()UITextField *nameTextField;
Prop_strong()UITextField *ageTextField;
Prop_strong()BaseButton *insertBtn;
Prop_strong()BaseButton *updateBtn;
Prop_strong()BaseButton *deleteBtn;
Prop_strong()BaseButton *queryBtn;
Prop_assign()NSInteger selectedUserIndex;

-(void)seedRealmDemoDataIfNeeded;
-(void)reloadRealmDemoData;
-(void)reloadDataMutArrByUsers:(NSArray <User_Realm *>*_Nullable)users;
-(NSString *)realmDemoNameInput;
-(NSInteger)realmDemoAgeInput;
-(User_Realm *_Nullable)selectedRealmDemoUser;
-(void)insertRealmDemoUser;
-(void)updateRealmDemoUser;
-(void)deleteRealmDemoUser;
-(BaseButton *)realmDemoButtonByTitle:(NSString *)title
                              bgColor:(UIColor *)bgColor
                               action:(void(^)(void))action;

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
    self.selectedUserIndex = -1;
    self.tableView.byShow(self);
    self.tableView.byTableHeaderView(self.editorView);
    [self seedRealmDemoDataIfNeeded];
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
        .byAccessoryType(indexPath.row == self.selectedUserIndex ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone)
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byNumberOfLines(1);
        })
        .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byNumberOfLines(1);
        });
    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectedUserIndex = indexPath.row;
    User_Realm *user = self.userMutArr[indexPath.row];
    self.nameTextField.byText(user.name ? : @"");
    self.ageTextField.byText([NSString stringWithFormat:@"%ld",(long)user.age]);
    [tableView reloadData];
}
#pragma mark —— Demo 数据刷新
-(void)seedRealmDemoDataIfNeeded{
    if (self.fetchAllUsers.count == 0) {
        [self insertUserWithName:@"Alice Smith" age:26];
    }
}

-(void)reloadRealmDemoData{
    NSArray <User_Realm *>*users = self.fetchAllUsers;
    [self reloadDataMutArrByUsers:users];
    [self.tableView reloadData];
    JobsLog(@"Realm Users: %@", users);
}

-(void)reloadDataMutArrByUsers:(NSArray <User_Realm *>*_Nullable)users{
    [self.dataMutArr removeAllObjects];
    [self.userMutArr removeAllObjects];
    for (User_Realm *user in users) {
        self.userMutArr.add(user);
        self.dataMutArr.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.textModel.byText(user.name ? : @"-")
                          .byTextCor(HEXCOLOR(0x3D4A58))
                          .byFont(UIFontWeightRegularSize(16));
            data.subTextModel.byText([NSString stringWithFormat:@"%@：%ld".tr,@"年龄".tr,(long)user.age])
                              .byTextCor(HEXCOLOR(0x757575))
                              .byFont(UIFontWeightRegularSize(14));
        }));
    }
    if (self.selectedUserIndex >= (NSInteger)self.userMutArr.count) {
        self.selectedUserIndex = -1;
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

-(NSString *)realmDemoNameInput{
    NSString *name = [self.nameTextField.text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    if (name.length == 0) {
        name = [NSString stringWithFormat:@"Jobs User %ld",(long)(self.fetchAllUsers.count + 1)];
    };return name;
}

-(NSInteger)realmDemoAgeInput{
    NSInteger age = self.ageTextField.text.integerValue;
    return age > 0 ? age : 18;
}

-(User_Realm *)selectedRealmDemoUser{
    if (self.selectedUserIndex >= 0 && self.selectedUserIndex < (NSInteger)self.userMutArr.count) {
        return self.userMutArr[self.selectedUserIndex];
    };return self.userMutArr.firstObject;
}

-(void)insertRealmDemoUser{
    NSString *name = self.realmDemoNameInput;
    NSInteger age = self.realmDemoAgeInput;
    [self insertUserWithName:name age:age];
    [self reloadRealmDemoData];
    self.selectedUserIndex = self.userMutArr.count > 0 ? (NSInteger)self.userMutArr.count - 1 : -1;
    self.nameTextField.byText(name);
    self.ageTextField.byText([NSString stringWithFormat:@"%ld",(long)age]);
    [self.tableView reloadData];
}

-(void)updateRealmDemoUser{
    User_Realm *user = self.selectedRealmDemoUser;
    if (!user) {
        [self insertRealmDemoUser];
        return;
    }
    [self updateUser:user
             newName:self.realmDemoNameInput
              newAge:self.realmDemoAgeInput];
    [self reloadRealmDemoData];
}

-(void)deleteRealmDemoUser{
    User_Realm *user = self.selectedRealmDemoUser;
    if (!user) return;
    [self deleteUser:user];
    self.selectedUserIndex = -1;
    self.nameTextField.byText(@"");
    self.ageTextField.byText(@"");
    [self reloadRealmDemoData];
}

-(BaseButton *)realmDemoButtonByTitle:(NSString *)title
                              bgColor:(UIColor *)bgColor
                               action:(void(^)(void))action{
    @jobs_weakify(self)
    return BaseButton
        .initByStyle1(title.tr,
                      UIFontWeightRegularSize(14),
                      JobsWhiteColor)
        .bgColorBy(bgColor)
        .cornerRadiusValueBy(JobsWidth(6))
        .onClickBy(^(UIButton *x) {
            @jobs_strongify(self)
            [self.view endEditing:YES];
            if (action) action();
        });
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
                .byContentInset(UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0))
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

-(NSMutableArray<User_Realm *> *)userMutArr{
    if (!_userMutArr) {
        _userMutArr = NSMutableArray.array;
    };return _userMutArr;
}

-(UIView *)editorView{
    if (!_editorView) {
        @jobs_weakify(self)
        _editorView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view.byFrame(CGRectMake(0, 0, JobsRealWidth(), JobsWidth(132)))
                .byBgColor(JobsWhiteColor);
            self.nameTextField.addOn(view);
            self.ageTextField.addOn(view);
            self.nameTextField.byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(view).offset(JobsWidth(16));
                make.left.equalTo(view).offset(JobsWidth(16));
                make.right.equalTo(self.ageTextField.mas_left).offset(-JobsWidth(10));
                make.height.mas_equalTo(JobsWidth(40));
            });
            self.ageTextField.byAdd(^(MASConstraintMaker *make) {
                make.top.height.equalTo(self.nameTextField);
                make.right.equalTo(view).offset(-JobsWidth(16));
                make.width.mas_equalTo(JobsWidth(96));
            });
            self.insertBtn.addOn(view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.nameTextField.mas_bottom).offset(JobsWidth(16));
                    make.left.equalTo(view).offset(JobsWidth(16));
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(76), JobsWidth(36)));
                });
            self.updateBtn.addOn(view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.insertBtn);
                    make.size.equalTo(self.insertBtn);
                    make.left.equalTo(self.insertBtn.mas_right).offset(JobsWidth(8));
                });
            self.deleteBtn.addOn(view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.insertBtn);
                    make.size.equalTo(self.insertBtn);
                    make.left.equalTo(self.updateBtn.mas_right).offset(JobsWidth(8));
                });
            self.queryBtn.addOn(view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.insertBtn);
                    make.size.equalTo(self.insertBtn);
                    make.left.equalTo(self.deleteBtn.mas_right).offset(JobsWidth(8));
                });
        });
    };return _editorView;
}

-(UITextField *)nameTextField{
    if (!_nameTextField) {
        _nameTextField = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            textField
                .byPlaceholder(@"姓名".tr)
                .byTextCor(HEXCOLOR(0x3D4A58))
                .byFont(UIFontWeightRegularSize(14))
                .byTextAlignment(NSTextAlignmentLeft)
                .byBorderStyle(UITextBorderStyleRoundedRect)
                .byClearButtonMode(UITextFieldViewModeWhileEditing)
                .byReturnKeyType(UIReturnKeyDone);
        });
    };return _nameTextField;
}

-(UITextField *)ageTextField{
    if (!_ageTextField) {
        _ageTextField = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            textField
                .byPlaceholder(@"年龄".tr)
                .byTextCor(HEXCOLOR(0x3D4A58))
                .byFont(UIFontWeightRegularSize(14))
                .byTextAlignment(NSTextAlignmentCenter)
                .byBorderStyle(UITextBorderStyleRoundedRect)
                .byClearButtonMode(UITextFieldViewModeWhileEditing)
                .byKeyboardType(UIKeyboardTypeNumberPad)
                .byReturnKeyType(UIReturnKeyDone);
        });
    };return _ageTextField;
}

-(BaseButton *)insertBtn{
    if (!_insertBtn) {
        @jobs_weakify(self)
        _insertBtn = [self realmDemoButtonByTitle:@"新增"
                                          bgColor:HEXCOLOR(0x3D4A58)
                                           action:^{
            @jobs_strongify(self)
            [self insertRealmDemoUser];
        }];
    };return _insertBtn;
}

-(BaseButton *)updateBtn{
    if (!_updateBtn) {
        @jobs_weakify(self)
        _updateBtn = [self realmDemoButtonByTitle:@"修改"
                                          bgColor:HEXCOLOR(0x497D74)
                                           action:^{
            @jobs_strongify(self)
            [self updateRealmDemoUser];
        }];
    };return _updateBtn;
}

-(BaseButton *)deleteBtn{
    if (!_deleteBtn) {
        @jobs_weakify(self)
        _deleteBtn = [self realmDemoButtonByTitle:@"删除"
                                          bgColor:HEXCOLOR(0xC35A4A)
                                           action:^{
            @jobs_strongify(self)
            [self deleteRealmDemoUser];
        }];
    };return _deleteBtn;
}

-(BaseButton *)queryBtn{
    if (!_queryBtn) {
        @jobs_weakify(self)
        _queryBtn = [self realmDemoButtonByTitle:@"查询"
                                         bgColor:HEXCOLOR(0x8A6A42)
                                          action:^{
            @jobs_strongify(self)
            [self reloadRealmDemoData];
        }];
    };return _queryBtn;
}

@end
