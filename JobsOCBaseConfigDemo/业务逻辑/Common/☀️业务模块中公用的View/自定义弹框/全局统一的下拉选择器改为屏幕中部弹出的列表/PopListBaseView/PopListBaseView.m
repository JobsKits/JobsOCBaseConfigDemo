//
//  PopListBaseView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "PopListBaseView.h"

@interface PopListBaseView ()
/// Data
Prop_strong()NSMutableArray <__kindof UITableViewCell *>*tbvCellMutArr;
Prop_strong()NSMutableArray <__kindof UIViewModel *>*dataMutArr;
Prop_strong()NSMutableArray <__kindof NSString *>*datas;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN PopListBaseView
@interface PopListBaseView (JobsPropertyDSLSetterAutogen_18855350d9)
-(void)setDataMutArr:(NSMutableArray <__kindof UIViewModel *>* _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END PopListBaseView

@implementation PopListBaseView
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsClearColor.colorWithAlphaComponentBy(0));
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(PopListBaseView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
    };
}

#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.byBgColor(JobsClearColor.colorWithAlphaComponentBy(0));
    };return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(NSMutableArray <__kindof UIViewModel *>* model) {
        @jobs_strongify(self)
        self.byBgColor(JobsClearColor.colorWithAlphaComponentBy(0));
        self.byDataMutArr(model);
        self.tableView.byShow(self);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(NSArray *_Nullable data){
        if(data){
            return jobsMakeCGSizeByLocationModelBlock(^(__kindof JobsLocationModel *_Nullable data1) {
                data1.byJobsWidth(PopListBaseView.jobsCellWidth())
                     .byJobsHeight(MIN(data.count * PopListBaseView.jobsCellHeight(),JobsWidth(259)));/// 高度限制在 JobsWidth(259)
                JobsLog(@"KKK = %f-%f",data1.jobsWidth,data1.jobsHeight);
            });
        }else return CGSizeMake(JobsWidth(300), JobsWidth(259));
    };
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(PopListBaseView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        /// 内部指定圆切角
        [self appointCornerCutToCircleByRoundingCorners:UIRectCornerAllCorners
                                            cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewModel *viewModel = self.dataMutArr[indexPath.row];
    for (JobsTextLabStyleTBVCell *visibleCell in tableView.visibleCells) {
        visibleCell
            .byContentView(^(__kindof UIView * _Nullable view) {
                view.byBgColor(viewModel.bgCor);
            })
            .byBgColor(viewModel.bgCor);
        visibleCell.label.byTextCor(viewModel.textCor);
    }
    JobsTextLabStyleTBVCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell
        .byContentView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(viewModel.bgSelectedCor);
        })
        .byBgColor(viewModel.bgSelectedCor);
    cell.label.byTextCor(viewModel.selectedTextCor);
    if (self.objBlock) self.objBlock(cell);/// 数据在cell.viewModel
    [self tf_hide:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    JobsRetNSIntegerByUITableViewBlock action = ((JobsRetNSIntegerByUITableViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(PopListBaseView.class, @selector(jobsNumberOfSectionsInTableView)))(self, @selector(jobsNumberOfSectionsInTableView));
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

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.cellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.tbvCellMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsTextLabStyleTBVCell.cellStyleDefaultByTableView(tableView)
        .byAccessoryType(UITableViewCellAccessoryNone)
        .byIndexPath(indexPath)
        .jobsRichElementsTableViewCellBy(self.dataMutArr[indexPath.row])
        .JobsBlock1(^(id _Nullable data) {;
        });
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(__kindof UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = self.addSubview(jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            tableView
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .bySeparatorColor(@"#1E1E1E".jobsCor())
                .byContentInset(UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0))
                .byTableHeaderView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                }))
                .byTableFooterView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                }))
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
        })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
            @jobs_strongify(self)
            make.edges.equalTo(self);
        }).on().dataLink(self);/// dataLink(self)不能写在Block里面，会出问题
    };return _tableView;
}

-(NSMutableArray <__kindof UITableViewCell *>*)tbvCellMutArr{
    if (!_tbvCellMutArr) {
        @jobs_weakify(self)
        _tbvCellMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UITableViewCell *>*_Nullable data) {
            @jobs_strongify(self)
            for (int d = 0; d < self.dataMutArr.count; d++) {
                @jobs_strongify(self)
                data.add(JobsBaseTableViewCell.cellStyleValue1ByTableView(self.tableView));
            }
        });
    };return _tbvCellMutArr;
}

-(NSMutableArray<__kindof NSString *> *)datas{
    if(!_datas){
        _datas = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(@"选项1".jobsTr())
            .add(@"选项2".jobsTr())
            .add(@"选项3".jobsTr());
        });
    };return _datas;
}
@synthesize dataMutArr = _dataMutArr;
-(void)setDataMutArr:(NSMutableArray <__kindof UIViewModel *>*)dataMutArr{
    _dataMutArr = dataMutArr;
    _tbvCellMutArr = nil;
}

-(NSMutableArray<__kindof UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        @jobs_weakify(self)
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <UIViewModel *>*_Nullable data) {
            @jobs_strongify(self)
            for (NSString *t in self.datas) {
                data.add(self.configPopUpDataBy(t));
            }
        });
    };return _dataMutArr;
}
static CGFloat _CellHeight = 0;
+(CGFloat)CellHeight {
    return (((JobsRetCGFloatByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(PopListBaseView.class, @selector(jobsCellHeight)))(self, @selector(jobsCellHeight)))();
}

+(JobsRetCGFloatByVoidBlock _Nonnull)jobsCellHeight {
    return ^CGFloat{
        if (!_CellHeight) {
            _CellHeight = JobsWidth(37);
        };return _CellHeight;
    };
}
static CGFloat _CellWidth = 0;
+(CGFloat)CellWidth {
    return (((JobsRetCGFloatByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(PopListBaseView.class, @selector(jobsCellWidth)))(self, @selector(jobsCellWidth)))();
}

+(JobsRetCGFloatByVoidBlock _Nonnull)jobsCellWidth {
    return ^CGFloat{
        if (!_CellWidth) {
            _CellWidth = JobsWidth(300);
        };return _CellWidth;
    };
}
@synthesize cellHeight = _cellHeight;
-(CGFloat)cellHeight{
    if(!_cellHeight){
        _cellHeight = PopListBaseView.jobsCellHeight();
    };return _cellHeight;
}
@synthesize cellWidth = _cellWidth;
-(CGFloat)cellWidth{
    if(!_cellWidth){
        _cellWidth = PopListBaseView.jobsCellWidth();
    };return _cellWidth;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN PopListBaseView
-(JobsRetPopListBaseViewByNSMutableArrayUIViewModelBlock _Nonnull)byDataMutArr{
    @jobs_weakify(self)
    return ^__kindof PopListBaseView * _Nullable(NSMutableArray <__kindof UIViewModel *>* _Nullable data){
        @jobs_strongify(self)
        [self setDataMutArr:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END PopListBaseView
@end
