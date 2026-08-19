//
//  JobsPopUpVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsPopUpVC.h"

@interface JobsPopUpVC ()

-(jobsByVoidBlock _Nonnull)jobs_updatePreferredContentSize;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsPopUpVC
@interface JobsPopUpVC (JobsPropertyDSLSetterAutogen_c4c2fa9845)
-(void)setIsHiddenNavigationBar:(BOOL)data;
-(void)setPreferredContentSize:(CGSize)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsPopUpVC

@implementation JobsPopUpVC
@synthesize popUpHeight = _popUpHeight;

- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
}
#pragma mark —— Lifecycle
-(instancetype)init{
    if (self = [super init]) {
    };return self;
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPopUpVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPopUpVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.byHiddenNavigationBar(YES);
        self.jobs_updatePreferredContentSize();
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPopUpVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        UITabBar *tabBar = self.jobsGetTabBar();
        if (tabBar) tabBar.byHidden(YES);
        self.jobs_updatePreferredContentSize();
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPopUpVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        UITabBar *tabBar = self.jobsGetTabBar();
        if (tabBar) tabBar.byHidden(NO);
    };
}
#pragma mark —— lazyLoad
-(void)setPopUpHeight:(CGFloat)popUpHeight{
    _popUpHeight = popUpHeight;
    self.jobs_updatePreferredContentSize();
}

-(CGFloat)popUpHeight{
    if (_popUpHeight <= 0) {
        _popUpHeight = JobsMainScreen_HEIGHT() / 2;//默认弹出高度
    };return _popUpHeight;
}
#pragma mark —— Private
-(jobsByVoidBlock _Nonnull)jobs_updatePreferredContentSize{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byPreferredContentSize(CGSizeMake(JobsRealWidth(), self.popUpHeight));
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsPopUpVC
-(JobsRetJobsPopUpVCByBOOLBlock _Nonnull)byHiddenNavigationBar{
    @jobs_weakify(self)
    return ^__kindof JobsPopUpVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsHiddenNavigationBar:data];
        return self;
    };
}
-(JobsRetJobsPopUpVCByCGSizeBlock _Nonnull)byPreferredContentSize{
    @jobs_weakify(self)
    return ^__kindof JobsPopUpVC * _Nullable(CGSize data){
        @jobs_strongify(self)
        [self setPreferredContentSize:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsPopUpVC
@end
