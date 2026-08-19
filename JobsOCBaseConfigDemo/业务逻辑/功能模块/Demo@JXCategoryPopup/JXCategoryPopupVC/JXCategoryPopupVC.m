//
//  JXCategoryPopupVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryPopupVC.h"

@interface JXCategoryPopupVC ()
/// UI
Prop_strong()JXCategoryTitleView *categoryView;
Prop_strong()JXCategoryIndicatorLineView *lineView;/// 跟随的指示器
Prop_strong()JXCategoryListContainerView *listContainerView;/// 此属性决定依附于此的viewController
Prop_strong()BaseButton *filterBtn;
Prop_strong()BaseButton *customBtn;
Prop_strong()UIView *popUpFiltrationView;
Prop_strong()UIView *popUpCustomView;
Prop_assign()NSInteger currentIndex;
Prop_strong()JXCategoryPopupSubVC *vc;
/// Data
Prop_strong()NSMutableArray <NSString *>*titleMutArr;
Prop_strong()NSMutableArray <__kindof UIViewController *>*childVCMutArr;

-(JobsRetJXCategoryPopupVCBySubVCBlock _Nonnull)byVc;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JXCategoryPopupVC
@interface JXCategoryPopupVC (JobsPropertyDSLSetterAutogen_2ef4143f41)
-(void)setCurrentIndex:(NSInteger)data;
-(void)setPopUpCustomView:(UIView * _Nullable)data;
-(void)setPopUpFiltrationView:(UIView * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JXCategoryPopupVC

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JXCategoryIndicatorLineView
@interface JXCategoryIndicatorLineView (JobsLocalPropertyDSLAutogen_2ef4143f41)
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

@implementation JXCategoryPopupVC

-(JobsRetJXCategoryPopupVCBySubVCBlock _Nonnull)byVc{
    @jobs_weakify(self)
    return ^__kindof JXCategoryPopupVC *_Nullable(JXCategoryPopupSubVC *_Nullable viewController){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setVc:viewController];
        return self;
    };
}

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryPopupVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                self.viewModel
                    .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                        data
                            .byText(data.attributedTitle.string)
                            .byTextCor(JobsLabelColor)
                            .byFont(UIFontWeightRegularSize(18));
                    });
            }
        //    self.viewModel.textModel.text = @"JXCategoryPopupVC".jobsTr();
            self.byBgImage(nil);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryPopupVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
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
        self.categoryView.byAlpha(1);
        self.filterBtn.byAlpha(1);
        self.customBtn.byAlpha(1);
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryPopupVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryPopupVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryPopupVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryPopupVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
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
#pragma mark —— 一些私有方法
-(JobsRetNSIntegerByVoidBlock _Nonnull)jobsCurrentListIndex{
    @jobs_weakify(self)
    return ^NSInteger{
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        if (!self.childVCMutArr.count) return 0;
        NSInteger index = self.categoryView.selectedIndex;
        id value = [self.listContainerView valueForKey:@"currentIndex"];
        if ([value respondsToSelector:@selector(integerValue)]) {
            index = [value integerValue];
        }
        if (index < 0 || (NSUInteger)index >= self.childVCMutArr.count) {
            index = MIN(MAX(index, 0), (NSInteger)self.childVCMutArr.count - 1);
        };return index;
    };
}

-(JobsRetJXCategoryPopupSubVCByVoidBlock _Nonnull)jobsCurrentPopupSubVC{
    @jobs_weakify(self)
    return ^JXCategoryPopupSubVC *{
        @jobs_strongify(self)
        if (!self) return nil;
        if (!self.childVCMutArr.count) return nil;
        self.byCurrentIndex(self.jobsCurrentListIndex());
        UIViewController *vc = self.childVCMutArr[(NSUInteger)self.currentIndex];
        if (![vc isKindOfClass:JXCategoryPopupSubVC.class]) return nil;
        return (JXCategoryPopupSubVC *)vc;
    };
}
#pragma mark JXCategoryTitleViewDataSource
//// 如果将JXCategoryTitleView嵌套进UITableView的cell，每次重用的时候，JXCategoryTitleView进行reloadData时，会重新计算所有的title宽度。所以该应用场景，需要UITableView的cellModel缓存titles的文字宽度，再通过该代理方法返回给JXCategoryTitleView。
//// 如果实现了该方法就以该方法返回的宽度为准，不触发内部默认的文字宽度计算。
//- (CGFloat)categoryTitleView:(JXCategoryTitleView *)titleView
//               widthForTitle:(NSString *)title{
//
//    return 10;
//}
#pragma mark JXCategoryListContainerViewDelegate
/**
 返回list的数量
 
 @param listContainerView 列表的容器视图
 @return list的数量
 */
-(JobsRetNSIntegerByJXCategoryListContainerViewBlock _Nonnull)numberOfListsInlistContainerView{
    @jobs_weakify(self)
    return ^NSInteger(JXCategoryListContainerView * listContainerView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return self.titleMutArr.count;
    };
}
/**
 根据index初始化一个对应列表实例，需要是遵从`JXCategoryListContentViewDelegate`协议的对象。
 如果列表是用自定义UIView封装的，就让自定义UIView遵从`JXCategoryListContentViewDelegate`协议，该方法返回自定义UIView即可。
 如果列表是用自定义UIViewController封装的，就让自定义UIViewController遵从`JXCategoryListContentViewDelegate`协议，该方法返回自定义UIViewController即可。
 
 @param listContainerView 列表的容器视图
 @param index 目标下标
 @return 遵从JXCategoryListContentViewDelegate协议的list实例
 */
- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView
initListForIndex:(NSInteger)index{
    if (index < 0 || (NSUInteger)index >= self.childVCMutArr.count) return nil;
    return self.childVCMutArr[index];
}
#pragma mark JXCategoryViewDelegate
///【点击的结果】点击选中的情况才会调用该方法。传递didClickSelectedItemAt事件给listContainerView
- (void)categoryView:(JXCategoryBaseView *)categoryView
didClickSelectedItemAtIndex:(NSInteger)index {
    [self.listContainerView didClickSelectedItemAtIndex:index];
}
///【点击选中或者滚动选中的结果】点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，不关心具体是点击还是滚动选中的。
- (void)categoryView:(JXCategoryBaseView *)categoryView
didSelectedItemAtIndex:(NSInteger)index {
}
///【滚动选中的结果】滚动选中的情况才会调用该方法
- (void)categoryView:(JXCategoryBaseView *)categoryView
didScrollSelectedItemAtIndex:(NSInteger)index{
}
//传递scrolling事件给listContainerView，必须调用！！！
- (void)categoryView:(JXCategoryBaseView *)categoryView
scrollingFromLeftIndex:(NSInteger)leftIndex
toRightIndex:(NSInteger)rightIndex
ratio:(CGFloat)ratio {
    JobsLog(@"");
    //    [self.listContainerView scrollingFromLeftIndex:leftIndex
    //                                      toRightIndex:rightIndex
    //                                             ratio:ratio
    //                                     selectedIndex:categoryView.selectedIndex];
}
#pragma mark —— TFPopupDelegate
/// 在 tf_hide 之后执行
-(JobsRetBOOLByViewBlock _Nonnull)tf_popupViewWillHide{
    @jobs_weakify(self)
    return ^BOOL(UIView * popup){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        if (self.filterBtn.selected) {
            self.filterBtn.bySelected(NO);
            self.filterBtn.changeAction(NO);
        };return YES;
    };
}

-(JobsRetBOOLByViewBlock _Nonnull)tf_popupViewWillShow{
    @jobs_weakify(self)
    return ^BOOL(UIView * popup){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        [popup showDefaultBackground];
        return YES;
    };
}
#pragma mark —— LazyLoad
-(JXCategoryTitleView *)categoryView{
    if (!_categoryView) {
        _categoryView = JXCategoryTitleView.new;
        _categoryView.byBgColor(RGBA_COLOR(255, 238, 221, 0.98));
        _categoryView.byTitleSelectedColor(HEXCOLOR(0xAE8330));
        _categoryView.byTitleColor(HEXCOLOR(0x8D765C));
        _categoryView.byTitleFont(UIFontWeightRegularSize(16));
        _categoryView.byTitleSelectedFont(UIFontWeightSemiboldSize(22));
        _categoryView.byDelegate(self);
        _categoryView.byTitles(self.titleMutArr);
        _categoryView.byTitleColorGradientEnabled(YES);
        _categoryView.byIndicators(@[self.lineView]);
        _categoryView.byDefaultSelectedIndex(1);
        _categoryView.byCellSpacing(JobsWidth(8));
        // 关联cotentScrollView，关联之后才可以互相联动！！！
        _categoryView.byContentScrollView(self.listContainerView.scrollView);
        _categoryView.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view).offset(JobsWidth(-130));
            make.height.mas_equalTo(listContainerViewDefaultOffset);
        });
        [self.view layoutIfNeeded];
    };return _categoryView;
}

-(JXCategoryIndicatorLineView *)lineView{
    if (!_lineView) {
        _lineView = JXCategoryIndicatorLineView.new;
        _lineView.byIndicatorColor(HEXCOLOR(0xAE8330));
        _lineView.byIndicatorHeight(JobsWidth(3));
        _lineView.byIndicatorWidthIncrement(JobsWidth(6));
        _lineView.byVerticalMargin(0);
    };return _lineView;
}
/// 此属性决定依附于此的viewController
-(JXCategoryListContainerView *)listContainerView{
    if (!_listContainerView) {
        _listContainerView = [JXCategoryListContainerView.alloc initWithType:JXCategoryListContainerType_CollectionView
                                                                    delegate:self];
        _listContainerView.byDefaultSelectedIndex(1);
        _listContainerView.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(listContainerViewDefaultOffset);
            make.left.right.bottom.equalTo(self.view);
        });
        [self.view layoutIfNeeded];
        /// ❤️在需要的地方写❤️
        JobsLog(@"滑动或者点击以后，改变控制器，得到的目前最新的index = %ld",(long)[self jobsCurrentListIndex]());
    };return _listContainerView;
}

-(NSMutableArray<NSString *> *)titleMutArr{
    if (!_titleMutArr) {
        _titleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data) {
            data
                .add(@"全部游戏".jobsTr())
                .add(@"真人".jobsTr())
                .add(@"体育".jobsTr())
                .add(@"电子".jobsTr())
                .add(@"棋牌".jobsTr())
                .add(@"彩票".jobsTr());
        });
    };return _titleMutArr;
}

-(NSMutableArray<__kindof UIViewController *> *)childVCMutArr{
    if (!_childVCMutArr) {
        @jobs_weakify(self)
        _childVCMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIViewController *>*_Nullable data) {
            @jobs_strongify(self)
            for (NSString *str in self.titleMutArr) {
                data.add(JXCategoryPopupSubVC.new.byPageTitle(str));
            }
        });
    };return _childVCMutArr;
}

-(BaseButton *)filterBtn{
    if (!_filterBtn) {
        @jobs_weakify(self)
        _filterBtn = BaseButton.jobsInit()
            .bgColorBy(RGBA_COLOR(255, 255, 255, 0.92))
            .jobsResetImagePlacement(NSDirectionalRectEdgeTrailing)
            .jobsResetImagePadding(JobsWidth(6))
            .jobsResetBtnImage(@"筛选箭头（向下）".img)
            .jobsResetBtnTitleCor(JobsLabelColor)
            .jobsResetBtnTitleFont(fontName(@"NotoSans-Bold", 12))
            .jobsResetBtnTitle(@"篩選".jobsTr())
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                x.bySelected(!x.selected);
                @"篩選".jobsTr().toast();
                x.changeAction(x.selected);
                self.byVc(self.jobsCurrentPopupSubVC());
                JobsLog(@"滑动或者点击以后，改变控制器，得到的目前最新的index = %ld",(long)self.currentIndex);
                if (!self.vc) {
                    x.bySelected(NO);
                    x.changeAction(NO);
                    return;
                }
                self.vc.hidePopupView(self.popUpCustomView);
                if (x.selected) {
                    self.customBtn.bySelected(NO);
                    self.customBtn.jobsResetBtnTitleCor(JobsLabelColor);
                    self.byPopUpFiltrationView(self.vc.filtrationView);
                    self.popUpFiltrationView.byPopupDelegate(self);
                    self.vc.popUpFiltrationView();
                }else{
                    self.vc.hidePopupView(self.popUpFiltrationView);
                    self.byPopUpFiltrationView(nil);
                }
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .makeBtnTitleByShowingType(UILabelShowingType_03)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.right.equalTo(self.view);
                make.top.bottom.equalTo(self.categoryView);
                make.width.mas_equalTo(JobsWidth(58));
            });
    };return _filterBtn;
}

-(BaseButton *)customBtn{
    if (!_customBtn) {
        @jobs_weakify(self)
        _customBtn = BaseButton.jobsInit()
            .jobsResetBtnTitleCor(JobsLabelColor)
            .jobsResetBtnTitleFont(fontName(@"NotoSans-Bold", 12))
            .jobsResetBtnTitle(@"自定义".jobsTr())
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                BOOL selected = !x.selected;
                x
                    .jobsResetBtnTitleCor(selected ? HEXCOLOR(0xAE8330) : JobsLabelColor)
                    .bySelected(selected);
                @"自定义".jobsTr().toast();
                self.byVc(self.jobsCurrentPopupSubVC());
                JobsLog(@"滑动或者点击以后，改变控制器，得到的目前最新的index = %ld",(long)self.currentIndex);
                if (!self.vc) {
                    x
                        .jobsResetBtnTitleCor(JobsLabelColor)
                        .bySelected(NO);
                    return;
                }
                self.byPopUpFiltrationView(self.vc.filtrationView);
                self.vc.hidePopupView(self.popUpFiltrationView);
                if (x.selected) {
                    self.filterBtn.bySelected(NO);
                    self.filterBtn.changeAction(NO);
                    self.byPopUpCustomView(self.vc.popUpCustomView());
    //                self.popUpCustomView.popupDelegate = self;
                }else{
                    self.vc.hidePopupView(self.popUpCustomView);
                    self.byPopUpCustomView(nil);
                }
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .selectedStateTitleColorBy(HEXCOLOR(0xAE8330))
            .bgColorBy(RGBA_COLOR(255, 255, 255, 0.92))
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.right.equalTo(self.filterBtn.mas_left).offset(JobsWidth(-8));
                make.top.bottom.equalTo(self.categoryView);
                make.left.equalTo(self.categoryView.mas_right);
                make.width.mas_equalTo(JobsWidth(64));
            });
    };return _customBtn;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JXCategoryPopupVC
-(JobsRetJXCategoryPopupVCByNSIntegerBlock _Nonnull)byCurrentIndex{
    @jobs_weakify(self)
    return ^__kindof JXCategoryPopupVC * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setCurrentIndex:data];
        return self;
    };
}

-(JobsRetJXCategoryPopupVCByUIViewBlock _Nonnull)byPopUpCustomView{
    @jobs_weakify(self)
    return ^__kindof JXCategoryPopupVC * _Nullable(UIView * _Nullable data){
        @jobs_strongify(self)
        [self setPopUpCustomView:data];
        return self;
    };
}

-(JobsRetJXCategoryPopupVCByUIViewBlock _Nonnull)byPopUpFiltrationView{
    @jobs_weakify(self)
    return ^__kindof JXCategoryPopupVC * _Nullable(UIView * _Nullable data){
        @jobs_strongify(self)
        [self setPopUpFiltrationView:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JXCategoryPopupVC
@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JXCategoryIndicatorLineView
@implementation JXCategoryIndicatorLineView (JobsLocalPropertyDSLAutogen_2ef4143f41)
-(JobsRetJXCategoryIndicatorLineViewByCGFloatBlock _Nonnull)byIndicatorHeight{
    @jobs_weakify(self)
    return ^__kindof JXCategoryIndicatorLineView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setIndicatorHeight:data];
        return self;
    };
}

-(JobsRetJXCategoryIndicatorLineViewByCGFloatBlock _Nonnull)byIndicatorWidthIncrement{
    @jobs_weakify(self)
    return ^__kindof JXCategoryIndicatorLineView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setIndicatorWidthIncrement:data];
        return self;
    };
}

-(JobsRetJXCategoryIndicatorLineViewByCGFloatBlock _Nonnull)byVerticalMargin{
    @jobs_weakify(self)
    return ^__kindof JXCategoryIndicatorLineView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setVerticalMargin:data];
        return self;
    };
}

-(JobsRetJXCategoryIndicatorLineViewByUIColorBlock _Nonnull)byIndicatorColor{
    @jobs_weakify(self)
    return ^__kindof JXCategoryIndicatorLineView * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setIndicatorColor:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JXCategoryIndicatorLineView
