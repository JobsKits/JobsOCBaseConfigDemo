//
//  JobsButtonCoverTableCellDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#import "JobsButtonCoverTableCellDemoVC.h"

@interface JobsButtonCoverTableCellDemoVC ()

Prop_strong()UITableView *coverTableView;
Prop_strong()NSArray<UIViewModel *> *demoArr;

-(UIViewModel *)demoViewModelWithTitle:(NSString *)title
                      backgroundColor:(UIColor *)backgroundColor;

@end

@implementation JobsButtonCoverTableCellDemoVC
-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsButtonCoverTableCellDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"按钮完全覆盖 UITableViewCell".jobsTr())
                    .byFont(UIFontWeightRegularSize(17))
                    .byTextCor(JobsLabelColor);
            })
            .byBgCor(HEXCOLOR(0xF4F5F8))
            .byNavBgCor(HEXCOLOR(0xF4F5F8));
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsButtonCoverTableCellDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
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
        self.coverTableView.byVisible(YES);
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.demoArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(112);
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBtnStyleTBVCell *cell = JobsRegisterDequeueTableViewDefaultCell(JobsBtnStyleTBVCell);
    cell
        .byContentEdgeInsets(UIEdgeInsetsMake(JobsWidth(6),
                                             JobsWidth(16),
                                             JobsWidth(6),
                                             JobsWidth(16)))
        .bySelectionStyle(UITableViewCellSelectionStyleDefault)
        .JobsRichViewByModel2(self.demoArr[indexPath.row]);
    return cell;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    JobsLog(@"点击 UITableViewCell：%@",self.demoArr[indexPath.row].textModel.text);
}
#pragma mark —— 一些私有方法
-(UIViewModel *)demoViewModelWithTitle:(NSString *)title
                      backgroundColor:(UIColor *)backgroundColor{
    return jobsMakeViewModel(^(__kindof UIViewModel * _Nullable model) {
        model.byTitle(title.jobsTr())
            .bySubTitle(@"按钮铺满整个 UITableViewCell".jobsTr())
            .byTitleCor(JobsWhiteColor)
            .bySubTitleCor(JobsWhiteColor.colorWithAlphaComponentBy(0.78))
            .byTitleFont(UIFontWeightSemiboldSize(16))
            .bySubTitleFont(UIFontWeightRegularSize(12))
            .byBaseBackgroundColor(backgroundColor)
            .byLayerCornerRadius(JobsWidth(12))
            .byJobsEnabled(NO)
            .byNormalImage(@"rectangle.fill".sys_img)
            .byImageTitleSpace(JobsWidth(8))
            .byButtonEdgeInsetsStyle(NSDirectionalRectEdgeLeading);
    });
}
#pragma mark —— LazyLoad
-(UITableView *)coverTableView{
    if (!_coverTableView) {
        @jobs_weakify(self)
        _coverTableView = jobsMakeTableViewByInsetGrouped(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.byDelegate(self)
                .byDataSource(self)
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .byRowHeight(JobsWidth(112))
                .byEstimatedRowHeight(0)
                .byEstimatedSectionHeaderHeight(0)
                .byEstimatedSectionFooterHeight(0)
                .bySectionHeaderTopPadding(0)
                .byContentInset(UIEdgeInsetsMake(JobsWidth(10), 0, JobsWidth(10), 0))
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsClearColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self.view);
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    make.bottom.equalTo(self.view);
                });
        });
    };return _coverTableView;
}

-(NSArray<UIViewModel *> *)demoArr{
    if (!_demoArr) {
        _demoArr = @[
            [self demoViewModelWithTitle:@"UITableViewCell · 01"
                         backgroundColor:HEXCOLOR(0x705CF6)],
            [self demoViewModelWithTitle:@"UITableViewCell · 02"
                         backgroundColor:HEXCOLOR(0x17A2B8)],
            [self demoViewModelWithTitle:@"UITableViewCell · 03"
                         backgroundColor:HEXCOLOR(0xF59F00)],
            [self demoViewModelWithTitle:@"UITableViewCell · 04"
                         backgroundColor:HEXCOLOR(0xE64980)],
            [self demoViewModelWithTitle:@"UITableViewCell · 05"
                         backgroundColor:HEXCOLOR(0x2F9E44)],
            [self demoViewModelWithTitle:@"UITableViewCell · 06"
                         backgroundColor:HEXCOLOR(0x495057)]
        ];
    };return _demoArr;
}

@end
