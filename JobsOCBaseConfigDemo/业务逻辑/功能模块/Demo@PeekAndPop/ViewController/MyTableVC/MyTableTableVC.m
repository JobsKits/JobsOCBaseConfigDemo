//
//  MyTableTableVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "MyTableTableVC.h"

@interface MyTableTableVC ()
/// UI
Prop_strong()BaiShaETProjChoiceStadiumTBVHeaderView *tbvHeaderView;
/// Data
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;
Prop_strong()NSMutableArray <JobsBaseTableViewCell *>*tbvCellMutArr;

@end

@implementation MyTableTableVC

- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
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
            data.byFont(UIFontWeightRegularSize(18));
        })
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byBgImage(@"新首页的底图".img)
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.byBgColor(JobsRandomColor);

    self.makeNavByAlpha(1);
    self.tableView.byShow(self);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    JobsLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    JobsLog(@"");
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
   
}
#pragma mark —— 一些私有方法
+(NSMutableArray<UIViewModel *> *)createDataMutArr{
    NSMutableArray <UIViewModel *>*dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.byText(@"DG體育".tr);
            viewModel.subTextModel.byText(@"".tr);
        }))
        .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.byText(@"DG真人".tr);
            viewModel.subTextModel.byText(@"".tr);
        }))
        .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.byText(@"DG電子".tr);
            viewModel.subTextModel.byText(@"".tr);
        }))
        .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.byText(@"DG彩票".tr);
            viewModel.subTextModel.byText(@"".tr);
        }))
        .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.byText(@"DG棋牌".tr);
            viewModel.subTextModel.byText(@"".tr);
        }))
        .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.byText(@"DA電子".tr);
            viewModel.subTextModel.byText(@"".tr);
        }));
    });return dataMutArr;
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (nullable UIContextMenuConfiguration *)tableView:(UITableView *)tableView
          contextMenuConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath
                                             point:(CGPoint)point {
    if (indexPath.row >= self.dataMutArr.count) return nil;
    return [UIContextMenuConfiguration configurationWithIdentifier:indexPath
                                                   previewProvider:^UIViewController * _Nullable{
        PreviewVC *previewVC = PreviewVC.new;
        previewVC.previewText = [NSString stringWithFormat:@"Preview for row %ld", (long)indexPath.row];
        return previewVC;
    } actionProvider:^UIMenu * _Nullable(NSArray<UIMenuElement *> *suggestedActions) {
        UIAction *action1 = [UIAction actionWithTitle:@"Action 1".tr
                                                image:nil
                                           identifier:nil
                                              handler:^(__kindof UIAction * _Nonnull action) {
            JobsLog(@"Action 1 selected for row %ld", (long)indexPath.row);
        }];
        UIAction *action2 = [UIAction actionWithTitle:@"Action 2".tr
                                                image:nil
                                           identifier:nil
                                              handler:^(__kindof UIAction * _Nonnull action) {
            JobsLog(@"Action 2 selected for row %ld", (long)indexPath.row);
        }];
        return [UIMenu menuWithTitle:@"".tr children:@[action1, action2]];
    }];
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    for (JobsBaseTableViewCell *cell in self.tbvCellMutArr) {
        cell.byCellImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView.byJobsVisible(NO);
        });
    }
    
    JobsBaseTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.byCellImageView(^(__kindof UIImageView * _Nullable imageView) {
        imageView.byJobsVisible(!imageView.jobsVisible);
    });
    
    if (self.objBlock) self.objBlock(self.dataMutArr[indexPath.row]);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(46);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBaseTableViewCell *cell = self.tbvCellMutArr[indexPath.row]
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .byIndexPath(indexPath)
        .byContentViewBgCor(HEXCOLOR(0xFFFCF7))
        .byTextLabelTextCor(HEXCOLOR(0x757575))
        .byTextLabelFont(UIFontWeightRegularSize(16))
        .byTextLabelFrameOffsetX(JobsWidth(16))
        .byImageViewFrameOffsetX(JobsMainScreen_WIDTH() - JobsWidth(50))
        .jobsRichElementsTableViewCellBy(self.dataMutArr[indexPath.row])
        .byCellImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byImage(@"红色的对勾".img)
                .byJobsVisible(NO);
        })
        .JobsBlock1(^(id _Nullable data) {
             
        }).byBgColor(HEXCOLOR(0xFFFCF7));
    return cell;
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByGrouped(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .byRegisterTableViewClass(nil)
                .bySeparatorColor(HEXCOLOR(0xEEEEEE))
                .byTableHeaderView(self.tbvHeaderView) // 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                .byTableFooterView(jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
                    /// TODO
                })) // 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .byScrollEnabled(NO)
                .byContentInset(UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0))
                .byShowsVerticalScrollIndicator(NO)
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsWhiteColor);
            tableView.addOn(self.view);
            [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.edges.equalTo(self.view);
            }];
        });
    };return _tableView;
}

-(BaiShaETProjChoiceStadiumTBVHeaderView *)tbvHeaderView{
    if (!_tbvHeaderView) {
        _tbvHeaderView = BaiShaETProjChoiceStadiumTBVHeaderView.new
            .byText(@"選擇場館".tr)
            .byTextCor(HEXCOLOR(0x3D4A58))
            .byFont(UIFontWeightBoldSize(16))
            .byTextAlignment(NSTextAlignmentCenter)
            .bySize(BaiShaETProjChoiceStadiumTBVHeaderView.viewSizeByModel(nil));
    };return _tbvHeaderView;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = MyTableTableVC.createDataMutArr;
    };return _dataMutArr;
}

-(NSMutableArray<JobsBaseTableViewCell *> *)tbvCellMutArr{
    if (!_tbvCellMutArr) {
        @jobs_weakify(self)
        _tbvCellMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            [self.dataMutArr  enumerateObjectsUsingBlock:^(UIViewModel *_Nonnull obj,
                                                           NSUInteger idx,
                                                           BOOL *_Nonnull stop) {
                @jobs_strongify(self)
                data.add(JobsBaseTableViewCell.cellStyleValue1ByTableView(self.tableView));
            }];
        });
    };return _tbvCellMutArr;
}

@end
