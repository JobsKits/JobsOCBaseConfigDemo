//
//  JobsVerticalMenuVC@0.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsVerticalMenuVC@0.h"

@interface JobsVerticalMenuVC_0 ()
/// UI
Prop_strong()BaseButton *editBtn;
Prop_strong()JobsSearchBar *searchView;
Prop_strong()BaseButton *searchToggleBtn;
Prop_strong()MASConstraint *searchViewWidthConstraint;
/// Data
Prop_strong()NSMutableArray <__kindof UIView *>*rightViewArray; /// 右侧的视图数组
Prop_strong()NSMutableArray <__kindof UIViewModel *>*titleMutArr;
Prop_strong()NSMutableArray <__kindof UIViewModel *>*leftDataArray; /// 左边的数据源
Prop_strong()UIViewModel *leftViewCurrentSelectModel;
Prop_assign()BOOL searchMode;

@end

@implementation JobsVerticalMenuVC_0

- (void)dealloc {
    JobsLog(@"%@", JobsLocalFunc);
    JobsRemoveNotification(self);
}

- (void)loadView {
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
            data.byText(data.attributedTitle.string);
            data.byFont(UIFontWeightRegularSize(16));
        })
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        //    self.viewModel.bgImage = @"启动页SLOGAN".img;
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
    self.makeSubViews();
}

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
    self.displayView(self.rightViewArray[0]);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
#pragma mark —— 一些私有方法
/// 创建右侧视图
- (jobsByVoidBlock _Nonnull)makeSubViews {
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        self.rightViewArray = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            for (int i = 0; i < self.titleMutArr.count; i++) {
                JobsVerticalMenuSubView *subView = JobsVerticalMenuSubView.new;
                subView.byBgColor(HEXCOLOR(0xF7F8FA));
                data.add(subView);
            }
        });
    };
}

//-(JobsRetViewByClassBlock _Nonnull)makeSubViews{
//    return ^UIView *_Nullable(Class _Nonnull cls){
//        UIView *view = cls.new;
//        view.frame = CGRectMake(MenuWidth,
//                                0,
//                                JobsRealWidth() - MenuWidth,
//                                JobsRealHeight());
//        view.jobsRichViewByModel(nil);
//        return view;
//    };
//}
/// 显示指定的右侧视图
- (jobsByViewBlock _Nonnull)displayView {
    @jobs_weakify(self)
    return ^(UIView *subview) {
        @jobs_strongify(self)
        /// 移除当前显示的视图
        for (UIView *subView in self.view.subviews) {
            if ([subView isKindOfClass:JobsVerticalMenuSubView.class]) {
                [subView removeFromSuperview];
            }
        }
        /// 添加新的视图
        subview.frame = CGRectMake(self.tableView.frame.size.width,
                                   self.tableView.top,
                                   self.view.frame.size.width - self.tableView.frame.size.width,
                                   self.view.frame.size.height - self.tableView.top);
        [self.view addSubview:subview];
        if ([subview isKindOfClass:JobsVerticalMenuSubView.class]) {
            NSUInteger index = [self.rightViewArray indexOfObject:subview];
            if (index != NSNotFound) {
                ((JobsVerticalMenuSubView *)subview).reloadContentByIndex(index);
            }
        }
    };
}

- (jobsByVoidBlock _Nonnull)refreshLeftView {
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        self.tableView.reloadDatas();
        if (self.leftDataArray.count) {
            @jobs_weakify(self)
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                NSIndexPath *indexPath = jobsMakeIndexPathZero();
                [self.tableView selectRowAtIndexPath:indexPath
                                            animated:NO
                                      scrollPosition:UITableViewScrollPositionNone];
                if ([self.tableView.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
                    [self.tableView.delegate tableView:self.tableView
                               didSelectRowAtIndexPath:indexPath];
                }
            });
        }
    };
}
#pragma mark —— UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(__kindof UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return self.titleMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(__kindof UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    @jobs_weakify(self)
    return LeftCell.cellStyleDefaultByTableView(tableView)
        .JobsRichViewByModel2(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
        @jobs_strongify(self)
        data.textModel.byText(self.titleMutArr[indexPath.row].textModel.text);
    }));
}

- (CGFloat)tableView:(__kindof UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return LeftCell.cellHeightByModel(nil);
}

- (void)tableView:(__kindof UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.displayView(self.rightViewArray[indexPath.row]);
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
            tableView.byFrame(jobsMakeCGRectByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
                @jobs_strongify(self)
                data.byJobsX(0)
                    .byJobsY(JobsTopSafeAreaHeight() + JobsStatusBarHeight() + self.gk_navigationBar.mj_h)
                    .byJobsWidth(TableViewWidth)
                    .byJobsHeight(JobsMainScreen_HEIGHT() - JobsTopSafeAreaHeight() - JobsStatusBarHeight() - JobsTabBarHeight(AppDelegate.tabBarVC) - EditBtnHeight);
            }));
        }));
    };return _tableView;
}

- (JobsSearchBar *)searchView {
    if (!_searchView) {
        @jobs_weakify(self)
        _searchView = JobsSearchBar
            .BySize(CGSizeMake(0, JobsWidth(38)))
            .JobsRichViewByModel2(nil)
            .JobsBlock1(^(id  _Nullable data) {;
                
            });
        _searchView.cancelBtnHidden = YES;
        _searchView.textField.byPlaceholder(@"请输入搜索内容".tr);
        _searchView.addOn(self.gk_navigationBar)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                self.searchViewWidthConstraint = make.width.mas_equalTo(0);
                make.height.mas_equalTo(JobsWidth(38));
                make.right.equalTo(self.searchToggleBtn.mas_left).offset(JobsWidth(-8));
                make.centerY.equalTo(self.gk_navigationBar);
            });
        _searchView.byHidden(YES);
        
//        [_jobsSearchBar actionNSIntegerBlock:^(UITextFieldFocusType data) {
//            @jobs_strongify(self)
//            switch (data) {
//                case UITextFieldGetFocus:{/// 输入框获得焦点
//                    if (self.listViewData.count) {
//                        /// 必须先移除，否则反复添加无法正常移除
//                        self.dropDownListView = [self motivateFromView:weak_self.jobsSearchBar
//                                                                  data:self.listViewData
//                                                    motivateViewOffset:JobsWidth(5)
//                                                           finishBlock:^(UIViewModel *data) {
//                            JobsLog(@"data = %@",data);
//                        }];
//                    }
//                }break;
//                case UITextFieldLoseFocus:{/// 输入框失去焦点
//                    [self endDropDownListView];
//                }break;
//                default:
//                    break;
//            }
//        }];
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

- (BaseButton *)editBtn{
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
            })
            .onLongPressGestureBy(^(id data){
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

- (NSMutableArray<__kindof UIViewModel *> *)titleMutArr {
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

- (NSMutableArray<__kindof UIViewModel *> *)leftDataArray {
    if (!_leftDataArray) {
        _leftDataArray = NSMutableArray.array;
    };return _leftDataArray;
}

- (__kindof UIViewModel *)leftViewCurrentSelectModel {
    if (!_leftViewCurrentSelectModel) {
        _leftViewCurrentSelectModel = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {});
    };return _leftViewCurrentSelectModel;
}

- (NSMutableArray<__kindof UIView *> *)rightViewArray {
    if (!_rightViewArray) {
        _rightViewArray = NSMutableArray.array;
    };return _rightViewArray;
}

@end
