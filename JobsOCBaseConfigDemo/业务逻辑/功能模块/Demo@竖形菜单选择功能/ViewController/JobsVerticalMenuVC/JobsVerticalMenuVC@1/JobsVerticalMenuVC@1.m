//
//  JobsVerticalMenuVC@1.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsVerticalMenuVC@1.h"

@interface JobsVerticalMenuVC_1 ()
/// UI
Prop_strong()BaseButton *editBtn;
Prop_strong()JobsOCSearcherBar *searchView;
Prop_strong()BaseButton *searchToggleBtn;
Prop_strong()MASConstraint *searchViewWidthConstraint;
/// Data
Prop_strong()NSMutableArray <UIViewModel *>*titleMutArr;
Prop_strong()NSMutableArray <UIViewModel *>*leftDataArray;/// 左边的数据源
Prop_strong()UIViewModel *leftViewCurrentSelectModel;
Prop_assign()BOOL searchMode;

@end

@implementation JobsVerticalMenuVC_1

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
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
            data.byText(@"右边的架构是VC".tr);
            data.byFont(UIFontWeightRegularSize(16));
        })
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        //    self.viewModel.bgImage = @"启动页SLOGAN".img;
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
    self.makeSubVC();
}

//

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
//        @jobs_strongify(self)
//        data.add(UIBarButtonItem.initBy(self.aboutBtn));
    });
    self.rightBarButtonItems = NSMutableArray.array;
    self.makeNavByAlpha(1);
    self.searchToggleBtn.byAlpha(1);
    self.searchView.byAlpha(0);
    self.tableView.byShow(self);
    self.editBtn.byAlpha(1);
    self.refreshLeftView();
    
    self.displayViewController(self.vcs[0]);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [self.collectionView setContentOffset:CGPointMake(0, JobsWidth(-5)) animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock)makeSubVC{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        /// 这里可以调用接口去获取一级目录分类的数据
        for (int i = 0; i < self.titleMutArr.count; i++){
            JobsVerticalMenuSubVC *subVC = JobsVerticalMenuSubVC.new;
            subVC.contentIndex = i;
            self.vcs.add(subVC);
        }
    };
}

-(jobsByVCBlock)displayViewController{
    @jobs_weakify(self)
    return ^(__kindof UIViewController *_Nullable viewController){
        @jobs_strongify(self)
        /// 移除当前显示的子视图控制器
        for (__kindof UIViewController *vc in self.childViewControllers) {
            [vc willMoveToParentViewController:nil];
            [vc.view removeFromSuperview];
            [vc removeFromParentViewController];
        }
        /// 添加新视图控制器
        self.addChildViewController(viewController);
        viewController.view.byFrame(self.view.bounds);
        viewController.view.resetOriginX(self.tableView.right);
        viewController.view.resetOriginY(self.tableView.top);
        viewController.view.resetWidth(self.view.width - self.tableView.width);
        viewController.view.resetHeight(self.view.height - self.tableView.top);
        self.view.addSubview(viewController.view);
        [viewController didMoveToParentViewController:self];
    };
}

-(NSMutableArray<UIViewModel *> *)titleMutArr{
    if (!_titleMutArr) {
        /// 最初默认的数据
        _titleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.byText(@"收藏".tr);
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.byText(@"真人".tr);
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.byText(@"体育".tr);
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.byText(@"电子".tr);
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.byText(@"棋牌".tr);
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.byText(@"彩票".tr);
            }));
        });
    };return _titleMutArr;
}

-(jobsByVoidBlock)refreshLeftView{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self )
        self.tableView.reloadDatas();
        if (self.leftDataArray.count){
            @jobs_weakify(self)
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                NSIndexPath *indexPath = jobsMakeIndexPathZero();
                [self.tableView selectRowAtIndexPath:indexPath
                                            animated:NO
                                      scrollPosition:UITableViewScrollPositionNone];
                if ([self.tableView.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]){
                    [self.tableView.delegate tableView:self.tableView
                               didSelectRowAtIndexPath:indexPath];
                }
            });
        }
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(__kindof UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.titleMutArr.count;
}

-(__kindof UITableViewCell *)tableView:(__kindof UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    @jobs_weakify(self)
    return LeftCell.cellStyleDefaultByTableView(tableView)
        .jobsRichElementsTableViewCellBy(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            @jobs_strongify(self)
            data.textModel.byText(self.titleMutArr[indexPath.row].textModel.text);
        }));
}

-(CGFloat)tableView:(__kindof UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return LeftCell.cellHeightByModel(nil);
}

-(void)tableView:(__kindof UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.displayViewController(self.vcs[indexPath.row]);
}

-(CGFloat)expandedSearchWidth{
    return JobsMainScreen_WIDTH() - JobsWidth(96) - JobsWidth(36) - JobsWidth(12) - JobsWidth(8);
}

-(void)refreshSearchToggleBtnByActive:(BOOL)active{
    self.searchToggleBtn
        .jobsResetBtnTitle(active ? @"×" : @"")
        .jobsResetBtnImage(active ? nil : @"放大镜".img);
}

-(void)switchSearchModeByActive:(BOOL)active{
    if (self.searchMode == active) return;
    self.searchMode = active;
    if (active) {
        self.searchView.byHidden(NO);
        [self refreshSearchToggleBtnByActive:YES];
    } else {
        [self.searchView.textField resignFirstResponder];
        self.searchView.textField.byText(@"");
    }
    [self.searchViewWidthConstraint setOffset:active ? self.expandedSearchWidth : 0];
    UIViewAnimationOptions options = active ? UIViewAnimationOptionCurveEaseOut : UIViewAnimationOptionCurveEaseIn;
    [UIView animateWithDuration:active ? .24f : .18f
                          delay:0
                        options:options
                     animations:^{
        self.gk_navTitleBtn.byAlpha(active ? 0 : 1);
        self.searchView.byAlpha(active ? 1 : 0);
        [self.gk_navigationBar layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (active) {
            [self.searchView.textField becomeFirstResponder];
        } else {
            self.searchView.byHidden(YES);
            [self refreshSearchToggleBtnByActive:NO];
        }
    }];
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView){
        @jobs_weakify(self)
        _tableView = self.view.addSubview(jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .byShowsVerticalScrollIndicator(NO);
            tableView.byBgColor(HEXCOLOR(0xFCFBFB));
            tableView.byFrame(CGRectMake(0,JobsTopSafeAreaHeight() + JobsStatusBarHeight() + self.gk_navigationBar.mj_h,
                                         TableViewWidth,JobsMainScreen_HEIGHT() - JobsTopSafeAreaHeight() - JobsStatusBarHeight() - JobsTabBarHeight(AppDelegate.tabBarVC) - EditBtnHeight));
        }));
    };return _tableView;
}

-(JobsOCSearcherBar *)searchView{
    if (!_searchView) {
        @jobs_weakify(self)
        _searchView = jobsMakeOCSearcherBar(^(__kindof JobsOCSearcherBar * _Nullable searchBar) {
            @jobs_strongify(self)
            searchBar
                .bySize(CGSizeMake(0, JobsWidth(38)))
                .JobsRichViewByModel2(nil)
                .JobsBlock1(^(id _Nullable data) {;

                });
            searchBar.cancelBtnHidden = YES;
            searchBar.textField.byPlaceholder(@"请输入搜索内容".tr);
            searchBar.addOn(self.gk_navigationBar)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    self.searchViewWidthConstraint = make.width.mas_equalTo(0);
                    make.height.mas_equalTo(JobsWidth(38));
                    make.right.equalTo(self.searchToggleBtn.mas_left).offset(JobsWidth(-8));
                    make.centerY.equalTo(self.gk_navigationBar);
                });
            searchBar.byHidden(YES);
        });
    };return _searchView;
}

-(BaseButton *)searchToggleBtn{
    if (!_searchToggleBtn) {
        @jobs_weakify(self)
        _searchToggleBtn = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetBtnTitleCor(HEXCOLOR(0xAE8330))
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(JobsWidth(22)))
            .jobsResetBtnImage(@"放大镜".img)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                [self switchSearchModeByActive:!self.searchMode];
            })
            .onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self.gk_navigationBar)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.size.mas_equalTo(CGSizeMake(JobsWidth(36), JobsWidth(36)));
                make.right.equalTo(self.gk_navigationBar).offset(JobsWidth(-12));
                make.centerY.equalTo(self.gk_navigationBar);
            })
            .cornerCutToCircleWithCornerRadius(JobsWidth(18));
    };return _searchToggleBtn;
}

-(BaseButton *)editBtn{
    if (!_editBtn) {
        @jobs_weakify(self)
        _editBtn = BaseButton.jobsInit()
            .bgColorBy(HEXCOLOR(0xFCFBFB))
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(JobsWidth(5.75))
            .jobsResetBtnBgImage(@"编辑".img)
            .jobsResetBtnTitleCor(HEXCOLOR(0xB0B0B0))
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(@"编辑".tr)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                toastBy(@"编辑".tr);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.left.equalTo(self.view);
                make.top.equalTo(self.tableView.mas_bottom);
                make.size.mas_equalTo(CGSizeMake(TableViewWidth, EditBtnHeight));
            });
    };return _editBtn;
}

-(NSMutableArray<UIViewModel *> *)leftDataArray{
    if (!_leftDataArray) {
        _leftDataArray = jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {

        });
    };return _leftDataArray;
}
@synthesize vcs = _vcs;
-(__kindof NSMutableArray<__kindof UIViewController *> *)vcs{
    if(!_vcs){
        _vcs = jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {

        });
    };return _vcs;
}

@end
