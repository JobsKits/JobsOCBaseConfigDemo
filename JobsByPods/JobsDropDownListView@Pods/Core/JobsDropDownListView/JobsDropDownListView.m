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

    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.tableView.byShow(self);
        self.byBgColor(JobsClearColor);

    };return self;
}

-(instancetype)initWithTableViewClass:(Class <UITableViewCellProtocol>_Nonnull)tableViewClass{
    if (self = [super init]) {
        self.tbvCell_cls = tableViewClass;
        self.tableView.byShow(self);
        self.byBgColor(JobsClearColor);

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
        ctrl.selected = NO;
        [self removeFromSuperview];
    };
}

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(NSMutableArray <__kindof UIViewModel *>*_Nullable model) {
        @jobs_strongify(self)
        if ([model isKindOfClass:NSArray.class]) {
            self.dataMutArr = model;
            self.tableView.byShow(self);
        }
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    /// self.tbvCell_cls没有值的时候等于调用 JobsDropDownListTBVCell.cellHeightByModel(nil)
    NSNumber *d = [NSObject methodName:@"cellHeightByModel:"
                             targetObj:self.tbvCell_cls ? self.tbvCell_cls.class : JobsDropDownListTBVCell.class
                           paramarrays:nil];
    return d.floatValue;
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
            tableView.bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .bySeparatorColor(HEXCOLOR(0xEEEEEE))
                .byTableHeaderView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    /// TODO
                })) // 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                .byTableFooterView(jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
                    label
                        .byText(@"- 没有更多的内容了 -".tr)
                        .byFont(UIFontWeightRegularSize(12))
                        .byTextAlignment(NSTextAlignmentCenter)
                        .byTextCor(HEXCOLOR(0xB0B0B0))
                        .makeLabelByShowingType(UILabelShowingType_03);
                })) // 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                .byShowsVerticalScrollIndicator(NO)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.edges.equalTo(self);
                });
        });
    };return _tableView;
}

-(NSMutableArray<__kindof UITableViewCell *> *)tbvCellMutArr{
    if (!_tbvCellMutArr) {
        @jobs_weakify(self)
        _tbvCellMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            NSInteger dataMutArrCount = self.dataMutArr.count;
            do {
                UITableViewCell *tableViewCell = [self.tableView tableViewCellClass:self.tbvCell_cls ? : JobsDropDownListTBVCell.class
                                                       tableViewCellStyleValue1Salt:@""];
                data.add(tableViewCell);
                dataMutArrCount -= 1;
            } while (dataMutArrCount);
        });
    };return _tbvCellMutArr;
}

@end
