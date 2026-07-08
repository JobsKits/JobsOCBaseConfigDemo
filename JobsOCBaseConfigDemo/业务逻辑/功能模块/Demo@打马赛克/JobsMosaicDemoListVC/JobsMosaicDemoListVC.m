//
//  JobsMosaicDemoListVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsMosaicDemoListVC.h"

static NSString *const JobsMosaicDemoListCellReuseIdentifier = @"JobsMosaicDemoListCell";

@interface JobsMosaicDemoListVC (){
    UITableView *_mosaicTableView;
}

Prop_strong()NSArray <UIViewModel *>*demoArr;

-(UIViewModel *)demoViewModelWithTitle:(NSString *)title
                              subTitle:(NSString *)subTitle
                                   cls:(Class)cls;
-(void)pushDemoViewModel:(UIViewModel *)viewModel;

@end

@implementation JobsMosaicDemoListVC

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
            data.byText(@"打马赛克".tr)
                .byFont(UIFontWeightRegularSize(17))
                .byTextCor(HEXCOLOR(0x3D4A58));
        })
        .byBgCor(HEXCOLOR(0xF4F5F8))
        .byNavBgCor(HEXCOLOR(0xF4F5F8));
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.byBgColor(HEXCOLOR(0xF4F5F8));
    self.makeNavByAlpha(1);
    self.tableView.byVisible(YES);
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.demoArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(68);
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsMosaicDemoListCellReuseIdentifier];
    if (!cell) {
        cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleSubtitle
                                    reuseIdentifier:JobsMosaicDemoListCellReuseIdentifier];
    }
    UIViewModel *viewModel = self.demoArr[indexPath.row];
    return cell
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(viewModel.textModel.attributedTitle.string ?: viewModel.textModel.text)
                .byFont(UIFontWeightMediumSize(16))
                .byTextCor(HEXCOLOR(0x3D4A58));
        })
        .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(viewModel.subTextModel.attributedTitle.string ?: viewModel.subTextModel.text)
                .byFont(UIFontWeightRegularSize(12))
                .byTextCor(HEXCOLOR(0x8A93A1));
        })
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .bySelectionStyle(UITableViewCellSelectionStyleDefault);
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    [self pushDemoViewModel:self.demoArr[indexPath.row]];
}
#pragma mark —— 一些私有方法
-(UIViewModel *)demoViewModelWithTitle:(NSString *)title
                              subTitle:(NSString *)subTitle
                                   cls:(Class)cls{
    return self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
        model.byTitle(title.tr)
            .bySubTitle(subTitle.tr)
            .byCls(cls);
    }));
}

-(void)pushDemoViewModel:(UIViewModel *)viewModel{
    if (viewModel.cls) {
        self.comingToPushVCByRequestParams(viewModel.cls.new,
                                           viewModel);
    }else @"尚未接入此功能".tr.toast();
}
#pragma mark —— LazyLoad
-(UITableView *)tableView{
    if (!_mosaicTableView) {
        @jobs_weakify(self)
        _mosaicTableView = jobsMakeTableViewByInsetGrouped(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.byDelegate(self)
                .byDataSource(self)
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .byRowHeight(JobsWidth(68))
                .byEstimatedRowHeight(0)
                .byEstimatedSectionHeaderHeight(0)
                .byEstimatedSectionFooterHeight(0)
                .bySectionHeaderTopPadding(0)
                .byContentInset(UIEdgeInsetsMake(JobsWidth(16), 0, JobsWidth(16), 0))
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsClearColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self.view);
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    make.bottom.equalTo(self.view);
                });
        });
    };return _mosaicTableView;
}

-(NSArray<UIViewModel *> *)demoArr{
    if (!_demoArr) {
        _demoArr = @[
            [self demoViewModelWithTitle:@"整图粗细马赛克"
                                subTitle:@"CIPixellate 生成整图像素化，可调节块大小"
                                     cls:JobsMosaicWholeImageDemoVC.class],
            [self demoViewModelWithTitle:@"手势涂抹马赛克"
                                subTitle:@"按拖动轨迹把像素化结果叠回原图"
                                     cls:JobsMosaicBrushDemoVC.class]
        ];
    };return _demoArr;
}

@end
