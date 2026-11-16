//
//  CoreDataVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CoreDataVC.h"
#import "../../JobsCoreDataUserStore/JobsCoreDataUserStore.h"

@interface CoreDataVC () <UITableViewDelegate, UITableViewDataSource>

Prop_strong()NSManagedObjectContext *context;
Prop_strong()UITableView *usersTableView;
Prop_strong()UILabel *informationLabel;
Prop_strong()UILabel *countLabel;
Prop_strong()UIBarButtonItem *addItem;
Prop_strong()UIBarButtonItem *reloadItem;
Prop_strong()UIBarButtonItem *clearItem;
Prop_strong()UIAlertController *editorAlert;
Prop_strong()UIAlertController *clearAlert;
Prop_strong()NSManagedObject *editingUser;
Prop_strong()NSError *lastError;
Prop_copy()NSArray<NSManagedObject *> *users;

-(jobsByVoidBlock _Nonnull)reloadUsers;
-(jobsByVoidBlock _Nonnull)refreshPresentation;
-(jobsByVoidBlock _Nonnull)saveEditor;
-(jobsByNSManagedObjectBlock _Nonnull)presentUserEditor;
-(JobsRetUIButtonModelByVoidBlock _Nonnull)emptyButtonModel;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN CoreDataVC
@interface CoreDataVC (JobsPropertyDSLSetterAutogen_06a6870f25)
-(void)setContext:(NSManagedObjectContext * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END CoreDataVC

@implementation CoreDataVC

-(void)dealloc{
    JobsRemoveNotification(self);
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.informationLabel.byAlpha(1);
    self.countLabel.byAlpha(1);
    self.usersTableView.byAlpha(1);
    @jobs_weakify(self)
    [self addNotificationName:语言切换 block:^(id _Nullable weakSelf, id _Nullable arg) {
        @jobs_strongify(self)
        self.refreshPresentation();
    }];
    [self addNotificationName:JobsThemeDidChangeNotification block:^(id _Nullable weakSelf, id _Nullable arg) {
        @jobs_strongify(self)
        self.refreshPresentation();
    }];
    [self addNotificationName:UIApplicationDidBecomeActiveNotification block:^(id _Nullable weakSelf, id _Nullable arg) {
        @jobs_strongify(self)
        if (self.view.window && !self.presentedViewController) {
            self.reloadUsers();
        }
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.reloadUsers();
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    // 入窗后触发真实列表与空态渲染，覆盖首次进入和返回页面。
    self.refreshPresentation();
}

-(jobsByVoidBlock _Nonnull)reloadUsers{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        // 失败容器不会被宿主缓存；再次加载可在磁盘等环境恢复后重试。
        if (!self.context.persistentStoreCoordinator.persistentStores.count) {
            self.byContext(((AppDelegate *)UIApplication.sharedApplication.delegate).persistentContainer.viewContext);
        }
        NSError *error = nil;
        NSArray *users = [JobsCoreDataUserStore fetchUsersInContext:self.context error:&error];
        self->_users = users ?: @[];
        self->_lastError = error;
        if (!users && !error) {
            self->_lastError = [NSError errorWithDomain:@"JobsCoreDataDemo" code:1
                                              userInfo:@{NSLocalizedDescriptionKey: @"数据库尚未就绪。"}];
        }
        self.refreshPresentation();
        [self.usersTableView.mj_header endRefreshing];
    };
}

-(jobsByVoidBlock _Nonnull)refreshPresentation{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self || !self.isViewLoaded) {
            return;
        }
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.byGKNavTitle(@"Core Data 用户数据库".jobsTr());
        NSString *information = @"User 模型定义姓名与年龄，SQLite 文件保存实际记录。本页仅演示本地持久化。".jobsTr();
        NSString *guidance = [NSString stringWithFormat:@"%@\n%@", @"输入姓名和年龄，添加第一位用户".jobsTr(), @"点击记录编辑姓名与年龄，左滑删除。所有操作立即保存，重启后仍可读取。".jobsTr()];
        if (self.lastError) {
            guidance = [NSString stringWithFormat:@"%@\n%@", @"数据库操作失败".jobsTr(), self.lastError.localizedDescription.jobsTr()];
        }
        self.informationLabel.byText([NSString stringWithFormat:@"%@\n%@", information, guidance])
            .byTextCor(JobsLabelColor);
        self.countLabel.byText([NSString stringWithFormat:@"记录数量：%@".jobsTr(), @(self.users.count).stringValue])
            .byTextCor(JobsSecondaryLabelColor);
        self->_addItem = nil;
        self->_reloadItem = nil;
        self->_clearItem = nil;
        self.byGKNavRightBarButtonItems(@[self.addItem, self.reloadItem, self.clearItem]);
        self.jobs_ensureDemoThemeButton();
        self.usersTableView.bySeparatorColor(JobsSeparatorColor)
            .emptyDataByButtonModel(self.emptyButtonModel());
        if (self.view.window) {
            [self.usersTableView reloadData];
        }
    };
}

#pragma mark —— UIKit target/action 固定回调

-(void)addUserAction:(id)sender{
    self.presentUserEditor(nil);
}

-(void)reloadAction:(id)sender{
    self.reloadUsers();
}

-(void)clearAction:(id)sender{
    self->_clearAlert = nil;
    self.comingToPresentVC(self.clearAlert);
}

-(jobsByNSManagedObjectBlock _Nonnull)presentUserEditor{
    @jobs_weakify(self)
    return ^(NSManagedObject *user){
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        if (!self.context.persistentStoreCoordinator.persistentStores.count) {
            self.reloadUsers();
        }
        if (!self.context.persistentStoreCoordinator.persistentStores.count) {
            return;
        }
        self->_editingUser = user;
        self->_editorAlert = nil;
        self.comingToPresentVC(self.editorAlert);
    };
}

-(jobsByVoidBlock _Nonnull)saveEditor{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        NSString *name = self.editorAlert.textFields.firstObject.text ?: @"";
        NSString *ageText = [self.editorAlert.textFields.lastObject.text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet] ?: @"";
        NSScanner *scanner = [NSScanner scannerWithString:ageText];
        long long age = -1;
        BOOL validAge = [scanner scanLongLong:&age] && scanner.isAtEnd && age >= 0 && age <= 150;
        NSError *error = nil;
        BOOL saved = NO;
        if (!validAge) {
            error = [NSError errorWithDomain:@"JobsCoreDataDemo" code:2
                                   userInfo:@{NSLocalizedDescriptionKey: @"年龄须为 0～150 的整数。"}];
        }else if (self.editingUser) {
            saved = [JobsCoreDataUserStore updateUser:self.editingUser name:name age:(NSInteger)age context:self.context error:&error];
        }else{
            saved = [JobsCoreDataUserStore insertName:name age:(NSInteger)age context:self.context error:&error];
        }
        if (saved) {
            self.reloadUsers();
            return;
        }
        self->_lastError = error;
        self.editorAlert.byMessage(error.localizedDescription.jobsTr());
        self.refreshPresentation();
        // 系统动作会先收起 Alert；再次展示同一编辑器保留输入，供修正或重试。
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            if (self.view.window && !self.presentedViewController) {
                self.comingToPresentVC(self.editorAlert);
            }
        });
    };
}

#pragma mark —— UI 懒加载

-(UILabel *)informationLabel{
    if (!_informationLabel) {
        _informationLabel = jobsMakeLabel(^(UILabel *label) {
            label.byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(15)])
                .byNumberOfLines(0)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(12);
                    make.left.equalTo(self.view).offset(20);
                    make.right.equalTo(self.view).offset(-20);
                });
        });
    }
    return _informationLabel;
}

-(UILabel *)countLabel{
    if (!_countLabel) {
        _countLabel = jobsMakeLabel(^(UILabel *label) {
            label.byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(14)])
                .byNumberOfLines(0)
                .byAccessibilityIdentifier(@"jobs.coredata.count")
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self.informationLabel);
                    make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-12);
                });
        });
    }
    return _countLabel;
}

-(UITableView *)usersTableView{
    if (!_usersTableView) {
        @jobs_weakify(self)
        _usersTableView = jobsMakeTableViewByPlain(^(UITableView *tableView) {
            [tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"JobsCoreDataUser"];
            tableView.byDelegate(self)
                .byDataSource(self)
                .byRowHeight(UITableViewAutomaticDimension)
                .byEstimatedRowHeight(60)
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byMJ_header([MJRefreshNormalHeader headerWithRefreshingBlock:^{
                    @jobs_strongify(self)
                    self.reloadUsers();
                }])
                .emptyDataByButtonModel(self.emptyButtonModel())
                .byBgColor(JobsClearColor)
                .byAccessibilityIdentifier(@"jobs.coredata.users")
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.left.right.equalTo(self.view);
                    make.top.equalTo(self.informationLabel.mas_bottom).offset(12);
                    make.bottom.equalTo(self.countLabel.mas_top).offset(-8);
                });
        });
    }
    return _usersTableView;
}

-(JobsRetUIButtonModelByVoidBlock _Nonnull)emptyButtonModel{
    @jobs_weakify(self)
    return ^UIButtonModel *{
        @jobs_strongify(self)
        return jobsMakeButtonModel(^(UIButtonModel *model) {
            model.byTitle((self.lastError ? @"数据库操作失败" : @"尚无用户记录").jobsTr())
                .byTitleCor(JobsLabelColor)
                .byTitleFont(UIFontWeightRegularSize(21))
                .byTitleLineBreakMode(NSLineBreakByWordWrapping)
                .byTextAlignment(NSTextAlignmentCenter)
                .bySubTitle(@"重新加载".jobsTr())
                .bySubTitleCor(JobsSecondaryLabelColor)
                .bySubTitleFont(UIFontWeightRegularSize(16))
                .bySubtitleLineBreakMode(NSLineBreakByWordWrapping)
                .bySubTextAlignment(NSTextAlignmentCenter)
                .byNormalImage(@"CoreDataDatabaseIcon".img)
                .byImagePlacement(NSDirectionalRectEdgeTop)
                .byImagePadding(16)
                .byBaseBackgroundColor(JobsClearColor)
                .byClickEventBlock(^id(id data) {
                    @jobs_strongify(self)
                    self.reloadUsers();
                    return nil;
                });
        });
    };
}

-(UIBarButtonItem *)addItem{
    if (!_addItem) {
        _addItem = jobsMakeBarButtonItemByTitle(@"添加用户".jobsTr(), UIBarButtonItemStylePlain, self, @selector(addUserAction:), nil);
    }
    return _addItem;
}

-(UIBarButtonItem *)reloadItem{
    if (!_reloadItem) {
        _reloadItem = jobsMakeBarButtonItemByTitle(@"重新加载".jobsTr(), UIBarButtonItemStylePlain, self, @selector(reloadAction:), nil);
    }
    return _reloadItem;
}

-(UIBarButtonItem *)clearItem{
    if (!_clearItem) {
        _clearItem = jobsMakeBarButtonItemByTitle(@"清空数据库".jobsTr(), UIBarButtonItemStylePlain, self, @selector(clearAction:), nil);
    }
    return _clearItem;
}

-(UIAlertController *)editorAlert{
    if (!_editorAlert) {
        @jobs_weakify(self)
        _editorAlert = JobsMakeAlertControllerBy(jobsMakeAlertModel(^(JobsAlertModel *model) {
            model.byAlertControllerTitle((self.editingUser ? @"编辑用户" : @"添加用户").jobsTr())
                .byPreferredStyle(UIAlertControllerStyleAlert);
        }));
        [_editorAlert addTextFieldWithConfigurationHandler:^(UITextField *field) {
            @jobs_strongify(self)
            field.byPlaceholder(@"姓名".jobsTr())
                .byText([self.editingUser valueForKey:@"name"] ?: @"")
                .byAccessibilityIdentifier(@"jobs.coredata.name");
        }];
        [_editorAlert addTextFieldWithConfigurationHandler:^(UITextField *field) {
            @jobs_strongify(self)
            NSNumber *age = [self.editingUser valueForKey:@"age"];
            field.byPlaceholder(@"年龄".jobsTr())
                .byText(age ? age.stringValue : @"")
                .byKeyboardType(UIKeyboardTypeNumberPad)
                .byAccessibilityIdentifier(@"jobs.coredata.age");
        }];
        _editorAlert.add(JobsMakeAlertActionBy(jobsMakeAlertModel(^(JobsAlertModel *model) {
            model.byAlertActionTitle(@"取消".jobsTr()).byAlertActionStyle(UIAlertActionStyleCancel);
        }))).add(JobsMakeAlertActionBy(jobsMakeAlertModel(^(JobsAlertModel *model) {
            model.byAlertActionTitle(@"保存".jobsTr())
                .byAlertActionStyle(UIAlertActionStyleDefault)
                .byAlertActionBlock(^(UIAlertAction *action) {
                    @jobs_strongify(self)
                    self.saveEditor();
                });
        })));
    }
    return _editorAlert;
}

-(UIAlertController *)clearAlert{
    if (!_clearAlert) {
        @jobs_weakify(self)
        _clearAlert = JobsMakeAlertControllerBy(jobsMakeAlertModel(^(JobsAlertModel *model) {
            model.byAlertControllerTitle(@"清空数据库".jobsTr())
                .byMessage(@"确定删除本 Demo 的全部用户？此操作无法撤销。".jobsTr())
                .byPreferredStyle(UIAlertControllerStyleAlert);
        }));
        _clearAlert.add(JobsMakeAlertActionBy(jobsMakeAlertModel(^(JobsAlertModel *model) {
            model.byAlertActionTitle(@"取消".jobsTr()).byAlertActionStyle(UIAlertActionStyleCancel);
        }))).add(JobsMakeAlertActionBy(jobsMakeAlertModel(^(JobsAlertModel *model) {
            model.byAlertActionTitle(@"清空".jobsTr())
                .byAlertActionStyle(UIAlertActionStyleDestructive)
                .byAlertActionBlock(^(UIAlertAction *action) {
                    @jobs_strongify(self)
                    NSError *error = nil;
                    if ([JobsCoreDataUserStore deleteAllInContext:self.context error:&error]) {
                        self.reloadUsers();
                    }else{
                        self->_lastError = error;
                        self.refreshPresentation();
                    }
                });
        })));
    }
    return _clearAlert;
}

#pragma mark —— UITableView 固定协议

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.users.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JobsCoreDataUser" forIndexPath:indexPath];
    NSManagedObject *user = self.users[indexPath.row];
    NSString *name = [user valueForKey:@"name"] ?: @"";
    NSString *age = [[user valueForKey:@"age"] stringValue] ?: @"0";
    return cell.byTextLabel(^(UILabel *label) {
        label.byText([NSString stringWithFormat:@"%@\n%@: %@", name, @"年龄".jobsTr(), age])
            .byFont([UIFontMetrics.defaultMetrics scaledFontForFont:UIFontWeightRegularSize(17)])
            .byTextCor(JobsLabelColor)
            .byNumberOfLines(0);
    }).byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .byBgColor(JobsSystemBackgroundColor);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row < (NSInteger)self.users.count) {
        self.presentUserEditor(self.users[indexPath.row]);
    }
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除".jobsTr();
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle != UITableViewCellEditingStyleDelete || indexPath.row >= (NSInteger)self.users.count) {
        return;
    }
    NSError *error = nil;
    if ([JobsCoreDataUserStore deleteUser:self.users[indexPath.row] context:self.context error:&error]) {
        self.reloadUsers();
    }else{
        self->_lastError = error;
        self.refreshPresentation();
    }
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN CoreDataVC
-(JobsRetCoreDataVCByNSManagedObjectContextBlock _Nonnull)byContext{
    @jobs_weakify(self)
    return ^__kindof CoreDataVC * _Nullable(NSManagedObjectContext * _Nullable data){
        @jobs_strongify(self)
        [self setContext:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END CoreDataVC

@end
