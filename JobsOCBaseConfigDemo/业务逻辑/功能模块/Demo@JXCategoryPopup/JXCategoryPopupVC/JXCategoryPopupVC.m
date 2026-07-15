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

@end

@implementation JXCategoryPopupVC
- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        self.viewModel
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(data.attributedTitle.string);
                data.byTextCor(HEXCOLOR(0x3D4A58));
                data.byFont(UIFontWeightRegularSize(18));
            });
    }
//    self.viewModel.textModel.text = @"JXCategoryPopupVC".tr;
    self.bgImage = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(HEXCOLOR(0xF7E7D2));
    self.makeNavByAlpha(1);
    self.categoryView.byAlpha(1);
    self.filterBtn.byAlpha(1);
    self.customBtn.byAlpha(1);
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

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— 一些私有方法
-(NSInteger)jobsCurrentListIndex{
    if (!self.childVCMutArr.count) return 0;
    NSInteger index = self.categoryView.selectedIndex;
    id value = [self.listContainerView valueForKey:@"currentIndex"];
    if ([value respondsToSelector:@selector(integerValue)]) {
        index = [value integerValue];
    }
    if (index < 0 || (NSUInteger)index >= self.childVCMutArr.count) {
        index = MIN(MAX(index, 0), (NSInteger)self.childVCMutArr.count - 1);
    };return index;
}

-(JXCategoryPopupSubVC *)jobsCurrentPopupSubVC{
    if (!self.childVCMutArr.count) return nil;
    self.currentIndex = [self jobsCurrentListIndex];
    UIViewController *vc = self.childVCMutArr[(NSUInteger)self.currentIndex];
    if (![vc isKindOfClass:JXCategoryPopupSubVC.class]) return nil;
    return (JXCategoryPopupSubVC *)vc;
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
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView{
    return self.titleMutArr.count;
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
- (BOOL)tf_popupViewWillHide:(UIView *)popup{
    if (self.filterBtn.selected) {
        self.filterBtn.selected = NO;
        [self.filterBtn changeAction:NO];
    };return YES;
}

- (BOOL)tf_popupViewWillShow:(UIView *)popup{
    [popup showDefaultBackground];
    return YES;
}
#pragma mark —— LazyLoad
-(JXCategoryTitleView *)categoryView{
    if (!_categoryView) {
        _categoryView = JXCategoryTitleView.new;
        _categoryView.byBgColor(RGBA_COLOR(255, 238, 221, 0.98));
        _categoryView.titleSelectedColor = HEXCOLOR(0xAE8330);
        _categoryView.titleColor = HEXCOLOR(0x8D765C);
        _categoryView.titleFont = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        _categoryView.titleSelectedFont = [UIFont systemFontOfSize:22 weight:UIFontWeightSemibold];
        _categoryView.delegate = self;
        _categoryView.titles = self.titleMutArr;
        _categoryView.titleColorGradientEnabled = YES;
        _categoryView.indicators = @[self.lineView];//
        _categoryView.defaultSelectedIndex = 1;// 默认从第二个开始显示
        _categoryView.cellSpacing = JobsWidth(8);
        // 关联cotentScrollView，关联之后才可以互相联动！！！
        _categoryView.contentScrollView = self.listContainerView.scrollView;//
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
        _lineView.indicatorColor = HEXCOLOR(0xAE8330);
        _lineView.indicatorHeight = JobsWidth(3);
        _lineView.indicatorWidthIncrement = JobsWidth(6);
        _lineView.verticalMargin = 0;
    };return _lineView;
}
/// 此属性决定依附于此的viewController
-(JXCategoryListContainerView *)listContainerView{
    if (!_listContainerView) {
        _listContainerView = [JXCategoryListContainerView.alloc initWithType:JXCategoryListContainerType_CollectionView
                                                                    delegate:self];
        _listContainerView.defaultSelectedIndex = 1;// 默认从第二个开始显示
        _listContainerView.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(listContainerViewDefaultOffset);
            make.left.right.bottom.equalTo(self.view);
        });
        [self.view layoutIfNeeded];
        /// ❤️在需要的地方写❤️
        JobsLog(@"滑动或者点击以后，改变控制器，得到的目前最新的index = %ld",(long)[self jobsCurrentListIndex]);
    };return _listContainerView;
}

-(NSMutableArray<NSString *> *)titleMutArr{
    if (!_titleMutArr) {
        _titleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data) {
            data.add(@"全部游戏".tr);
            data.add(@"真人".tr);
            data.add(@"体育".tr);
            data.add(@"电子".tr);
            data.add(@"棋牌".tr);
            data.add(@"彩票".tr);
        });
    };return _titleMutArr;
}

-(NSMutableArray<__kindof UIViewController *> *)childVCMutArr{
    if (!_childVCMutArr) {
        @jobs_weakify(self)
        _childVCMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIViewController *>*_Nullable data) {
            @jobs_strongify(self)
            for (NSString *str in self.titleMutArr) {
                JXCategoryPopupSubVC *vc = JXCategoryPopupSubVC.new;
                vc.pageTitle = str;
                data.add(vc);
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
            .jobsResetBtnTitleCor(HEXCOLOR(0x3D4A58))
            .jobsResetBtnTitleFont(fontName(@"NotoSans-Bold", 12))
            .jobsResetBtnTitle(@"篩選".tr)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                x.selected = !x.selected;
                @"篩選".tr.toast();
                [x changeAction:x.selected];
                self.vc = [self jobsCurrentPopupSubVC];
                JobsLog(@"滑动或者点击以后，改变控制器，得到的目前最新的index = %ld",(long)self.currentIndex);
                if (!self.vc) {
                    x.selected = NO;
                    [x changeAction:NO];
                    return;
                }
                self.vc.hidePopupView(self.popUpCustomView);
                if (x.selected) {
                    self.customBtn.selected = NO;
                    self.customBtn.jobsResetBtnTitleCor(HEXCOLOR(0x3D4A58));
                    self.popUpFiltrationView = self.vc.filtrationView;
                    self.popUpFiltrationView.popupDelegate = self;
                    [self.vc popUpFiltrationView];
                }else{
                    self.vc.hidePopupView(self.popUpFiltrationView);
                    self.popUpFiltrationView = nil;
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
            .bgColorBy(RGBA_COLOR(255, 255, 255, 0.92))
            .jobsResetBtnTitleCor(HEXCOLOR(0x3D4A58))
            .jobsResetBtnTitleFont(fontName(@"NotoSans-Bold", 12))
            .jobsResetBtnTitle(@"自定义".tr)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                x.selected = !x.selected;
                x.jobsResetBtnTitleCor(x.selected ? HEXCOLOR(0xAE8330) : HEXCOLOR(0x3D4A58));
                @"自定义".tr.toast();
                self.vc = [self jobsCurrentPopupSubVC];
                JobsLog(@"滑动或者点击以后，改变控制器，得到的目前最新的index = %ld",(long)self.currentIndex);
                if (!self.vc) {
                    x.selected = NO;
                    x.jobsResetBtnTitleCor(HEXCOLOR(0x3D4A58));
                    return;
                }
                self.popUpFiltrationView = self.vc.filtrationView;
                self.vc.hidePopupView(self.popUpFiltrationView);
                if (x.selected) {
                    self.filterBtn.selected = NO;
                    [self.filterBtn changeAction:NO];
                    self.popUpCustomView = self.vc.popUpCustomView;
    //                self.popUpCustomView.popupDelegate = self;
                }else{
                    self.vc.hidePopupView(self.popUpCustomView);
                    self.popUpCustomView = nil;
                }
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .selectedStateTitleColorBy(HEXCOLOR(0xAE8330))
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.right.equalTo(self.filterBtn.mas_left).offset(JobsWidth(-8));
                make.top.bottom.equalTo(self.categoryView);
                make.left.equalTo(self.categoryView.mas_right);
                make.width.mas_equalTo(JobsWidth(64));
            });
    };return _customBtn;
}

@end
