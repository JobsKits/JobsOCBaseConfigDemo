//
//  BaiShaETProjChoiceStadiumView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/9.
//

#import "BaiShaETProjChoiceStadiumView.h"

#import "DefineProperty.h"

@interface BaiShaETProjChoiceStadiumTBVHeaderView ()

Prop_strong()UIColor *cor;

@end

@implementation BaiShaETProjChoiceStadiumTBVHeaderView

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = self.cor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = self.cor;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(),JobsWidth(46));
    };
}
#pragma mark —— lazyLoad
-(UIColor *)cor{
    if (!_cor) {
        _cor = self.byPatternImage(@"选择场馆上拉列表背景".img);/// 用@2x@3x会有偏移异常
        /// 👇🏻下面有偏移
//        [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xF2CD7A),HEXCOLOR(0xFFEABA)]]
//                            startPoint:CGPointMake(100, 100)
//                              endPoint:CGPointZero
//                                opaque:NO
//                        targetViewRect:CGRectMake(0,
//                                                  0,
//                                                  JobsMainScreen_WIDTH(),
//                                                  JobsWidth(46))];
    }return _cor;
}

@end

@interface BaiShaETProjChoiceStadiumView ()
/// UI
Prop_strong()UITableView *tableView;
Prop_strong()BaiShaETProjChoiceStadiumTBVHeaderView *tbvHeaderView;
/// Data
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;
Prop_strong()NSMutableArray <JobsBaseTableViewCell *>*tbvCellMutArr;

@end

@implementation BaiShaETProjChoiceStadiumView
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_choiceStadiumViewOnceToken = 0;
    static_choiceStadiumView = nil;
}

static BaiShaETProjChoiceStadiumView *static_choiceStadiumView = nil;
static dispatch_once_t static_choiceStadiumViewOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_choiceStadiumViewOnceToken, ^{
        static_choiceStadiumView = BaiShaETProjChoiceStadiumView.new;
    });return static_choiceStadiumView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        MakeDataNull
        self.tableView.byShow(self);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(JobsMainScreen_WIDTH()), JobsWidth(46) * [BaiShaETProjChoiceStadiumView createDataMutArr].count + JobsWidth(44) + JobsBottomSafeAreaHeight());
    };
}
#pragma mark —— 一些私有方法
+(NSMutableArray<UIViewModel *> *)createDataMutArr{
    NSMutableArray <UIViewModel *>*dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = @"DG體育".tr;
            viewModel.subTextModel.text = @"".tr;
        }))
        .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = @"DG真人".tr;
            viewModel.subTextModel.text = @"".tr;
        }))
        .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = @"DG電子".tr;
            viewModel.subTextModel.text = @"".tr;
        }))
        .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = @"DG彩票".tr;
            viewModel.subTextModel.text = @"".tr;
        }))
        .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = @"DG棋牌".tr;
            viewModel.subTextModel.text = @"".tr;
        }))
        .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = @"DA電子".tr;
            viewModel.subTextModel.text = @"".tr;
        }));
    });return dataMutArr;
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    for (JobsBaseTableViewCell *cell in self.tbvCellMutArr) {
        cell.imageView.jobsVisible = NO;
    }
    
    JobsBaseTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.imageView.jobsVisible = !cell.imageView.jobsVisible;
    
    if (self.objBlock) self.objBlock(self.dataMutArr[indexPath.row]);
    [self tf_hide:nil];
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
        .byTextLabelFrameOffsetX(JobsWidth(16))
        .byImageViewFrameOffsetX(JobsMainScreen_WIDTH() - JobsWidth(50))
        .byTextLabelFont(UIFontWeightRegularSize(16))
        .jobsRichElementsTableViewCellBy(self.dataMutArr[indexPath.row])
        .JobsBlock1(^(id _Nullable data) {
             
        }).byBgColor(HEXCOLOR(0xFFFCF7));
    cell.imageView.image = @"红色的对勾".img;
    cell.imageView.jobsVisible = NO;
    return cell;
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByGrouped(^(__kindof UITableView * _Nullable tableView){
            @jobs_strongify(self)
            tableView
                .byMJRefreshHeader([MJRefreshNormalHeader headerWithRefreshingBlock:^{
                    @jobs_strongify(self)
                    NSObject.feedbackGenerator(nil);/// 震动反馈
                    self->_tableView.endRefreshing(YES);
                    self.currentPage = @(1);
                }].byMJRefreshHeaderConfigModel(self.mjHeaderDefaultConfig))
                .byMJRefreshFooter([MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                    @jobs_strongify(self)
                    NSObject.feedbackGenerator(nil);/// 震动反馈
                    self->_tableView.endRefreshing(YES);
                }].byMJRefreshFooterConfigModel(self.mjFooterDefaultConfig))
                .byRegisterTableViewClass(nil)
                .bySeparatorColor(HEXCOLOR(0xEEEEEE))
                .byTableHeaderView(self.tbvHeaderView) // 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                .byTableFooterView(jobsMakeView(^(__kindof UIView * _Nullable view) {

                })) // 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .byContentInset(UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0))
                .byScrollEnabled(NO)
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byShowsVerticalScrollIndicator(NO)
                .byBgColor(JobsWhiteColor)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.edges.equalTo(self);
                });
            tableView.mj_footer.hidden = NO;
        });
    }return _tableView;
}

-(BaiShaETProjChoiceStadiumTBVHeaderView *)tbvHeaderView{
    if (!_tbvHeaderView) {
        _tbvHeaderView = BaiShaETProjChoiceStadiumTBVHeaderView.new
            .byText(@"選擇場館".tr)
            .byTextCor(HEXCOLOR(0x3D4A58))
            .byFont(UIFontWeightBoldSize(16))
            .byTextAlignment(NSTextAlignmentCenter)
            .bySize(BaiShaETProjChoiceStadiumTBVHeaderView.viewSizeByModel(nil));
    }return _tbvHeaderView;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = [BaiShaETProjChoiceStadiumView createDataMutArr];
    }return _dataMutArr;
}

-(NSMutableArray<JobsBaseTableViewCell *> *)tbvCellMutArr{
    if (!_tbvCellMutArr) {
        @jobs_weakify(self)
        _tbvCellMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <JobsBaseTableViewCell *>* _Nullable data) {
            @jobs_strongify(self)
            for (UIViewModel *viewModel in self.dataMutArr) {
                data.add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView));
            }
        });
    }return _tbvCellMutArr;
}

@end
