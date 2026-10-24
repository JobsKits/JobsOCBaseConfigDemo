//
//  JobsPullListAutoSizeView.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsPullListAutoSizeView.h"

@interface JobsPullListAutoSizeView ()
/// UI
Prop_strong()UIView *targetView;
/// Data
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;
-(JobsRetJobsPullListAutoSizeViewByViewBlock _Nonnull)byTargetView;
-(JobsRetJobsPullListAutoSizeViewByViewModelsBlock _Nonnull)byDataMutArr;

@end

@implementation JobsPullListAutoSizeView
-(JobsRetJobsPullListAutoSizeViewByViewBlock _Nonnull)byTargetView{
    @jobs_weakify(self)
    return ^__kindof JobsPullListAutoSizeView *_Nullable(UIView *_Nullable view){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setTargetView:view];
        return self;
    };
}

-(JobsRetJobsPullListAutoSizeViewByViewModelsBlock _Nonnull)byDataMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsPullListAutoSizeView *_Nullable(NSMutableArray<__kindof UIViewModel *> *_Nullable models){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setDataMutArr:models];
        return self;
    };
}

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

+ (instancetype)initWithTargetView:(UIView *__nonnull)targetView
                        dataMutArr:(NSArray <UIViewModel *>*__nonnull)dataMutArr{
    /// 只在触发控件所属宿主查重，避免影响其它 Scene 的菜单。
    JobsPullListAutoSizeView *(^checkMainWindowExistSelf)(void) = ^(void){
        JobsPullListAutoSizeView *jobsPullListAutoSizeView = nil;
        UIView *hostView = targetView.window ?: targetView.superview;
        for (UIView *subview in hostView.subviews) {
            if ([subview isKindOfClass:JobsPullListAutoSizeView.class]) {
                jobsPullListAutoSizeView = (JobsPullListAutoSizeView *)subview;
            }
        };return jobsPullListAutoSizeView;
    };
    JobsPullListAutoSizeView *view = checkMainWindowExistSelf();
    if (view) {
        [view removeFromSuperview];//释放
    }else{
        view = [JobsPullListAutoSizeView.alloc initWithTargetView:targetView
                                                       dataMutArr:dataMutArr];
    };return view;
}

- (instancetype)initWithTargetView:(UIView *__nonnull)targetView
                        dataMutArr:(NSArray <UIViewModel *>*__nonnull)dataMutArr{
    if (self = [super init]) {
        self.byTargetView(targetView)
            .byDataMutArr((NSMutableArray *)dataMutArr);
        self.makeUI();
    };return self;
}

-(jobsByVoidBlock _Nonnull)makeUI{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byBgColor(JobsBlackColor);
        self.byAlpha(0.32);
        UIView *hostView = self.targetView.window ?: self.targetView.superview;
        if (!hostView) return;
        self.byFrame(hostView.bounds)
            .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)
            .addOn(hostView);
        [hostView bringSubviewToFront:self];
        self.tableView.byShow(self);
        [self setNeedsLayout];
    };
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPullListAutoSizeView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        if (!_tableView || !self.targetView) return;
        CGRect available = UIEdgeInsetsInsetRect(self.bounds, self.safeAreaInsets);
        CGRect anchor = [self.targetView convertRect:self.targetView.bounds toView:self];
        CGFloat contentHeight = self.listTbVCellHeight * self.dataMutArr.count;
        CGFloat spaceAbove = MAX(0, CGRectGetMinY(anchor) - self.listTbVOffset - CGRectGetMinY(available));
        CGFloat spaceBelow = MAX(0, CGRectGetMaxY(available) - CGRectGetMaxY(anchor) - self.listTbVOffset);
        BOOL showAbove = spaceAbove >= contentHeight || spaceAbove >= spaceBelow;
        CGFloat width = MIN(self.listTbVWidth, MAX(0, CGRectGetWidth(available)));
        CGFloat height = MIN(contentHeight, MIN(MAX(0, CGRectGetHeight(available)), showAbove ? spaceAbove : spaceBelow));
        CGFloat x = CGRectGetMidX(anchor);
        if (x + width > CGRectGetMaxX(available)) x -= width;
        x = MIN(MAX(x, CGRectGetMinX(available)), CGRectGetMaxX(available) - width);
        CGFloat y = showAbove ? CGRectGetMinY(anchor) - self.listTbVOffset - height
                              : CGRectGetMaxY(anchor) + self.listTbVOffset;
        y = MIN(MAX(y, CGRectGetMinY(available)), CGRectGetMaxY(available) - height);
        self.tableView.byFrame(CGRectMake(x, y, width, height));
        self.tableView.byScrollEnabled(contentHeight > height);
    };
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self removeFromSuperview];//释放
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource ——————————
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.listTbVCellHeight;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsPullListTBVCell.cellStyleDefaultByTableView(tableView)
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .byIndexPath(indexPath)
        .byContentViewBgCor(self.bgColorListTBV)
        .byContentViewBgCor(self.bgColorListTBV)
        .jobsRichElementsTableViewCellBy(self.dataMutArr[indexPath.row])
        .JobsBlock1(^(id _Nullable data) {;
        })
        .byBgColor(self.bgColorListTBV);;
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
                .byScrollEnabled(NO)
                .addOn(self)
                .cornerCutToCircleWithCornerRadius(JobsWidth(3)); // 圆润
            tableView.byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever);
        });
    };return _tableView;
}

-(CGFloat)listTbVWidth{
    if (_listTbVWidth == 0) {
        _listTbVWidth = JobsWidth(100);
    };return _listTbVWidth;
}

-(CGFloat)listTbVCellHeight{
    if (_listTbVCellHeight == 0) {
        _listTbVCellHeight = JobsWidth(50);
    };return _listTbVCellHeight;
}

-(CGFloat)listTbVOffset{
    if (_listTbVOffset == 0) {
        _listTbVOffset = JobsWidth(10);
    };return _listTbVOffset;
}

-(UIColor *)bgColorListTBV{
    if (!_bgColorListTBV) {
        _bgColorListTBV = JobsWhiteColor;
    };return _bgColorListTBV;
}

@end
