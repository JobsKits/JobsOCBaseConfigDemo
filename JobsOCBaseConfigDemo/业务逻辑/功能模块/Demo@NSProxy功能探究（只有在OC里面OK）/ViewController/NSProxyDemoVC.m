//
//  NSProxyDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSProxyDemoVC.h"

@interface NSProxyDemoVC ()

@end

@implementation NSProxyDemoVC
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSProxyDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                        .byText(@"探究 NSProxy".jobsTr())
                        .byFont(UIFontWeightRegularSize(16));
                })
                // 使用原则：底图有 + 底色有 = 优先使用底图数据
                // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
                // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
                .byBgCor(RGBA_COLOR(255, 238, 221, 1))
                    //    self.viewModel.bgImage = @"启动页SLOGAN".img;
                .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
                .byNavBgImage(@"导航栏左侧底图".img);    }
    };
}

-(void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSProxyDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSProxyDemoVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        self.demo1();
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSProxyDemoVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSProxyDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
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
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)demo1{
    return ^(){
        // 创建 Proxy
        MyProxy *proxy = MyProxy.proxy();
        // 添加多个目标对象（支持多播）
        proxy
            .addTargetBy(RealServiceA.new)
            .addTargetBy(RealServiceB.new);
        // 强转为协议类型（或用 id<MyService>）
        id<MyService> service = (id<MyService>)proxy;
        service.doSomething(); // 发给 A 和 B，同时打印调用日志
    };
}

-(jobsByVoidBlock _Nonnull)demo2{
    return ^(){
        MyProxy *proxy = MyProxy.proxy();
        proxy.addWeakTargetBy(Person.new);
        [(id)proxy setJobsName:@"JobsHi"];
    };
}

@end
