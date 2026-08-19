//
//  CustomBtnVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CustomBtnVC.h"

static NSString * const CustomBtnListCellReuseIdentifier = @"CustomBtnListCellReuseIdentifier";

@interface CustomBtnVC ()<UITableViewDelegate,UITableViewDataSource>

Prop_strong()UITableView *tableView;
Prop_copy()NSArray <UIViewModel *>*dataArr;

-(JobsRetNSStringByUIViewModelBlock _Nonnull)demoTitleByViewModel;
-(JobsRetNSStringByUIViewModelBlock _Nonnull)demoSubTitleByViewModel;

@end

@implementation CustomBtnVC
@synthesize tableView = _tableView;
@synthesize dataArr = _dataArr;

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CustomBtnVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                    .byText(@"平替系统按钮".jobsTr())
                    .byFont(UIFontWeightRegularSize(16));
            })
            .byBgCor(JobsSystemBackgroundColor)
            .byNavBgCor(JobsSystemBackgroundColor);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CustomBtnVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
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
        self.tableView.byAlpha(1);
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(74);
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomBtnListCellReuseIdentifier];
    if (!cell) {
        cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleSubtitle
                                    reuseIdentifier:CustomBtnListCellReuseIdentifier];
    }
    UIViewModel *model = self.dataArr[indexPath.row];
    return cell
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(self.demoTitleByViewModel(model))
                .byFont(UIFontWeightMediumSize(JobsWidth(15)))
                .byTextCor(JobsLabelColor)
                .byNumberOfLines(1);
        })
        .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(self.demoSubTitleByViewModel(model))
                .byFont(UIFontWeightRegularSize(JobsWidth(12)))
                .byTextCor(JobsSecondaryLabelColor)
                .byNumberOfLines(2);
        })
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .bySelectionStyle(UITableViewCellSelectionStyleNone)
        .byBgColor(JobsSecondarySystemBackgroundColor);
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    UIViewModel *model = self.dataArr[indexPath.row];
    [self forceComingToPushVC:model.cls.new
                requestParams:model];
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
#pragma mark —— Data
-(JobsRetNSStringByUIViewModelBlock _Nonnull)demoTitleByViewModel{
    @jobs_weakify(self)
    return ^NSString *(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return nil;
        return viewModel.textModel.attributedTitle.string ?: viewModel.textModel.text ?: @"";
    };
}

-(JobsRetNSStringByUIViewModelBlock _Nonnull)demoSubTitleByViewModel{
    @jobs_weakify(self)
    return ^NSString *(UIViewModel * viewModel){
        @jobs_strongify(self)
        if (!self) return nil;
        return viewModel.subTextModel.attributedTitle.string ?: viewModel.subTextModel.text ?: @"";
    };
}
#pragma mark —— LazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByInsetGrouped(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .byDataSource(self)
                .byDelegate(self)
                .byRowHeight(JobsWidth(74))
                .byEstimatedRowHeight(JobsWidth(74))
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .byTableFooterView(jobsMakeView(^(__kindof UIView * _Nullable view) {}))
                .byShowsVerticalScrollIndicator(NO)
                .byBgColor(JobsClearColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    make.left.right.bottom.equalTo(self.view);
                });
            if (@available(iOS 11.0, *)) {
                tableView.byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever);
            }else{
                SuppressWdeprecatedDeclarationsWarning(self.automaticallyAdjustsScrollViewInsets = NO);
            }
        });
    };return _tableView;
}

-(NSArray<UIViewModel *> *)dataArr{
    if (!_dataArr) {
        _dataArr = @[
            self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"image左、label右【系统默认状态】".jobsTr())
                    .bySubTitle(@"使用 NSDirectionalRectEdgeLeading 展示系统默认排布".jobsTr())
                    .byCls(CustomBtnImageLeadingVC.class);
            })),
            self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"image右、label左".jobsTr())
                    .bySubTitle(@"使用 NSDirectionalRectEdgeTrailing 调整图文左右关系".jobsTr())
                    .byCls(CustomBtnImageTrailingVC.class);
            })),
            self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"image上，label下".jobsTr())
                    .bySubTitle(@"使用 NSDirectionalRectEdgeTop 展示上下排布".jobsTr())
                    .byCls(CustomBtnImageTopVC.class);
            })),
            self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.byTitle(@"image下，label上".jobsTr())
                    .bySubTitle(@"使用 NSDirectionalRectEdgeBottom 展示上下反向排布".jobsTr())
                    .byCls(CustomBtnImageBottomVC.class);
            }))
        ];
    };return _dataArr;
}

@end
