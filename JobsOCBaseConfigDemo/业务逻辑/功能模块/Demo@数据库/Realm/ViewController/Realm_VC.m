//
//  Realm_VC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "Realm_VC.h"

@interface Realm_VC ()
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

-(jobsByVoidBlock _Nonnull)seedRealmDemoDataIfNeeded;
-(jobsByVoidBlock _Nonnull)reloadRealmDemoData;
-(jobsByNSArrayUser_RealmBlock _Nonnull)reloadDataMutArrByUsers;
-(JobsRetStrByVoidBlock _Nonnull)realmDemoNameInput;
-(JobsRetNSIntegerByVoidBlock _Nonnull)realmDemoAgeInput;
-(JobsRetUser_RealmByVoidBlock _Nonnull)selectedRealmDemoUser;
-(jobsByVoidBlock _Nonnull)insertRealmDemoUser;
-(jobsByVoidBlock _Nonnull)updateRealmDemoUser;
-(jobsByVoidBlock _Nonnull)deleteRealmDemoUser;
-(BaseButton *)realmDemoButtonByTitle:(NSString *)title
                              bgColor:(UIColor *)bgColor
                               action:(void(^)(void))action;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN Realm_VC
@interface Realm_VC (JobsPropertyDSLSetterAutogen_9551631e26)
-(void)setSelectedUserIndex:(NSInteger)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END Realm_VC

@implementation Realm_VC
- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Realm_VC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                    .byText(data.attributedTitle.string)
                    .byFont(UIFontWeightRegularSize(18));
            })
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byBgImage(@"新首页的底图".img)
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Realm_VC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.makeNavByAlpha(1);
        self.bySelectedUserIndex(-1);
        self.tableView.byShow(self);
        self.tableView.byTableHeaderView(self.editorView);
        self.seedRealmDemoDataIfNeeded();
        self.reloadRealmDemoData();
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Realm_VC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
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

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Realm_VC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Realm_VC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Realm_VC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Realm_VC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
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

-(void)viewDidDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Realm_VC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
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
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    JobsRetNSIntegerByUITableViewBlock action = ((JobsRetNSIntegerByUITableViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Realm_VC.class, @selector(jobsNumberOfSectionsInTableView)))(self, @selector(jobsNumberOfSectionsInTableView));
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
    self.bySelectedUserIndex(indexPath.row);
    User_Realm *user = self.userMutArr[indexPath.row];
    self.nameTextField.byText(user.name ? : @"");
    self.ageTextField.byText([NSString stringWithFormat:@"%ld",(long)user.age]);
    [tableView reloadData];
}
#pragma mark —— Demo 数据刷新
-(jobsByVoidBlock _Nonnull)seedRealmDemoDataIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.fetchAllUsers().count == 0) {
            [self insertUserWithName:@"Alice Smith" age:26];
        }
    };
}

-(jobsByVoidBlock _Nonnull)reloadRealmDemoData{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSArray <User_Realm *>*users = self.fetchAllUsers();
        self.reloadDataMutArrByUsers(users);
        [self.tableView reloadData];
        JobsLog(@"Realm Users: %@", users);
    };
}

-(jobsByNSArrayUser_RealmBlock _Nonnull)reloadDataMutArrByUsers{
    @jobs_weakify(self)
    return ^(NSArray <User_Realm *>*_Nullable users){
        @jobs_strongify(self)
        if (!self) return;
        [self.dataMutArr removeAllObjects];
        [self.userMutArr removeAllObjects];
        for (User_Realm *user in users) {
            self.userMutArr.add(user);
            self.dataMutArr.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
                data.textModel.byText(user.name ? : @"-")
                              .byTextCor(JobsLabelColor)
                              .byFont(UIFontWeightRegularSize(16));
                data.subTextModel.byText([NSString stringWithFormat:@"%@：%ld".jobsTr(),@"年龄".jobsTr(),(long)user.age])
                                  .byTextCor(JobsSecondaryLabelColor)
                                  .byFont(UIFontWeightRegularSize(14));
            }));
        }
        if (self.selectedUserIndex >= (NSInteger)self.userMutArr.count) {
            self.bySelectedUserIndex(-1);
        }
    };
}
#pragma mark —— Realm 的增删查改
/// 插入数据
- (void)insertUserWithName:(NSString *)name age:(NSInteger)age {
    RLMRealm *realm = RLMRealm.defaultRealm;
    [realm transactionWithBlock:^{
        User_Realm *newUser = User_Realm.new;
        newUser.byName(name);
        newUser.byAge(age);
        [realm addObject:newUser];
    }];
}
/// 查询数据
- (JobsRetArrByVoidBlock _Nonnull)fetchAllUsers {
    @jobs_weakify(self)
    return ^NSArray *{
        @jobs_strongify(self)
        if (!self) return nil;
        RLMResults<User_Realm *> *results = User_Realm.allObjects;
        NSMutableArray *users = NSMutableArray.array;
        for (User_Realm *user in results) {
            [users addObject:user];
        };return users;
    };
}
/// 更新/改正 数据
- (void)updateUser:(User_Realm *)user
           newName:(NSString *)newName
            newAge:(NSInteger)newAge {
    RLMRealm *realm = RLMRealm.defaultRealm;
    [realm transactionWithBlock:^{
        user.byName(newName);
        user.byAge(newAge);
    }];
}
/// 删除数据
-(jobsByUser_RealmBlock _Nonnull)deleteUser{
    @jobs_weakify(self)
    return ^(User_Realm * user){
        @jobs_strongify(self)
        if (!self) return;
        RLMRealm *realm = RLMRealm.defaultRealm;
        [realm transactionWithBlock:^{
            [realm deleteObject:user];
        }];
    };
}

-(JobsRetStrByVoidBlock _Nonnull)realmDemoNameInput{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *name = [self.nameTextField.text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
        if (name.length == 0) {
            name = [NSString stringWithFormat:@"Jobs User %ld",(long)(self.fetchAllUsers().count + 1)];
        };return name;
    };
}

-(JobsRetNSIntegerByVoidBlock _Nonnull)realmDemoAgeInput{
    @jobs_weakify(self)
    return ^NSInteger{
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        NSInteger age = self.ageTextField.text.integerValue;
        return age > 0 ? age : 18;
    };
}

-(JobsRetUser_RealmByVoidBlock _Nonnull)selectedRealmDemoUser{
    @jobs_weakify(self)
    return ^User_Realm *{
        @jobs_strongify(self)
        if (!self) return nil;
        if (self.selectedUserIndex >= 0 && self.selectedUserIndex < (NSInteger)self.userMutArr.count) {
            return self.userMutArr[self.selectedUserIndex];
        };return self.userMutArr.firstObject;
    };
}

-(jobsByVoidBlock _Nonnull)insertRealmDemoUser{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSString *name = self.realmDemoNameInput();
        NSInteger age = self.realmDemoAgeInput();
        [self insertUserWithName:name age:age];
        self.reloadRealmDemoData();
        self.bySelectedUserIndex(self.userMutArr.count > 0 ? (NSInteger)self.userMutArr.count - 1 : -1);
        self.nameTextField.byText(name);
        self.ageTextField.byText([NSString stringWithFormat:@"%ld",(long)age]);
        [self.tableView reloadData];
    };
}

-(jobsByVoidBlock _Nonnull)updateRealmDemoUser{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        User_Realm *user = self.selectedRealmDemoUser();
        if (!user) {
            self.insertRealmDemoUser();
            return;
        }
        [self updateUser:user
                 newName:self.realmDemoNameInput()
                  newAge:self.realmDemoAgeInput()];
        self.reloadRealmDemoData();
    };
}

-(jobsByVoidBlock _Nonnull)deleteRealmDemoUser{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        User_Realm *user = self.selectedRealmDemoUser();
        if (!user) return;
        self.deleteUser(user);
        self.bySelectedUserIndex(-1);
        self.nameTextField.byText(@"");
        self.ageTextField.byText(@"");
        self.reloadRealmDemoData();
    };
}

-(BaseButton *)realmDemoButtonByTitle:(NSString *)title
                              bgColor:(UIColor *)bgColor
                               action:(void(^)(void))action{
    @jobs_weakify(self)
    return BaseButton
        .initByStyle1(title.jobsTr(),
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
                .byBgColor(JobsSecondarySystemBackgroundColor);
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
                .byPlaceholder(@"姓名".jobsTr())
                .byTextCor(JobsLabelColor)
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
                .byPlaceholder(@"年龄".jobsTr())
                .byTextCor(JobsLabelColor)
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
            self.insertRealmDemoUser();
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
            self.updateRealmDemoUser();
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
            self.deleteRealmDemoUser();
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
            self.reloadRealmDemoData();
        }];
    };return _queryBtn;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN Realm_VC
-(JobsRetRealm_VCByNSIntegerBlock _Nonnull)bySelectedUserIndex{
    @jobs_weakify(self)
    return ^__kindof Realm_VC * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setSelectedUserIndex:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END Realm_VC
@end
