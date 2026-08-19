//
//  JXCategoryViewVerticalShowVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryViewVerticalShowVC.h"

@interface JXCategoryViewVerticalShowVC ()
/// UI
Prop_strong()JXCategoryTitleView *categoryView;/// 文字
Prop_strong()JXCategoryIndicatorLineView *lineView;/// 跟随的指示器
Prop_strong()JXCategoryListContainerView *listContainerView;/// 此属性决定依附于此的viewController
/// Data
Prop_strong()NSMutableArray <__kindof UIViewController *>*childVCMutArr;
Prop_strong()NSMutableArray <NSString *>*titleMutArr;
//Prop_strong()NSMutableArray <NSString *>*imageNames;
//Prop_strong()NSMutableArray <NSString *>*selectedImageNames;

@end

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JXCategoryIndicatorLineView
@interface JXCategoryIndicatorLineView (JobsLocalPropertyDSLAutogen_89b09737f6)
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

@implementation JXCategoryViewVerticalShowVC
- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsNotificationCenter.remove(self);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryViewVerticalShowVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                    .byText(@"JXCategoryView演示".jobsTr())
                    .byFont(UIFontWeightRegularSize(16));
            })
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
            .byBgCor(JobsSystemBackgroundColor)
            //    self.viewModel.bgImage = @"启动页SLOGAN".img;
            .byNavBgCor(JobsSystemBackgroundColor)
            .byNavBgImage(nil);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryViewVerticalShowVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
            [super viewDidLoad];
            self.makeNavByAlpha(1);
        //    self.categoryView.alpha = 1;
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryViewVerticalShowVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
            [super viewWillAppear:animated];
        //    self.view.transformByRadians(1.5f);
    };
}

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryViewVerticalShowVC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewWillLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillLayoutSubviews];
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryViewVerticalShowVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryViewVerticalShowVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
        self.getCollectionViewCell();
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryViewVerticalShowVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
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
/// 只有在viewDidAppear才能获取到UICollectionViewCell
-(jobsByVoidBlock _Nonnull)getCollectionViewCell{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
    //    JXCategoryBaseCell *cell = (JXCategoryBaseCell *)[self.categoryView.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:2 inSection:0]];
    //    NSArray <UICollectionViewCell *>*visibleCells = self.categoryView.collectionView.visibleCells;
        JobsLog(@"");
        for (UICollectionViewCell *cell in self.categoryView.collectionView.visibleCells) {
    //        cell.transformByRadians(.5f);
        }
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
/// 传递scrolling事件给listContainerView，必须调用！！！
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
#pragma mark —— lazyLoad
-(JXCategoryTitleView *)categoryView{
    if (!_categoryView) {
        _categoryView = JXCategoryTitleView.new;
        _categoryView.byBgColor(JobsCyanColor);
        _categoryView.byTitleSelectedColor(JobsRedColor);
        _categoryView.byTitleColor(JobsRedColor);
//        _categoryView.titleFont = UIFontWeightRegularSize(16);
//        _categoryView.titleSelectedFont = UIFontWeightBoldSize(16);
        _categoryView.byDelegate(self);
        _categoryView.byTitles(self.titleMutArr);
        _categoryView.byTitleColorGradientEnabled(YES);
        _categoryView.byIndicators(@[self.lineView]);
        _categoryView.byDefaultSelectedIndex(1);
        _categoryView.byCellSpacing(JobsWidth(15));
        // 关联cotentScrollView，关联之后才可以互相联动！！！
        _categoryView.byContentScrollView(self.listContainerView.scrollView);
        _categoryView.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(self.gk_navigationBar.height);
            make.left.right.equalTo(self.view);
            make.height.mas_equalTo(listContainerViewDefaultOffset);
        });
        [self.view layoutIfNeeded];
        /// 本来的值
//        _categoryView.frame = CGRectMake(0,
//                                         self.gk_navigationBar.height,
//                                         JobsMainScreen_WIDTH(),
//                                         listContainerViewDefaultOffset);
    };return _categoryView;
}

-(JXCategoryIndicatorLineView *)lineView{
    if (!_lineView) {
        _lineView = JXCategoryIndicatorLineView.new;
        _lineView.byIndicatorColor(JobsWhiteColor);
        _lineView.byIndicatorHeight(JobsWidth(4));
        _lineView.byIndicatorWidthIncrement(JobsWidth(10));
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
            make.top.equalTo(self.view).offset(listContainerViewDefaultOffset + self.gk_navigationBar.height);
            make.left.right.bottom.equalTo(self.view);
        });
        [self.view layoutIfNeeded];
        /// 本来的值
//        _listContainerView.frame = CGRectMake(0,
//                                              (listContainerViewDefaultOffset + self.gk_navigationBar.height),
//                                              JobsMainScreen_WIDTH(),
//                                              JobsMainScreen_HEIGHT() - (listContainerViewDefaultOffset + self.gk_navigationBar.height));
        /// ❤️在需要的地方写❤️
        NSNumber *currentIndex = [self.listContainerView valueForKey:@"currentIndex"];
        JobsLog(@"滑动或者点击以后，改变控制器，得到的目前最新的index = %d",currentIndex.intValue);
    };return _listContainerView;
}

-(NSMutableArray<NSString *> *)titleMutArr{
    if (!_titleMutArr) {
        _titleMutArr = NSMutableArray.array;
        _titleMutArr
            .add(@"豆花".jobsTr())
            .add(@"莲子羹".jobsTr())
            .add(@"蒸肉".jobsTr())
            .add(@"排骨".jobsTr())
            .add(@"美女".jobsTr())
            .add(@"豪车".jobsTr());
    };return _titleMutArr;
}

-(NSMutableArray<__kindof UIViewController *> *)childVCMutArr{
    if (!_childVCMutArr) {
        _childVCMutArr = NSMutableArray.array;
        for (NSString *str in self.titleMutArr) {
            _childVCMutArr.add(JXCategoryViewVerticalShowSubBaseVC.new
                .byPageTitle(str));
        }
    };return _childVCMutArr;
}

@end
