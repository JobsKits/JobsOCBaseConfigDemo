//
//  JobsWelcomeVC.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsWelcomeVC.h"

@interface JobsWelcomeVC ()
// UI
Prop_strong()UIPageControl *pageControl;
// Data
Prop_strong()NSMutableArray <NSString *>*dataMutArr;

@end

@implementation JobsWelcomeVC
- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsWelcomeVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                    .byText(@"".jobsTr())
                    .byFont(UIFontWeightRegularSize(16));
            })
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            // self.viewModel.navBgImage = @"导航栏左侧底图".img;
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsWelcomeVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.scrollView.byJobsVisible(YES);
        self.pageControl.byJobsVisible(YES);
        self.loadPhoto();
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsWelcomeVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
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

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsWelcomeVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsWelcomeVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
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

- (jobsByVoidBlock _Nonnull)loadPhoto{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        for (NSUInteger i = 0; i < self.dataMutArr.count; i++) {
            UIImageView *imageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
                imageView
                    .byFrame(CGRectMake(JobsMainScreen_WIDTH() * i, 0, JobsMainScreen_WIDTH(), JobsMainScreen_HEIGHT()))
                    .addOn(self.scrollView);
            });
            /// 用SDWebImage下载图片
            NSString *imageName = @"".jobsTr();
            if (i < 10) {
                imageName = [NSString stringWithFormat:@"启动页_0%lu",(unsigned long)i];
            }else{
                imageName = [NSString stringWithFormat:@"启动页_%ld",i];
            }
            [imageView sd_setImageWithURL:[NSURL URLWithString:self.dataMutArr[i]] placeholderImage:imageName.img];
        }
    };
}
#pragma mark —— UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    jobsByScrollViewBlock action = ((jobsByScrollViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsWelcomeVC.class, @selector(jobsScrollViewDidScroll)))(self, @selector(jobsScrollViewDidScroll));
    if (action) action(scrollView);
}

-(jobsByScrollViewBlock _Nonnull)jobsScrollViewDidScroll{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
        if (self.scrollView.contentOffset.x > JobsMainScreen_WIDTH() * 2.8){
            if (self.objBlock) self.objBlock(@1);
        }
    };
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    jobsByScrollViewBlock action = ((jobsByScrollViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsWelcomeVC.class, @selector(jobsScrollViewDidEndDecelerating)))(self, @selector(jobsScrollViewDidEndDecelerating));
    if (action) action(scrollView);
}

-(jobsByScrollViewBlock _Nonnull)jobsScrollViewDidEndDecelerating{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
        if (self.scrollView.contentOffset.x < JobsMainScreen_WIDTH() * 0.5) {
            self.pageControl.byCurrentPage(0);
        }else if(self.scrollView.contentOffset.x > JobsMainScreen_WIDTH() * 0.5 &&
                 self.scrollView.contentOffset.x < JobsMainScreen_WIDTH() * 1.5){
            self.pageControl.byCurrentPage(1);
        }else if(self.scrollView.contentOffset.x > JobsMainScreen_WIDTH() * 1.5){
            self.pageControl.byCurrentPage(2);
        }else{}
    };
}
#pragma mark —— lazyLoad
-(UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = jobsMakePageControl(^(UIPageControl * _Nullable pageControl) {
            pageControl
                .byNumberOfPages(3)
                .byCurrentPage(0)
                .byCurrentPageIndicatorTintColor(JobsRedColor)
                .byPageIndicatorTintColor(JobsWhiteColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerX.offset(0);
                    make.bottom.offset(-JobsWidth(60));
                });
        });
    };return _pageControl;
}
/// BaseViewProtocol
@synthesize scrollView = _scrollView;
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        @jobs_weakify(self)
        _scrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            @jobs_strongify(self)
            scrollView
                .byDelegate(self)
                .byContentOffset(CGPointMake(0, 0))
                .byContentSize(CGSizeMake(JobsMainScreen_WIDTH() * 4, JobsMainScreen_HEIGHT()))
                .byBounces(NO)
                .byPagingEnabled(YES)
                .byShowsHorizontalScrollIndicator(NO)
                .byShowsVerticalScrollIndicator(NO)
                .byFrame(UIScreen.mainScreen.bounds)
                .addOn(self.view);
        });
    };return _scrollView;
}

-(NSMutableArray<NSString *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {
            arr
                .add(@"https://b-ssl.duitang.com/uploads/item/201503/25/20150325184145_SBu3J.jpeg")
                .add(@"https://b-ssl.duitang.com/uploads/item/201503/25/20150325184145_SBu3J.jpeg")
                .add(@"https://b-ssl.duitang.com/uploads/item/201503/25/20150325184145_SBu3J.jpeg");
        });
    };return _dataMutArr;
}

@end
