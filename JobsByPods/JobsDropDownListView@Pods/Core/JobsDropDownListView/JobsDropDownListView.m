//
//  JobsDropDownListView.m
//  JobsDropDownListView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsDropDownListView.h"
#import <JobsDropDownListView/UIScrollView+AnimationKit.h>
#import <JobsDropDownListView/UIScrollView+UIScrollViewProtocol.h>
#import <JobsDropDownListView/UITableView+Extra.h>

@interface JobsDropDownListView (){
    CGFloat CellHeight;
}
/// UI
Prop_strong()Class <UITableViewCellProtocol>tbvCell_cls;
/// Data
Prop_strong()NSMutableArray <__kindof UITableViewCell *>*tbvCellMutArr;
Prop_strong()NSMutableArray <__kindof UIViewModel *>*dataMutArr;

@end

@implementation JobsDropDownListView

- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
}

-(instancetype)init{
    if (self = [super init]) {
        self.tableView.byShow(self);
        self.byBgColor(JobsClearColor);
        self.layer.shadowColor = HEXCOLOR(0x5B6472).CGColor;
        self.layer.shadowOpacity = 0.16f;
        self.layer.shadowRadius = JobsWidth(12);
        self.layer.shadowOffset = CGSizeMake(0, JobsWidth(8));

    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.tableView.byShow(self);
        self.byBgColor(JobsClearColor);
        self.layer.shadowColor = HEXCOLOR(0x5B6472).CGColor;
        self.layer.shadowOpacity = 0.16f;
        self.layer.shadowRadius = JobsWidth(12);
        self.layer.shadowOffset = CGSizeMake(0, JobsWidth(8));

    };return self;
}

-(instancetype)initWithTableViewClass:(Class <UITableViewCellProtocol>_Nonnull)tableViewClass{
    if (self = [super init]) {
        self.tbvCell_cls = tableViewClass;
        self.tableView.byShow(self);
        self.byBgColor(JobsClearColor);
        self.layer.shadowColor = HEXCOLOR(0x5B6472).CGColor;
        self.layer.shadowOpacity = 0.16f;
        self.layer.shadowRadius = JobsWidth(12);
        self.layer.shadowOffset = CGSizeMake(0, JobsWidth(8));

    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGRect currentFrame = [self convertRect:self.bounds toView:jobsGetMainWindow()];
    self.tableView.contentInset = UIEdgeInsetsMake(0,
                                                   0,
                                                   currentFrame.origin.y,
                                                   0);
    /// 动画效果
    [self.tableView alphaAnimWithSortingType:(SortingType)self.direction
                              animationBlock:nil
                             completionBlock:nil];
}

-(jobsByCtrlBlock _Nonnull)dropDownListViewDisappear{
    @jobs_weakify(self)
    return ^(UIControl *_Nullable ctrl){
        @jobs_strongify(self)
        ctrl.bySelected(NO);
        [self removeFromSuperview];
    };
}

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(NSArray <__kindof UIViewModel *>*_Nullable model) {
        @jobs_strongify(self)
        if ([model isKindOfClass:NSArray.class]) {
            [self jobsReloadDataWithModels:model];
        }
    };
}

-(JobsDropDownListView *_Nonnull)jobsReloadDataWithModels:(NSArray <__kindof UIViewModel *>*_Nullable)models{
    self.dataMutArr = models ? models.mutableCopy : NSMutableArray.array;
    self.tbvCellMutArr = nil;
    self.tableView.byShow(self);
    [self.tableView reloadData];
    return self;
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Class <UITableViewCellProtocol> cellCls = self.tbvCell_cls ? : JobsDropDownListTBVCell.class;
    if ([cellCls respondsToSelector:@selector(cellHeightByModel)]) {
        JobsRetCGFloatByIDBlock cellHeightBlock = [cellCls cellHeightByModel];
        if (cellHeightBlock) return cellHeightBlock(self.dataMutArr[indexPath.row]);
    };return JobsDropDownListTBVCell.cellHeightByModel(self.dataMutArr[indexPath.row]);
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.objBlock) self.objBlock(self.dataMutArr[indexPath.row]);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id<UITableViewCellProtocol> cell = (id<UITableViewCellProtocol>)self.tbvCellMutArr[indexPath.row];
    id<BaseCellProtocol> richCell = (id<BaseCellProtocol>)cell.byIndexPath(indexPath);
    return richCell
        .jobsRichElementsTableViewCellBy(self.dataMutArr[indexPath.row])
        .JobsBlock1(^(id _Nullable data) {

        });//BaseCellProtocol
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView hideSeparatorLineAtLast:indexPath cell:cell];
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            tableView.bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .bySeparatorColor(JobsClearColor)
                .byTableHeaderView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    view.byBgColor(JobsClearColor);
                })) // 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                .byTableFooterView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    view.byBgColor(JobsClearColor);
                })) // 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                .byShowsVerticalScrollIndicator(NO)
                .byBgColor(HEXCOLOR(0xFBFCFE))
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.edges.equalTo(self);
                });
            tableView.layer.cornerRadius = JobsWidth(16);
            tableView.layer.borderWidth = JobsWidth(1);
            tableView.layer.borderColor = HEXCOLOR(0xEDF1F5).CGColor;
            tableView.layer.masksToBounds = YES;
        });
    };return _tableView;
}

-(NSMutableArray<__kindof UITableViewCell *> *)tbvCellMutArr{
    if (!_tbvCellMutArr) {
        @jobs_weakify(self)
        _tbvCellMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            NSInteger dataMutArrCount = self.dataMutArr.count;
            for (NSInteger i = 0; i < dataMutArrCount; i++) {
                UITableViewCell *tableViewCell = [self.tableView tableViewCellClass:self.tbvCell_cls ? : JobsDropDownListTBVCell.class
                                                       tableViewCellStyleValue1Salt:@""];
                data.add(tableViewCell);
            }
        });
    };return _tbvCellMutArr;
}

-(NSMutableArray<__kindof UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
    };return _dataMutArr;
}

@end
