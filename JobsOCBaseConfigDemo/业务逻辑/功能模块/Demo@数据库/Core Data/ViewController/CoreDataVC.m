//
//  CoreDataVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CoreDataVC.h"

@interface CoreDataVC ()

Prop_strong()NSManagedObjectContext *context;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN CoreDataVC
@interface CoreDataVC (JobsPropertyDSLSetterAutogen_9934bb0a4f)
-(void)setContext:(NSManagedObjectContext * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END CoreDataVC

@implementation CoreDataVC
- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CoreDataVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CoreDataVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
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
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CoreDataVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        self.byContext(((AppDelegate *)UIApplication.sharedApplication.delegate).persistentContainer.viewContext);
        /// 插入数据
        [self insertUserWithName:@"Alice" age:25];
        [self insertUserWithName:@"Bob" age:30];
        /// 获取所有用户
        NSArray *users = self.fetchAllUsers();
        JobsLog(@"Users: %@", users);
        /// 更新用户
        if (users.count > 0) {
            NSManagedObject *user = users[0];
            [self updateUser:user newName:@"Alice Smith" newAge:26];
        }
        /// 删除用户
        if (users.count > 1) {
            NSManagedObject *user = users[1];
            self.deleteUser(user);
        }
        /// 获取更新后的用户列表
        users = self.fetchAllUsers();
        JobsLog(@"Updated Users: %@", users);
    };
}

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CoreDataVC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CoreDataVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CoreDataVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CoreDataVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CoreDataVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
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
#pragma mark —— CoreData 的增删查改
/// 增加数据
- (void)insertUserWithName:(NSString *)name
                       age:(NSInteger)age {
    NSManagedObject *newUser = [NSEntityDescription insertNewObjectForEntityForName:@"User"
                                                             inManagedObjectContext:self.context];
    [newUser setValue:name forKey:@"name"];
    [newUser setValue:@(age) forKey:@"age"];
    self.saveContext();
}
/// 查询数据
- (JobsRetArrByVoidBlock _Nonnull)fetchAllUsers {
    @jobs_weakify(self)
    return ^NSArray *{
        @jobs_strongify(self)
        if (!self) return nil;
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"User"];
        NSError *error = nil;
        NSArray *result = [self.context executeFetchRequest:fetchRequest error:&error];
        if (error) {
            JobsLog(@"Error fetching users: %@", error);
        };return result;
    };
}
/// 更新/改正 数据
- (void)updateUser:(NSManagedObject *)user
           newName:(NSString *)newName
            newAge:(NSInteger)newAge {
    [user setValue:newName forKey:@"name"];
    [user setValue:@(newAge) forKey:@"age"];
    self.saveContext();
}
/// 删除数据
-(jobsByNSManagedObjectBlock _Nonnull)deleteUser{
    @jobs_weakify(self)
    return ^(NSManagedObject * user){
        @jobs_strongify(self)
        if (!self) return;
        [self.context deleteObject:user];
        self.saveContext();
    };
}
/// 对上下文进行保存
- (jobsByVoidBlock _Nonnull)saveContext {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSError *error = nil;
        if (self.context.hasChanges && ![self.context save:&error]) {
            JobsLog(@"Unresolved error %@, %@", error, error.userInfo);
            abort();
        }
    };
}
#pragma mark —— lazyLoad

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
