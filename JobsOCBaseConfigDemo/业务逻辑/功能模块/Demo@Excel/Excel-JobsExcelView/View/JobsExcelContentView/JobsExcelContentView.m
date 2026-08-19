//
//  JobsExcelContentView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsExcelContentView.h"

@interface JobsExcelContentView()
/// Data
Prop_strong(nonnull)JobsExcelConfigureViewModel *excelConfigureData;
Prop_assign()CGPoint contentOffenset;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsExcelContentView
@interface JobsExcelContentView (JobsPropertyDSLSetterAutogen_bea12169d7)
-(void)setContentOffenset:(CGPoint)data;
-(void)setExcelConfigureData:(JobsExcelConfigureViewModel * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsExcelContentView

@implementation JobsExcelContentView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.tableView.byShow(self);
    };return self;
}
/// 在某些情况下，当UITableView加载到一个子UIView上的时候，只有在layoutSubviews刷新页面的时候，UITableView才会有Frame
-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsExcelContentView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        self.tableView.byShow(self);
    };
}
#pragma mark —— BaseViewProtocol
- (jobsByIDBlock _Nonnull)jobsRichViewByModel {
    @jobs_weakify(self)
    return ^(JobsExcelConfigureViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.byExcelConfigureData(model);
        self.tableView.byRowHeight(self.excelConfigureData.itemH);
        self.tableView.byShow(self);
    };
}
#pragma mark —— UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.excelConfigureData.rowNumber;
}
#pragma mark —— UITableViewDataSource
- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell *cell = MainTableViewCell.cellStyleValue1ByTableView(tableView)
        .byAccessoryType(UITableViewCellAccessoryNone)
        .byIndexPath(indexPath)
        .byDelegate(self)
//        .byContentViewBgCor(indexPath.row % 2 ? self.excelConfigureData.cor1 : self.excelConfigureData.cor2)
        .jobsRichElementsTableViewCellBy(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable vm) {
            vm.byData(self.excelConfigureData)
              .byButtonModels(self.excelConfigureData.contentArr[indexPath.row]);
        }))
        .JobsBlock1(^(id _Nullable data) {;
        });
    cell.byBgColor(indexPath.row % 2 ? self.excelConfigureData.cor1 : self.excelConfigureData.cor2);
    return cell;
}
#pragma mark —— UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    jobsByScrollViewBlock action = ((jobsByScrollViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsExcelContentView.class, @selector(jobsScrollViewDidScroll)))(self, @selector(jobsScrollViewDidScroll));
    if (action) action(scrollView);
}

-(jobsByScrollViewBlock _Nonnull)jobsScrollViewDidScroll{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
        if (scrollView == self.tableView) {
            [self.excelConfigureData.verticalScrollSignal sendNext:NSValue.byPoint(scrollView.contentOffset)];
            self.configureContentOffSet(self.contentOffenset);
        }
    };
}
#pragma mark —— MianTableViewCellDelegate
-(jobsByScrollViewBlock _Nonnull)mianTableViewCellScrollerDid{
    @jobs_weakify(self)
    return ^(__kindof UIScrollView *_Nullable scrollView){
        @jobs_strongify(self)
        if (scrollView.contentOffset.y != 0) {
            scrollView.byContentOffset(CGPointMake(scrollView.contentOffset.x, 0));
            return;
        }
        self.byContentOffenset(scrollView.contentOffset);
        [self.excelConfigureData.horizontalScrollSignal sendNext:NSValue.byPoint(scrollView.contentOffset)];
        self.configureContentOffSet(scrollView.contentOffset);
    };
}
#pragma mark —— 一些共有方法
-(jobsByPointBlock _Nonnull)configureContentOffSet{
    @jobs_weakify(self)
    return ^(CGPoint point){
        @jobs_strongify(self)
        [self.tableView.visibleCells enumerateObjectsUsingBlock:^(__kindof MainTableViewCell *_Nonnull cell,
                                                                  NSUInteger idx,
                                                                  BOOL *_Nonnull stop) {
            cell.scrollerItemBy(point);
        }];
    };
}
#pragma mark —— LazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
- (UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.dataLink(self)
            .byRowHeight(self.excelConfigureData.itemH)
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
            .byBgColor(JobsClearColor.colorWithAlphaComponentBy(0));
            tableView.buttonModelEmptyData = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
                data.byTitle(@"No Datas".jobsTr())
                    .byTitleCor(JobsWhiteColor)
                    .byTitleFont(bayonRegular(JobsWidth(30)))
                    .byNormalImage(@"暂无数据".img)
                    .byBaseBackgroundColor(JobsClearColor.colorWithAlphaComponentBy(0))
                    .byJobsOffsetX(JobsWidth(-100))
                    .byJobsOffsetY(0);
            });
            tableView.addOn(self).byAdd(^(MASConstraintMaker *make) {
                make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
            });
        });
    };return _tableView;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsExcelContentView
-(JobsRetJobsExcelContentViewByCGPointBlock _Nonnull)byContentOffenset{
    @jobs_weakify(self)
    return ^__kindof JobsExcelContentView * _Nullable(CGPoint data){
        @jobs_strongify(self)
        [self setContentOffenset:data];
        return self;
    };
}

-(JobsRetJobsExcelContentViewByJobsExcelConfigureViewModelBlock _Nonnull)byExcelConfigureData{
    @jobs_weakify(self)
    return ^__kindof JobsExcelContentView * _Nullable(JobsExcelConfigureViewModel * _Nullable data){
        @jobs_strongify(self)
        [self setExcelConfigureData:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsExcelContentView
@end
