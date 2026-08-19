//
//  JobsExcelLeftListView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsExcelLeftListView.h"

@interface JobsExcelLeftListView()
/// Data
Prop_strong(nonnull)JobsExcelConfigureViewModel *excelConfigureData;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsExcelLeftListView
@interface JobsExcelLeftListView (JobsPropertyDSLSetterAutogen_272e3aee9c)
-(void)setExcelConfigureData:(JobsExcelConfigureViewModel * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsExcelLeftListView

@implementation JobsExcelLeftListView
/// RACProtocol
@synthesize racDisposable = _racDisposable;
- (void)dealloc {
    [self.racDisposable dispose];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.tableView.byAlpha(1);
    };return self;
}
#pragma mark —— BaseViewProtocol
- (jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsExcelConfigureViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.byExcelConfigureData(model);
        self.tableView.byRowHeight(model.itemH);
        self.tableView.byShow(self);
    };
}
#pragma mark —— UITableView 数据源
-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.excelConfigureData.rowNumber;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    JobsRetNSIntegerByUITableViewBlock action = ((JobsRetNSIntegerByUITableViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsExcelLeftListView.class, @selector(jobsNumberOfSectionsInTableView)))(self, @selector(jobsNumberOfSectionsInTableView));
    return action ? action(tableView) : (NSInteger){0};
}

-(JobsRetNSIntegerByUITableViewBlock _Nonnull)jobsNumberOfSectionsInTableView{
    @jobs_weakify(self)
    return ^NSInteger(UITableView * tableView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return 1;
    };
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.excelConfigureData.itemH;
}
#pragma mark —— UITableView 代理
-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    @jobs_weakify(self)
    return TableViewOneCell.cellStyleValue1ByTableView(tableView)
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .byIndexPath(indexPath)
        .jobsRichElementsTableViewCellBy(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable vm) {
            @jobs_strongify(self)
            vm.byData(self.excelConfigureData)
              .byButtonModel((UIButtonModel *)self.excelConfigureData.leftListDatas[indexPath.row]);
        }))
        .JobsBlock1(^(id _Nullable data) {
        }).byBgColor(indexPath.row % 2 ? self.excelConfigureData.cor1 : self.excelConfigureData.cor2);
}
#pragma mark —— UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    jobsByScrollViewBlock action = ((jobsByScrollViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsExcelLeftListView.class, @selector(jobsScrollViewDidScroll)))(self, @selector(jobsScrollViewDidScroll));
    if (action) action(scrollView);
}

-(jobsByScrollViewBlock _Nonnull)jobsScrollViewDidScroll{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
        JobsLog(@"KKK3 = %f", scrollView.contentOffset.y);
        /// 防止在初始情况下，无意义的往下拉动👇🏻
        if (scrollView.contentOffset.y < 0) {
            scrollView.byContentOffset(CGPointMake(scrollView.contentOffset.x, 0));
        }else{
            /// 防止在初始情况下，无意义的往上拉动👆🏻
            CGFloat d = ((self.excelConfigureData.colNumber + 1) * self.excelConfigureData.itemH - self.excelConfigureData.XZExcelH) + self.excelConfigureData.scrollOffsetY;
            if(scrollView.contentOffset.y > d) {
                scrollView.byContentOffset(CGPointMake(scrollView.contentOffset.x, d));
            }
            if(scrollView.contentOffset.y <= d) {
                self.excelConfigureData.byVerticalScrollValue(NSValue.byPoint(scrollView.contentOffset));
            }
        }
    };
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        /// 一般用 initWithStylePlain。initWithStyleGrouped会自己预留一块空间
        @jobs_weakify(self)
        _tableView = self.addSubview(jobsMakeTableViewByGrouped(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .bySeparatorColor(HEXCOLOR(0xEEE2C8))
//                .registerHeaderFooterViewClass(MSCommentTableHeaderFooterView.class,nil)
                .byContentInset(UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0))
                .emptyDataByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
                    data.byTitle(@"NO MESSAGES FOUND".jobsTr())
                        .byTitleCor(JobsWhiteColor)
                        .byTitleFont(bayonRegular(JobsWidth(30)))
                        .byNormalImage(@"小狮子".img);
                }))
                .byShowsVerticalScrollIndicator(NO)
                .byShowsHorizontalScrollIndicator(NO)
                .byScrollEnabled(YES)
                .byBgColor(JobsClearColor);
            if(@available(iOS 11.0, *)) {
                tableView.byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever);
            }
        }))
        .addOn(self)
        .byAdd(^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        });
    };return _tableView;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsExcelLeftListView
-(JobsRetJobsExcelLeftListViewByJobsExcelConfigureViewModelBlock _Nonnull)byExcelConfigureData{
    @jobs_weakify(self)
    return ^__kindof JobsExcelLeftListView * _Nullable(JobsExcelConfigureViewModel * _Nullable data){
        @jobs_strongify(self)
        [self setExcelConfigureData:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsExcelLeftListView
@end
