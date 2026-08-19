//
//  MSCommentView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "MSCommentView.h"

@interface MSCommentView ()
/// Data
Prop_strong()NSMutableArray <MSCommentModel *>*dataMutArr;

@end

@implementation MSCommentView
/// BaseViewProtocol
@synthesize tableView = _tableView;

#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(MSCommentView.class, @selector(jobsDestroySingleton)))(self, @selector(jobsDestroySingleton));
    if (action) action();
}

+(jobsByVoidBlock _Nonnull)jobsDestroySingleton{
    return ^{
        static_commentViewOnceToken = 0;
        static_commentView = nil;
    };
}
static MSCommentView *static_commentView = nil;
static dispatch_once_t static_commentViewOnceToken;
+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(MSCommentView.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id{
        dispatch_once(&static_commentViewOnceToken, ^{
            static_commentView = MSCommentView.new;
        });return static_commentView;
    };
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsSecondarySystemBackgroundColor);
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        @jobs_weakify(self)
        [self addNotificationName:语言切换
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
//            @jobs_strongify(self)
            NSNotification *notification = (NSNotification *)arg;
            if([notification.object isKindOfClass:NSNumber.class]){
                NSNumber *b = notification.object;
                JobsLog(@"SSS = %d",b.boolValue);
            }
            JobsLog(@"通知传递过来的 = %@",notification.object);
        }];
//        [self netWorking];
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(MSCommentView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
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

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(MSCommentView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        /// 内部指定圆切角
        [self appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                                        cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
        self.cleanTableViewDebugBackground();
    };
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)cleanTableViewDebugBackground{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!_tableView) return;
        _tableView.byBgColor(JobsSecondarySystemBackgroundColor);
        _tableView.backgroundView.byBgColor(JobsSecondarySystemBackgroundColor);
        for (UIView *subview in _tableView.subviews) {
            if (![subview isKindOfClass:UITableViewCell.class] &&
                ![subview isKindOfClass:UITableViewHeaderFooterView.class]) {
                subview.byBgColor(JobsSecondarySystemBackgroundColor);
            }
        }
    };
}
/// 设置headerView
-(void)headerView:(MSCommentTableHeaderFooterView *)headerView
          section:(NSInteger)section{
    [headerView jobsRichViewByCommentModel:self.dataMutArr[section]
                                    folded:self.tableView.ww_isSectionFolded(section)];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.byBgColor(JobsSecondarySystemBackgroundColor);
    };return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.tableView.byShow(self);
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
/// 编辑模式下，点击取消左边已选中的cell的按钮
- (void)tableView:(UITableView *)tableView
didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    JobsRetNSIntegerByUITableViewBlock action = ((JobsRetNSIntegerByUITableViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(MSCommentView.class, @selector(jobsNumberOfSectionsInTableView)))(self, @selector(jobsNumberOfSectionsInTableView));
    return action ? action(tableView) : (NSInteger){0};
}

-(JobsRetNSIntegerByUITableViewBlock _Nonnull)jobsNumberOfSectionsInTableView{
    @jobs_weakify(self)
    return ^NSInteger(UITableView * tableView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return self.dataMutArr.count;
    };
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return MSCommentTBVCell.cellHeightByModel(self.dataMutArr[indexPath.section].commentDataMutArr[indexPath.row]);
}

- (NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr[section].commentDataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MSCommentTBVCell *cell = MSCommentTBVCell.cellStyleDefaultByTableView(tableView)
        .byAccessoryType(UITableViewCellAccessoryNone)
        .byIndexPath(indexPath)
        .jobsRichElementsTableViewCellBy(self.dataMutArr[indexPath.section].commentDataMutArr[indexPath.row])
            .JobsBlock1(^(id _Nullable data) {;
            });
    cell.resetWidthByOffset(-JobsWidth(15 * 2));
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return MSCommentTableHeaderFooterView.heightForHeaderInSection(nil);
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSectionByModel:(NSInteger)section{
    return CGFLOAT_MIN;
}
/// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
/// tableView.registerHeaderFooterViewClass(MSCommentTableHeaderFooterView.class,@"");
- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
    /// 什么不配置就是悬浮
    /// JobsHeaderFooterViewStyleNone 还是悬浮
    /// JobsHeaderViewStyle 不是悬浮
    MSCommentTableHeaderFooterView *headerView = MSCommentTableHeaderFooterView.initByReuseIdentifier(tableView,@"")
        .byStyle(JobsHeaderViewStyle)/// 悬浮开关
        .bySection(section)/// 悬浮配置
        .JobsRichViewByModel2(nil)
        .JobsBlock1(^(id _Nullable data) {;
        });
    {
        headerView.byNumberOfTouchesRequired(1);
        headerView.byNumberOfTapsRequired(1);
        headerView.byMinimumPressDuration(0.1);
        headerView.byAllowableMovement(1);
        headerView.byUserInteractionEnabled(YES);
        headerView.byWeak_target(self);
        headerView.tapGR_SelImp.selector = self.jobsSelectorBlock(^id _Nullable(id _Nullable target,
                                                                             UITapGestureRecognizer *_Nullable arg) {
            MSCommentTableHeaderFooterView *header = (MSCommentTableHeaderFooterView *)arg.view;
            NSInteger section = header.tag;
            BOOL folded = !tableView.ww_isSectionFolded(section);
            [tableView ww_foldSection:section fold:folded];
            [header jobsRichViewByCommentModel:self.dataMutArr[section]
                                        folded:folded];
            return nil;
        });
        headerView.tapGR.byEnabled(YES);/// 必须在设置完Target和selector以后方可开启执行
    }headerView.tag = section;
    return headerView;
}

- (void)tableView:(UITableView *)tableView
willDisplayHeaderView:(UIView *)view
       forSection:(NSInteger)section{
    MSCommentTableHeaderFooterView *commentTableHeaderFooterView = (MSCommentTableHeaderFooterView *)view;
    [self headerView:commentTableHeaderFooterView section:section];
}
#pragma mark —— lazyLoad
-(BaseTableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeBaseTableViewByGrouped(^(__kindof BaseTableView * _Nullable tableView) {
            tableView
                .dataLink(self)
                .byFoldable(YES)
                .registerHeaderFooterViewClass(MSCommentTableHeaderFooterView.class,@"")
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .bySeparatorColor(HEXCOLOR(0xEEE2C8))
                .byTableHeaderView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                }))
                .byTableFooterView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                }))
                .byBackgroundView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    view.byBgColor(JobsSecondarySystemBackgroundColor);
                }))
                .byShowsVerticalScrollIndicator(NO)
                .byScrollEnabled(YES)
                .byMJRefreshHeader(self.MJRefreshNormalHeaderBy(self.refreshHeaderDataBy(^id _Nullable(id  _Nullable data) {
                    @jobs_strongify(self)
                    NSObject.feedbackGenerator(nil);//震动反馈
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        self.tableView.endRefreshing(YES);
                    });
                    return nil;
                })))
                .byMJRefreshFooter(self.MJRefreshFooterBy(self.refreshFooterDataBy(^id _Nullable(id  _Nullable data) {
                    @jobs_strongify(self)
                    self.tableView.endRefreshing(YES);
                    return nil;
                })))
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .byOpaque(YES);
            if(@available(iOS 11.0, *)) {
                tableView.byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever);
            }
            tableView.mj_footer.byHidden(NO);
    //        {// 设置tabAnimated相关属性
    //            _tableView.tabAnimated = [TABTableAnimated animatedWithCellClass:JobsBaseTableViewCell.class
    //                                                                  cellHeight:JobsBaseTableViewCell.cellHeightByModel(nil)];
    //            _tableView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeBinAnimation;
    //            _tableView.tabAnimated.canLoadAgain = YES;
    ////            _tableView.tabAnimated.animatedBackViewCornerRadius = JobsWidth(8);
    ////            _tableView.tabAnimated.animatedBackgroundColor = JobsRedColor;
    //            [_tableView tab_startAnimation];   // 开启动画
    //        }
            tableView.addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                });
        });
    };return _tableView;
}

-(NSMutableArray<MSCommentModel *> *)dataMutArr{
    if(!_dataMutArr){
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeMSCommentModel(^(MSCommentModel * _Nullable commentModel) {
                commentModel
                    .bySectionTitle(@"分组 1：默认展开".jobsTr())
                    .bySectionSubTitle(@"点击标题收起整组 cell，保留 header 可恢复".jobsTr());
                commentModel.commentDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <MSCommentDetailModel *>*_Nullable data2) {
                    data2.add(jobsMakeMSCommentDetailModel(^(MSCommentDetailModel * _Nullable model) {
                        model.byRowTitle(@"第 1 行：这是会被折叠隐藏的 UITableViewCell，点击上方橙色分组标题即可收起。".jobsTr());
                    }))
                    .add(jobsMakeMSCommentDetailModel(^(MSCommentDetailModel * _Nullable model) {
                        model.byRowTitle(@"第 2 行：收起后本行不再占位，只保留 section header 用来重新展开。".jobsTr());
                    }))
                    .add(jobsMakeMSCommentDetailModel(^(MSCommentDetailModel * _Nullable model) {
                        model.byRowTitle(@"第 3 行：展开状态下可以看到完整 cell 列表，状态文案显示“展开中”。".jobsTr());
                    }));
                });;
            }))
            .add(jobsMakeMSCommentModel(^(MSCommentModel * _Nullable commentModel) {
                commentModel
                    .bySectionTitle(@"分组 2：反复切换".jobsTr())
                    .bySectionSubTitle(@"对比展开 / 收起后的高度、数量和状态变化".jobsTr());
                commentModel.commentDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <MSCommentDetailModel *>*_Nullable data2) {
                    data2.add(jobsMakeMSCommentDetailModel(^(MSCommentDetailModel * _Nullable model) {
                        model.byRowTitle(@"第 1 行：这个分组用于对比展开和收起后的视觉差异。".jobsTr());
                    }))
                    .add(jobsMakeMSCommentDetailModel(^(MSCommentDetailModel * _Nullable model) {
                        model.byRowTitle(@"第 2 行：header 右侧的状态会在“展开中”和“已收起”之间切换。".jobsTr());
                    }))
                    .add(jobsMakeMSCommentDetailModel(^(MSCommentDetailModel * _Nullable model) {
                        model.byRowTitle(@"第 3 行：加号和减号用于提示下一步可执行的展开或收起动作。".jobsTr());
                    }));
                });;
            }))
            .add(jobsMakeMSCommentModel(^(MSCommentModel * _Nullable commentModel) {
                commentModel
                    .bySectionTitle(@"分组 3：复用状态".jobsTr())
                    .bySectionSubTitle(@"滚动复用时重新绑定标题、数量和折叠状态".jobsTr());
                commentModel.commentDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <MSCommentDetailModel *>*_Nullable data2) {
                    data2.add(jobsMakeMSCommentDetailModel(^(MSCommentDetailModel * _Nullable model) {
                        model.byRowTitle(@"第 1 行：第三组用于验证 UITableViewHeaderFooterView 复用后的状态回填。".jobsTr());
                    }))
                    .add(jobsMakeMSCommentDetailModel(^(MSCommentDetailModel * _Nullable model) {
                        model.byRowTitle(@"第 2 行：header 复用时会按当前 section 重设标题、副标题和数量。".jobsTr());
                    }))
                    .add(jobsMakeMSCommentDetailModel(^(MSCommentDetailModel * _Nullable model) {
                        model.byRowTitle(@"第 3 行：这个页面现在重点展示 UITableViewCell 的分组折叠效果。".jobsTr());
                    }));
                });;
            }));
        });
    };return _dataMutArr;
}

@end
