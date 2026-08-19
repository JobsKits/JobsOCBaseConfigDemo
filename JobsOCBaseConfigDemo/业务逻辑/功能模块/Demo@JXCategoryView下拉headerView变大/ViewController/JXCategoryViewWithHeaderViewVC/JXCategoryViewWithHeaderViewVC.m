//
//  JXCategoryViewWithHeaderViewVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryViewWithHeaderViewVC.h"

@interface JXCategoryViewWithHeaderViewVC ()
/// UI
Prop_strong()BaseButton *ruleBtn;
Prop_strong()JXCategoryTitleView *categoryView;/// 文字
Prop_strong()JXPagerView *pagerView;
Prop_strong()BaiShaETProjCollectionHeaderView *collectionHeaderView;
/// Data
Prop_strong()NSMutableArray <NSString *>*titleMutArr;
Prop_strong()NSMutableArray <__kindof UIViewController *>*childVCMutArr;

@end

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JXCategoryIndicatorLineView
@interface JXCategoryIndicatorLineView (JobsLocalPropertyDSLAutogen_3c987acc13)
-(JobsRetJXCategoryIndicatorLineViewByCGFloatBlock _Nonnull)byIndicatorHeight;
-(JobsRetJXCategoryIndicatorLineViewByCGFloatBlock _Nonnull)byIndicatorWidthIncrement;
-(JobsRetJXCategoryIndicatorLineViewByCGFloatBlock _Nonnull)byVerticalMargin;
-(JobsRetJXCategoryIndicatorLineViewByUIColorBlock _Nonnull)byIndicatorColor;
-(void)setIndicatorColor:(UIColor * _Nullable)data;
-(void)setIndicatorHeight:(CGFloat)data;
-(void)setIndicatorWidthIncrement:(CGFloat)data;
-(void)setVerticalMargin:(CGFloat)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END JXCategoryIndicatorLineView

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JXPagerView
@interface JXPagerView (JobsLocalPropertyDSLAutogen_3c987acc13)
-(JobsRetJXPagerViewByNSIntegerBlock _Nonnull)byPinSectionHeaderVerticalOffset;
-(void)setPinSectionHeaderVerticalOffset:(NSInteger)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END JXPagerView

@implementation JXCategoryViewWithHeaderViewVC
- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryViewWithHeaderViewVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                data.byTextCor(JobsLabelColor);
            })
            //        self.viewModel.textModel.text = @"VIP俱乐部".jobsTr();
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byText(data.attributedTitle.string)
                    .byFont(UIFontWeightRegularSize(16));
            })
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            //    self.viewModel.bgImage = @"启动页SLOGAN".img;
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryViewWithHeaderViewVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
            [super viewDidLoad];
            @jobs_weakify(self)
            self.byLeftBarButtonItems(jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
                @jobs_strongify(self)
        //        data.add(UIBarButtonItem.initBy(self.aboutBtn));
            }))
            .byRightBarButtonItems(jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
                @jobs_strongify(self)
                data.add(UIBarButtonItem.initBy(self.ruleBtn));
            }));
            self.byGKNavItemRightSpace(JobsWidth(16));
            self.makeNavByAlpha(1);
            self.topLineLab.byAlpha(0);
            self.categoryView.byAlpha(1);
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryViewWithHeaderViewVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryViewWithHeaderViewVC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryViewWithHeaderViewVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryViewWithHeaderViewVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryViewWithHeaderViewVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryViewWithHeaderViewVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
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
#pragma mark —— JXPagingViewDelegate
-(JobsRetUIViewByJXPagerViewBlock _Nonnull)tableHeaderViewInPagerView{
    @jobs_weakify(self)
    return ^UIView *(JXPagerView * pagerView){
        @jobs_strongify(self)
        if (!self) return nil;
        return self.collectionHeaderView;
    };
}
/**
    页面朝上走 crollView.contentOffset.y 为正值
    页面朝下走 crollView.contentOffset.y 为负值
    初始态是0
 */
- (void)pagerView:(JXPagerView *)pagerView
mainTableViewDidScroll:(UIScrollView *)scrollView{
    JobsLog(@"contentOffsetY = %f",scrollView.contentOffset.y);
    self.byGKNavigationBarBlock(^(__kindof GKCustomNavigationBar * _Nullable navigationBar) {
        navigationBar
            .byHidden(NO)
            .byAlpha(scrollView.contentOffset.y / 200);
    });
    self.topLineLab.byAlpha(scrollView.contentOffset.y / 200);
    [self.collectionHeaderView scrollViewDidScrollWithContentOffsetY:scrollView.contentOffset.y];
}
///
-(JobsRetNSUIntegerByJXPagerViewBlock _Nonnull)tableHeaderViewHeightInPagerView{
    @jobs_weakify(self)
    return ^NSUInteger(JXPagerView * pagerView){
        @jobs_strongify(self)
        if (!self) return (NSUInteger){0};
        return JobsStatusBarHeight()
    //    + self.gk_navigationBar.height
        + JobsNavigationBarAndStatusBarHeight(nil)
        + BaiShaETProjCollectionHeaderView.viewSizeByModel(nil).height;
    };
}
/// JXCategoryTitleView *categoryView 的高度
-(JobsRetNSUIntegerByJXPagerViewBlock _Nonnull)heightForPinSectionHeaderInPagerView{
    @jobs_weakify(self)
    return ^NSUInteger(JXPagerView * pagerView){
        @jobs_strongify(self)
        if (!self) return (NSUInteger){0};
        return listContainerViewDefaultOffset;
    };
}

-(JobsRetUIViewByJXPagerViewBlock _Nonnull)viewForPinSectionHeaderInPagerView{
    @jobs_weakify(self)
    return ^UIView *(JXPagerView * pagerView){
        @jobs_strongify(self)
        if (!self) return nil;
        return self.categoryView;
    };
}

-(JobsRetNSIntegerByJXPagerViewBlock _Nonnull)numberOfListsInPagerView{
    @jobs_weakify(self)
    return ^NSInteger(JXPagerView * pagerView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return self.titleMutArr.count;
    };
}

- (id<JXPagerViewListViewDelegate>)pagerView:(JXPagerView *)pagerView
                             initListAtIndex:(NSInteger)index {
    return self.childVCMutArr[index];
}
#pragma mark —— lazyLoad
-(JXPagerView *)pagerView{
    if (!_pagerView) {
        _pagerView = jobsMakeCategoryPagerView(self);
        self.view.addSubview(_pagerView);
        _pagerView.frame = CGRectMake(0,
                                      JobsNavigationBarAndStatusBarHeight(nil) + self.getTopLineLabSize().height,
                                      JobsMainScreen_WIDTH(),
                                      JobsMainScreen_HEIGHT());
        _pagerView.byPinSectionHeaderVerticalOffset(JobsWidth(0));
    };return _pagerView;
}

-(BaiShaETProjCollectionHeaderView *)collectionHeaderView{
    if (!_collectionHeaderView) {
        _collectionHeaderView = BaiShaETProjCollectionHeaderView.new;
        _collectionHeaderView.frame = CGRectMake(0,
                                                 JobsNavigationBarAndStatusBarHeight(nil),
                                                 BaiShaETProjCollectionHeaderView.viewSizeByModel(nil).width,
                                                 BaiShaETProjCollectionHeaderView.viewSizeByModel(nil).height);
        _collectionHeaderView.byZoom(YES);
        _collectionHeaderView.jobsRichViewByModel(nil);
    };return _collectionHeaderView;
}

-(JXCategoryTitleView *)categoryView{
    if (!_categoryView) {
        @jobs_weakify(self)
        _categoryView = jobsMakeCategoryTitleView(^(JXCategoryTitleView * _Nullable view) {
            @jobs_strongify(self)
            view
                .byTitleSelectedColor(JobsWhiteColor)
                .byTitleColor(JobsWhiteColor)
                .byTitleFont(UIFontWeightRegularSize(JobsWidth(18)))
                .byTitleSelectedFont(UIFontWeightRegularSize(JobsWidth(28)))
                .byTitles(self.titleMutArr)
                .byTitleColorGradientEnabled(YES)
                .byIndicators(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
                    arr.add(jobsMakeCategoryIndicatorLineView(^(JXCategoryIndicatorLineView * _Nullable view) {
                        view
                            .byIndicatorColor(HEXCOLOR(0xFFEABA))
                            .byIndicatorHeight(JobsWidth(4))
                            .byIndicatorWidthIncrement(JobsWidth(10))
                            .byVerticalMargin(0);
                    }));
                }))
                .byDefaultSelectedIndex(1)
                .byCellSpacing(JobsWidth(-20))
                .byListContainer((id<JXCategoryViewListContainer>)self.pagerView.listContainerView)
                .byDelegate(self)
                .byBgColor(JobsClearColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(0);
                    make.left.right.equalTo(self.view);
                    make.height.mas_equalTo(listContainerViewDefaultOffset);
                });[self.view layoutIfNeeded];
        });
    };return _categoryView;
}

-(BaseButton *)ruleBtn{
    if (!_ruleBtn) {
        @jobs_weakify(self)
        _ruleBtn = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetBtnTitleCor(JobsLabelColor)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(@"VIP規則".jobsTr())
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                toastBy(@"VIP規則".jobsTr());
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
    };return _ruleBtn;
}

-(NSMutableArray<NSString *>*)titleMutArr{
    if (!_titleMutArr) {
        _titleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data) {
            for (int i = 0; i <= 5; i++) {
                data.add(@"Lv".add(toStringByInt(i)).jobsTr());
            }
        });
    };return _titleMutArr;
}

-(NSMutableArray<__kindof UIViewController *>*)childVCMutArr{
    if (!_childVCMutArr) {
        @jobs_weakify(self)
        _childVCMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIViewController *>*_Nullable data) {
            @jobs_strongify(self)
            for (NSString *str in self.titleMutArr) {
                data.add(JXCategoryViewWithHeaderViewSubVC.new
                    .byJobsTag([self.titleMutArr indexOfObject:str]));
            }
        });
    };return _childVCMutArr;
}

@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JXPagerView
@implementation JXPagerView (JobsLocalPropertyDSLAutogen_3c987acc13)
-(JobsRetJXPagerViewByNSIntegerBlock _Nonnull)byPinSectionHeaderVerticalOffset{
    @jobs_weakify(self)
    return ^__kindof JXPagerView * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setPinSectionHeaderVerticalOffset:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JXPagerView
