//
//  JobsDropDownListVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsDropDownListVC.h"

@interface JobsDropDownListVC ()
/// UI
Prop_strong()JobsDropDownListView *dropDownListView;
Prop_strong()UIView *panelView;
Prop_strong()UILabel *titleLab;
Prop_strong()UIView *selectedInfoView;
Prop_strong()UILabel *selectedTitleLab;
Prop_strong()UILabel *selectedSubTitleLab;
Prop_strong()BaseButton *btn;
Prop_strong()BaseButton *directionBtn;
/// Data
Prop_strong()NSMutableArray <UIViewModel *>*listViewData;
Prop_strong()UIColor *cor;
Prop_assign()JobsDropDownListViewDirection dropDownListViewDirection;

@end

@implementation JobsDropDownListVC
- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
    [self endDropDownListView];
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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(HEXCOLOR(0xF6F1E8));
    [self setupRightItems];
    self.makeNavByAlpha(1);
    self.panelView.byAlpha(1);
    self.titleLab.byAlpha(1);
    self.selectedInfoView.byAlpha(1);
    self.selectedTitleLab.byAlpha(1);
    self.selectedSubTitleLab.byAlpha(1);
    self.btn.byAlpha(1);
    [self refreshDirectionUIWithOpened:NO];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    /// 加在这里，否则要停顿一秒左右才移除
    [self endDropDownListView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self endDropDownListView];
}
#pragma mark —— 一些私有化方法
/// 移除掉这个下拉列表
-(void)endDropDownListView{
    jobsByCtrlBlock disappearBlock = _dropDownListView.dropDownListViewDisappear;
    if (disappearBlock) disappearBlock(_btn);
    _dropDownListView = nil;
    _btn.selected = NO;
    [self refreshDirectionUIWithOpened:NO];
}

-(void)refreshDirectionUIWithOpened:(BOOL)opened{
    BOOL up = self.dropDownListViewDirection == JobsDropDownListViewDirection_UP;
    UIColor *mainCor = up ? self.cor : HEXCOLOR(0x2F3645);
    if (_titleLab) {
        _titleLab
            .byText(up ? @"上拉列表".tr : @"下拉列表".tr)
            .byTextCor(up ? HEXCOLOR(0xA06A18) : HEXCOLOR(0x2F3645));
    }
    if (_directionBtn) {
        _directionBtn
            .jobsResetBtnTitle(up ? @"下拉".tr : @"上拉".tr)
            .jobsResetBtnTitleCor(up ? HEXCOLOR(0xA06A18) : HEXCOLOR(0x2F3645))
            .jobsResetBtnBgCor(JobsClearColor)
            .jobsResetBtnLayerBorderWidth(0);
    }
    if (_btn) {
        _btn
            .jobsResetBtnTitle(opened ? @"收起列表".tr : (up ? @"展开上拉列表".tr : @"展开下拉列表".tr))
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnBgCor(opened ? HEXCOLOR(0xC96E42) : mainCor)
            .jobsResetBtnLayerBorderWidth(0);
        [_btn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.panelView);
            make.centerY.equalTo(self.panelView).offset(JobsWidth(82));
            make.width.mas_equalTo(JobsWidth(240));
            make.height.mas_equalTo(JobsWidth(46));
        }];
    }
}

-(void)setupRightItems{
    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
        data.add(self.directionBtn.bySize(CGSizeMake(JobsWidth(58), JobsWidth(32))).barBtnItem);
    });
}

-(void)updateSelectedInfoWithModel:(UIViewModel *)data{
    NSString *title = data.textModel.text.length ? data.textModel.text : @"未选择".tr;
    NSString *subTitle = data.subTextModel.text.length ? data.subTextModel.text : @"请选择列表内容".tr;
    _selectedTitleLab
        .byText([NSString stringWithFormat:@"%@%@",@"点选：".tr,title])
        .byTextCor(HEXCOLOR(0x2F3645));
    _selectedSubTitleLab
        .byText(subTitle)
        .byTextCor(HEXCOLOR(0x8993A3));
}
#pragma mark —— lazyLoad
-(UIView *)panelView{
    if (!_panelView) {
        _panelView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(RGBA_COLOR(255, 255, 255, 0.94));
            view.layer.cornerRadius = JobsWidth(22);
            view.layer.shadowColor = HEXCOLOR(0x8E7B5B).CGColor;
            view.layer.shadowOpacity = 0.14f;
            view.layer.shadowRadius = JobsWidth(22);
            view.layer.shadowOffset = CGSizeMake(0, JobsWidth(12));
            view.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
                make.center.equalTo(self.view);
                make.left.equalTo(self.view).offset(JobsWidth(34));
                make.right.equalTo(self.view).offset(JobsWidth(-34));
                make.height.mas_equalTo(JobsWidth(390));
            });
        });
    };return _panelView;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"下拉列表".tr)
                .byFont(UIFontWeightSemiboldSize(22))
                .byTextAlignment(NSTextAlignmentCenter)
                .byTextCor(HEXCOLOR(0x2F3645))
                .byBgColor(JobsClearColor)
                .addOn(self.panelView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.panelView).offset(JobsWidth(24));
                    make.left.equalTo(self.panelView).offset(JobsWidth(18));
                    make.right.equalTo(self.panelView).offset(JobsWidth(-18));
                    make.height.mas_equalTo(JobsWidth(30));
                });
        });
    };return _titleLab;
}

-(UIView *)selectedInfoView{
    if (!_selectedInfoView) {
        _selectedInfoView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(HEXCOLOR(0xF7F8FA));
            view.layer.cornerRadius = JobsWidth(16);
            view.layer.borderWidth = 0;
            view.addOn(self.panelView).byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(26));
                make.left.equalTo(self.panelView).offset(JobsWidth(40));
                make.right.equalTo(self.panelView).offset(JobsWidth(-40));
                make.height.mas_equalTo(JobsWidth(64));
            });
        });
    };return _selectedInfoView;
}

-(UILabel *)selectedTitleLab{
    if (!_selectedTitleLab) {
        _selectedTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"点选：未选择".tr)
                .byFont(UIFontWeightSemiboldSize(14))
                .byTextAlignment(NSTextAlignmentLeft)
                .byNumberOfLines(1)
                .byTextCor(HEXCOLOR(0x2F3645))
                .byBgColor(JobsClearColor)
                .addOn(self.selectedInfoView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.selectedInfoView).offset(JobsWidth(8));
                    make.left.equalTo(self.selectedInfoView).offset(JobsWidth(16));
                    make.right.equalTo(self.selectedInfoView).offset(JobsWidth(-16));
                    make.height.mas_equalTo(JobsWidth(22));
                });
        });
    };return _selectedTitleLab;
}

-(UILabel *)selectedSubTitleLab{
    if (!_selectedSubTitleLab) {
        _selectedSubTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"请选择列表内容".tr)
                .byFont(UIFontWeightRegularSize(12))
                .byTextAlignment(NSTextAlignmentLeft)
                .byNumberOfLines(1)
                .byTextCor(HEXCOLOR(0x8993A3))
                .byBgColor(JobsClearColor)
                .addOn(self.selectedInfoView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.selectedTitleLab.mas_bottom).offset(JobsWidth(2));
                    make.left.equalTo(self.selectedTitleLab);
                    make.right.equalTo(self.selectedTitleLab);
                    make.height.mas_equalTo(JobsWidth(20));
                });
        });
    };return _selectedSubTitleLab;
}

-(BaseButton *)btn{
    if(!_btn){
        @jobs_weakify(self)
        _btn = BaseButton
            .initByStyle1(@"展开下拉列表".tr,
                          UIFontWeightSemiboldSize(15),
                          JobsWhiteColor)
            .bgColorBy(HEXCOLOR(0x2F3645))
            .cornerRadiusValueBy(JobsWidth(22))
            .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(15))
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                x.selected = !x.selected;
                if (x.selected) {
                    /// ❤️只能让它执行一次❤️
                    self.dropDownListView = [self jobsMotivateDropDownListFromView:x
                                                                          direction:self.dropDownListViewDirection
                                                                               data:self.listViewData
                                                                 motivateViewOffset:JobsWidth(5)
                                                                        finishBlock:^(UIViewModel *data) {
                        JobsLog(@"data = %@",data);
                        [self updateSelectedInfoWithModel:data];
                        [self endDropDownListView];
                    }];
                    [self refreshDirectionUIWithOpened:YES];
                }else{
                    [self endDropDownListView];
                }
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"按钮的长按事件触发");
            })
            .makeBtnTitleByShowingType(UILabelShowingType_03)
            .addOn(self.panelView)
            .byAdd(^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.panelView);
                make.centerY.equalTo(self.panelView).offset(JobsWidth(82));
                make.width.mas_equalTo(JobsWidth(240));
                make.height.mas_equalTo(JobsWidth(46));
            });
    };return _btn;
}

-(BaseButton *)directionBtn{
    if (!_directionBtn) {
        @jobs_weakify(self)
        _directionBtn = BaseButton
            .initByStyle1(@"上拉".tr,
                          UIFontWeightMediumSize(14),
                          HEXCOLOR(0x2F3645))
            .bgColorBy(JobsClearColor)
            .cornerRadiusValueBy(0)
            .jobsResetBtnLayerBorderWidth(0)
            .onClickBy(^(UIButton *x) {
                @jobs_strongify(self)
                BOOL up = self.dropDownListViewDirection != JobsDropDownListViewDirection_UP;
                self.dropDownListViewDirection = up ? JobsDropDownListViewDirection_UP : JobsDropDownListViewDirection_Down;
                [self endDropDownListView];
//                toastBy(up ? @"已切换为上拉列表".tr : @"已切换为下拉列表".tr);
            })
            .makeBtnTitleByShowingType(UILabelShowingType_03);
    };return _directionBtn;
}

-(UIColor *)cor{
    if (!_cor) {
        _cor = [UIColor gradientCorDataMutArr:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(HEXCOLOR(0xE9C65D));
            data.add(HEXCOLOR(0xDDAA3A));
        })
                                   startPoint:CGPointZero
                                     endPoint:CGPointZero
                                       opaque:NO
                               targetViewRect:CGRectMake(0, 0, 51, 31)];
    };return _cor;
}

-(NSMutableArray<UIViewModel *> *)listViewData{
    if (!_listViewData) {
        _listViewData = jobsMakeMutArr(^(__kindof NSMutableArray <UIViewModel *>*_Nullable data) {
            NSArray <NSString *>*titles = @[@"基础配置".tr, @"本地 Pods".tr, @"交互动效".tr];
            NSArray <NSString *>*subTitles = @[@"浅色面板".tr, @"Core 修正".tr, @"上下拉切换".tr];
            NSArray <NSString *>*imageNames = @[@"slider.horizontal.3", @"shippingbox", @"arrow.up.arrow.down"];
            for (NSInteger i = 0; i < titles.count; i++) {
                data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                    UIImage *image = nil;
                    if (@available(iOS 13.0, *)) {
                        image = [imageNames[i].sys_img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
                    }
                    data1.byImage(image);
                    data1.textModel.byText(titles[i]);
                    data1.subTextModel.byText(subTitles[i]);
                }));
            }
        });
    };return _listViewData;
}

@end
