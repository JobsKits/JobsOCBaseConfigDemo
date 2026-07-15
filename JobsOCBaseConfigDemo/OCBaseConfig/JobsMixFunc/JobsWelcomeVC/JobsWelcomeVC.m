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
            data.byText(@"".tr);
            data.byFont(UIFontWeightRegularSize(16));
        })
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        // self.viewModel.navBgImage = @"导航栏左侧底图".img;
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(JobsYellowColor);
    self.scrollView.jobsVisible = YES;
    self.pageControl.jobsVisible = YES;
    [self loadPhoto];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)loadPhoto{
    for (NSUInteger i = 0; i < self.dataMutArr.count; i++) {
        UIImageView *imageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byFrame(CGRectMake(JobsMainScreen_WIDTH() * i, 0, JobsMainScreen_WIDTH(), JobsMainScreen_HEIGHT()))
                .addOn(self.scrollView);
        });
        /// 用SDWebImage下载图片
        NSString *imageName = @"".tr;
        if (i < 10) {
            imageName = [NSString stringWithFormat:@"启动页_0%lu",(unsigned long)i];
        }else{
            imageName = [NSString stringWithFormat:@"启动页_%ld",i];
        }
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.dataMutArr[i]] placeholderImage:imageName.img];
    }
}
#pragma mark —— UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.scrollView.contentOffset.x > JobsMainScreen_WIDTH() * 2.8){
        if (self.objBlock) self.objBlock(@1);
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (self.scrollView.contentOffset.x < JobsMainScreen_WIDTH() * 0.5) {
        self.pageControl.currentPage = 0;
    }else if(self.scrollView.contentOffset.x > JobsMainScreen_WIDTH() * 0.5 &&
             self.scrollView.contentOffset.x < JobsMainScreen_WIDTH() * 1.5){
        self.pageControl.currentPage = 1;
    }else if(self.scrollView.contentOffset.x > JobsMainScreen_WIDTH() * 1.5){
        self.pageControl.currentPage = 2;
    }else{}
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
