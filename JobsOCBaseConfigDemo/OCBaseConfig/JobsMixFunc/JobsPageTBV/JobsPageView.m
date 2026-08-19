//
//  JobsPageView.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsPageView.h"

@interface JobsPageView ()
/// Data
Prop_strong()NSArray <UIViewModel *>*dataArr;
-(JobsRetJobsPageViewByCGFloatBlock _Nonnull)byCellHeight;
-(JobsRetJobsPageViewByViewModelsBlock _Nonnull)byDataArr;

@end

@implementation JobsPageView
-(JobsRetJobsPageViewByCGFloatBlock _Nonnull)byCellHeight{
    @jobs_weakify(self)
    return ^__kindof JobsPageView *_Nullable(CGFloat height){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setCellHeight:height];
        return self;
    };
}

-(JobsRetJobsPageViewByViewModelsBlock _Nonnull)byDataArr{
    @jobs_weakify(self)
    return ^__kindof JobsPageView *_Nullable(NSArray<__kindof UIViewModel *> *_Nullable models){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setDataArr:models];
        return self;
    };
}

/// UILocationProtocol
@synthesize cellHeight = _cellHeight;
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPageView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
        self.byCellHeight(self.height);
        [self.tableView reloadData];
    };
}
#pragma mark —— BaseViewProtocol
//具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(NSArray <UIViewModel *>*_Nullable model) {
        @jobs_strongify(self)
        self.byDataArr(model);
        self.tableView.byShow(self);
    //    self.backgroundImageView.image = @"抖动钱包抖币用途".img;
    //    self.imageView_1.alpha = 1;
    //    self.imageView_2.alpha = 1;
    //    self.valueLab.text = model.goldNumber;
    //    self.btn.alpha = 1;
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    JobsRetNSIntegerByUITableViewBlock action = ((JobsRetNSIntegerByUITableViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPageView.class, @selector(jobsNumberOfSectionsInTableView)))(self, @selector(jobsNumberOfSectionsInTableView));
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
    return JobsPageTBVCell.cellHeightByModel(nil) ? : self.cellHeight;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsPageTBVCell *cell = JobsPageTBVCell.cellStyleSubtitleByTableView(tableView)
        .byIndexPath(indexPath)
        .jobsRichElementsTableViewCellBy(self.dataArr[indexPath.row])
            .JobsBlock1(^(id _Nullable data) {;
            });
#warning 这里需要被修改
//    UIViewModel *viewModel = self.dataArr[indexPath.row];
//    viewModel.jobsWidth = JobsPageTBVCell.cellHeightByModel(nil) ? : self.cellHeight;
//    UIView.widthByData(viewModel);
    return cell;
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .bySeparatorColor(HEXCOLOR(0xEEEEEE))
                .byPagingEnabled(YES)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.edges.equalTo(self);
                });
        });
    };return _tableView;
}

@end
