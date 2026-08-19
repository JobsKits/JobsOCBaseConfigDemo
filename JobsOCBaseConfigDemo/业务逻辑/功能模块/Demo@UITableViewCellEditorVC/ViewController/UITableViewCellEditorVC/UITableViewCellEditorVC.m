//
//  UITableViewCellEditorVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UITableViewCellEditorVC.h"

static NSInteger const JobsMsgCellCardViewTag = 2026070601;
static NSInteger const JobsMsgCellTypeLabelTag = 2026070602;
static NSInteger const JobsMsgCellTitleLabelTag = 2026070603;
static NSInteger const JobsMsgCellContentLabelTag = 2026070604;
static NSInteger const JobsMsgCellTimeLabelTag = 2026070605;
static NSInteger const JobsMsgCellReadLabelTag = 2026070606;
static NSInteger const JobsMsgCellArrowLabelTag = 2026070607;

@interface UITableViewCellEditorVC ()
/// UI
Prop_strong()BaseButton *editBtn;
Prop_strong()MsgEditBoardView *msgEditBoardView;
/// Data
Prop_strong()NSMutableArray <JobsMsgDataModel *>*dataMutArr;
Prop_strong()NSMutableArray <JobsMsgDataModel *>*selectedDataMutArr;

@end

@implementation UITableViewCellEditorVC
- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UITableViewCellEditorVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        if ([self.requestParams isKindOfClass:UIViewModel.class]) {
            self.byViewModel((UIViewModel *)self.requestParams);
            if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byTextCor(JobsLabelColor)
                    .byText(@"站内信".jobsTr())
                    .byFont(UIFontWeightBoldSize(17));
            })
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            //    self.viewModel.bgImage = @"启动页SLOGAN".img;
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UITableViewCellEditorVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
            [super viewDidLoad];
            @jobs_weakify(self)
            self.byLeftBarButtonItems(jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
        //        @jobs_strongify(self)
        //        data.add(UIBarButtonItem.initBy(self.aboutBtn));
            }))
            .byRightBarButtonItems(jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
                @jobs_strongify(self)
                data.add(UIBarButtonItem.initBy(self.editBtn));
            }));
            self.makeNavByAlpha(1);
            self.tableView.byShow(self);
            self.msgEditBoardView.byJobsVisible(YES);
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UITableViewCellEditorVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
    };
}

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UITableViewCellEditorVC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewWillLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillLayoutSubviews];
        JobsLog(@"");
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UITableViewCellEditorVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
        JobsLog(@"");
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UITableViewCellEditorVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UITableViewCellEditorVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
    };
}

-(void)viewDidDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UITableViewCellEditorVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidDisappear:animated];
    };
}
#pragma mark —— 一些私有方法
-(JobsRetNSStringByJobsMsgDataModelBlock _Nonnull)msgTypeTextByModel{
    @jobs_weakify(self)
    return ^NSString *(JobsMsgDataModel * model){
        @jobs_strongify(self)
        if (!self) return nil;
        switch (model.msgStyle) {
            /// 处理 JobsMsgType_Notify 分支
            case JobsMsgType_Notify:
                return @"通知".jobsTr();
            /// 处理 JobsMsgType_Activity 分支
            case JobsMsgType_Activity:
                return @"活动".jobsTr();
            /// 处理 JobsMsgType_Notice 分支
            case JobsMsgType_Notice:
                return @"公告".jobsTr();
            /// 处理 JobsMsgType_Bonus 分支
            case JobsMsgType_Bonus:
                return @"红利".jobsTr();
            /// 未匹配已知分支时执行兜底处理
            default:
                return @"消息".jobsTr();
        }
    };
}

-(JobsRetUIColorByJobsMsgDataModelBlock _Nonnull)msgAccentCorByModel{
    @jobs_weakify(self)
    return ^UIColor *(JobsMsgDataModel * model){
        @jobs_strongify(self)
        if (!self) return nil;
        switch (model.msgStyle) {
            /// 处理 JobsMsgType_Notify 分支
            case JobsMsgType_Notify:
                return HEXCOLOR(0x3B7CFF);
            /// 处理 JobsMsgType_Activity 分支
            case JobsMsgType_Activity:
                return HEXCOLOR(0xAE8330);
            /// 处理 JobsMsgType_Notice 分支
            case JobsMsgType_Notice:
                return HEXCOLOR(0x24A66A);
            /// 处理 JobsMsgType_Bonus 分支
            case JobsMsgType_Bonus:
                return HEXCOLOR(0xEB677F);
            /// 未匹配已知分支时执行兜底处理
            default:
                return HEXCOLOR(0x667085);
        }
    };
}

-(JobsRetUIColorByJobsMsgDataModelBlock _Nonnull)msgAccentBgCorByModel{
    @jobs_weakify(self)
    return ^UIColor *(JobsMsgDataModel * model){
        @jobs_strongify(self)
        if (!self) return nil;
        switch (model.msgStyle) {
            /// 处理 JobsMsgType_Notify 分支
            case JobsMsgType_Notify:
                return HEXCOLOR(0xEAF1FF);
            /// 处理 JobsMsgType_Activity 分支
            case JobsMsgType_Activity:
                return HEXCOLOR(0xFFF4DD);
            /// 处理 JobsMsgType_Notice 分支
            case JobsMsgType_Notice:
                return HEXCOLOR(0xE8F7EF);
            /// 处理 JobsMsgType_Bonus 分支
            case JobsMsgType_Bonus:
                return HEXCOLOR(0xFFF0F3);
            /// 未匹配已知分支时执行兜底处理
            default:
                return HEXCOLOR(0xF1F4F8);
        }
    };
}

-(UILabel *)msgLabelByTag:(NSInteger)tag
                     cell:(UITableViewCell *)cell{
    return (UILabel *)[cell.contentView viewWithTag:tag];
}

-(jobsByTableViewCellBlock _Nonnull)prepareMsgCellSubviewsIfNeeded{
    @jobs_weakify(self)
    return ^(UITableViewCell * cell){
        @jobs_strongify(self)
        if (!self) return;
        if ([cell.contentView viewWithTag:JobsMsgCellCardViewTag]) return;
        cell.selectedBackgroundView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsClearColor);
        });
        cell.byMultipleSelectionBackgroundView(cell.selectedBackgroundView);
        UIView *cardView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .addOn(cell.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(cell.contentView).offset(JobsWidth(6));
                    make.left.equalTo(cell.contentView).offset(JobsWidth(16));
                    make.right.equalTo(cell.contentView).offset(JobsWidth(-16));
                    make.bottom.equalTo(cell.contentView).offset(JobsWidth(-6));
                });
            view.layer
                .byCornerRadius(JobsWidth(8))
                .byShadowColor(RGBA_COLOR(39, 50, 68, 0.12).CGColor)
                .byShadowOpacity(1)
                .byShadowOffset(CGSizeMake(0, JobsWidth(4)))
                .byShadowRadius(JobsWidth(10));
        });
        cardView.byTag(JobsMsgCellCardViewTag);
        UILabel *typeLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightBoldSize(12))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(1)
                .addOn(cardView);
        });
        typeLabel.byTag(JobsMsgCellTypeLabelTag);
        typeLabel.layer.byCornerRadius(JobsWidth(18)).byMasksToBounds(YES);
        UILabel *timeLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightRegularSize(11))
                .byTextCor(JobsSecondaryLabelColor)
                .byTextAlignment(NSTextAlignmentRight)
                .byNumberOfLines(1)
                .addOn(cardView);
        });
        timeLabel.byTag(JobsMsgCellTimeLabelTag);
        UILabel *titleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightBoldSize(15))
                .byNumberOfLines(1)
                .addOn(cardView);
        });
        titleLabel.byTag(JobsMsgCellTitleLabelTag);
        UILabel *contentLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byTextCor(JobsSecondaryLabelColor)
                .byFont(UIFontWeightRegularSize(12))
                .byNumberOfLines(1)
                .addOn(cardView);
        });
        contentLabel.byTag(JobsMsgCellContentLabelTag);
        UILabel *readLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightMediumSize(11))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(1)
                .addOn(cardView);
        });
        readLabel.byTag(JobsMsgCellReadLabelTag);
        readLabel.layer.byCornerRadius(JobsWidth(9)).byMasksToBounds(YES);
        UILabel *arrowLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"›")
                .byFont(UIFontWeightRegularSize(24))
                .byTextCor(JobsSecondaryLabelColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .addOn(cardView);
        });
        arrowLabel.byTag(JobsMsgCellArrowLabelTag);
        [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cardView).offset(JobsWidth(12));
            make.top.equalTo(cardView).offset(JobsWidth(14));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(36), JobsWidth(36)));
        }];
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(cardView).offset(JobsWidth(15));
            make.right.equalTo(cardView).offset(JobsWidth(-36));
            make.width.mas_equalTo(JobsWidth(76));
            make.height.mas_equalTo(JobsWidth(16));
        }];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(typeLabel.mas_right).offset(JobsWidth(12));
            make.top.equalTo(cardView).offset(JobsWidth(13));
            make.right.lessThanOrEqualTo(timeLabel.mas_left).offset(JobsWidth(-8));
            make.height.mas_equalTo(JobsWidth(20));
        }];
        [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(titleLabel);
            make.top.equalTo(titleLabel.mas_bottom).offset(JobsWidth(6));
            make.right.equalTo(cardView).offset(JobsWidth(-36));
            make.height.mas_equalTo(JobsWidth(17));
        }];
        [readLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(titleLabel);
            make.bottom.equalTo(cardView).offset(JobsWidth(-12));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(44), JobsWidth(18)));
        }];
        [arrowLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(cardView).offset(JobsWidth(-14));
            make.centerY.equalTo(cardView);
            make.size.mas_equalTo(CGSizeMake(JobsWidth(12), JobsWidth(28)));
        }];
    };
}

-(void)configMsgCell:(UITableViewCell *)cell
               model:(JobsMsgDataModel *)model{
    self.prepareMsgCellSubviewsIfNeeded(cell);
    cell.textLabel.byHidden(YES);
    cell.detailTextLabel.byHidden(YES);
    cell.imageView.byHidden(YES);
    cell.byBgColor(JobsClearColor);
    cell.contentView.byBgColor(JobsClearColor);
    UIColor *accentCor = self.msgAccentCorByModel(model);
    UILabel *typeLabel = [self msgLabelByTag:JobsMsgCellTypeLabelTag cell:cell];
    UILabel *titleLabel = [self msgLabelByTag:JobsMsgCellTitleLabelTag cell:cell];
    UILabel *contentLabel = [self msgLabelByTag:JobsMsgCellContentLabelTag cell:cell];
    UILabel *timeLabel = [self msgLabelByTag:JobsMsgCellTimeLabelTag cell:cell];
    UILabel *readLabel = [self msgLabelByTag:JobsMsgCellReadLabelTag cell:cell];
    typeLabel
        .byText(self.msgTypeTextByModel(model))
        .byTextCor(accentCor)
        .byBgColor(self.msgAccentBgCorByModel(model));
    titleLabel
        .byText(model.textModel.text)
        .byTextCor(model.isRead ? HEXCOLOR(0x5C6675) : JobsLabelColor)
        .byFont(model.isRead ? UIFontWeightMediumSize(15) : UIFontWeightBoldSize(15));
    contentLabel
        .byText(model.subTextModel.text)
        .byTextCor(model.isRead ? HEXCOLOR(0xA2AAB5) : HEXCOLOR(0x6F7785));
    timeLabel.byText(model.timeText);
    readLabel
        .byText(model.isRead ? @"已读".jobsTr() : @"未读".jobsTr())
        .byTextCor(model.isRead ? JobsSecondaryLabelColor : HEXCOLOR(0xEB677F))
        .byBgColor(model.isRead ? HEXCOLOR(0xF1F4F8) : HEXCOLOR(0xFFF0F3));
}

-(jobsByVoidBlock _Nonnull)dataForUI{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.tableView reloadData];
        [self.tableView setEditing:NO animated:YES];
        [self.selectedDataMutArr removeAllObjects];
        self.msgEditBoardView.getDeleteBtn().enabledBlock(self.selectedDataMutArr.count);
        self.msgEditBoardView.getMarkToReadBtn().enabledBlock(self.selectedDataMutArr.count);
        self.editBtn.bySelected(NO);
        self.editBtn.jobsResetBtnTitle(@"編輯".jobsTr());
        self.msgEditBoardView.disappearByView(self.view);
    };
}
/// 全选的实现
-(jobsByVoidBlock _Nonnull)allChoose{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        /// UI层
        for (int i = 0; i< self.dataMutArr.count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            cell.bySelected(YES);
            if ([self.tableView.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
                [self.tableView.delegate tableView:self.tableView didSelectRowAtIndexPath:indexPath];
            }
        }
        /// Data层
        [self.selectedDataMutArr removeAllObjects];
        [self.selectedDataMutArr addObjectsFromArray:self.dataMutArr];
    };
}
/// 取消全选的实现
-(jobsByVoidBlock _Nonnull)allCancelChoose{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        /// UI层
        for (int i = 0; i< self.dataMutArr.count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            cell.bySelected(NO);
        }
        /// Data层
        [self.selectedDataMutArr removeAllObjects];
    };
}
/// 单行点击改变数据层
-(JobsRetNSMutableArrayJobsMsgDataModelByNSIndexPathBlock _Nonnull)manuallyDataAtIndexPath{
    @jobs_weakify(self)
    return ^NSMutableArray<JobsMsgDataModel *> *(NSIndexPath * indexPath){
        @jobs_strongify(self)
        if (!self) return nil;
        [self.selectedDataMutArr containsObject:self.dataMutArr[indexPath.row]] ? [self.selectedDataMutArr removeObject:self.dataMutArr[indexPath.row]] : [self.selectedDataMutArr addObject:self.dataMutArr[indexPath.row]];
        return self.selectedDataMutArr;
    };
}

-(JobsRetMsgEditBoardViewByVoidBlock _Nonnull)getMsgEditBoardView{
    @jobs_weakify(self)
    return ^MsgEditBoardView *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.msgEditBoardView;
    };
}

-(JobsRetTableViewByVoidBlock _Nonnull)getTableView{
    @jobs_weakify(self)
    return ^UITableView *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.tableView;
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (void)tableView:(UITableView*)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath*)indexPath{
}
/// 开始进入编辑模式
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView
          editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    @jobs_weakify(self)
    if (self.tableView.editing) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.bySelected(YES);
        NSMutableArray<JobsMsgDataModel *> *dataMutArr = self.manuallyDataAtIndexPath(indexPath);
        self.msgEditBoardView.getDeleteBtn().enabledBlock(dataMutArr.count);
        self.msgEditBoardView.getMarkToReadBtn().enabledBlock(dataMutArr.count);
    }else{
        JobsMsgDetailVC *msgDetailVC = JobsMsgDetailVC.new;
        msgDetailVC.actionObjBlock(^(JobsMsgDataModel *data) {
            @jobs_strongify(self)
            [self.dataMutArr removeObject:data];
            [self.tableView reloadData];
        });
        self.comingToPushVCByRequestParams(msgDetailVC,jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            @jobs_strongify(self)
            viewModel.byData(self.dataMutArr[indexPath.row]);
        }));
    }
}
/// 编辑模式下，点击取消左边已选中的cell的按钮
- (void)tableView:(UITableView *)tableView
didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.tableView.editing) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.bySelected(NO);
        NSMutableArray<JobsMsgDataModel *> *dataMutArr = self.manuallyDataAtIndexPath(indexPath);
        self.msgEditBoardView.getDeleteBtn().enabledBlock(dataMutArr.count);
        self.msgEditBoardView.getMarkToReadBtn().enabledBlock(dataMutArr.count);
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    JobsRetNSIntegerByUITableViewBlock action = ((JobsRetNSIntegerByUITableViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UITableViewCellEditorVC.class, @selector(jobsNumberOfSectionsInTableView)))(self, @selector(jobsNumberOfSectionsInTableView));
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
    return JobsWidth(104);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsMsgDataModel *model = (NSUInteger)indexPath.row < self.dataMutArr.count ? self.dataMutArr[indexPath.row] : nil;
    UITableViewCell *cell = UITableViewCell.cellStyleValue1ByTableView(tableView)
        .byAccessoryType(UITableViewCellAccessoryNone)
        .byIndexPath(indexPath)
        .jobsRichElementsTableViewCellBy(model);
    [self configMsgCell:cell model:model];
    return cell;
}
#pragma mark —— lazyLoad
-(BaseButton *)editBtn{
    if (!_editBtn) {
        @jobs_weakify(self)
        _editBtn = BaseButton.jobsInit()
            .jobsResetBtnTitleCor(JobsLabelColor)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(13))
            .jobsResetBtnTitle(@"編輯".jobsTr())
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
    //            toastBy(x.jobsTitleForNormalState());
                BOOL selected = !x.selected;
                x
                    .jobsResetBtnTitle(selected ? @"完成".jobsTr() : @"編輯".jobsTr())
                    .bySelected(selected);
                [self.tableView setEditing:x.selected animated:YES];
                x.selected ? self.getMsgEditBoardView().appearByView(self.view) : self.getMsgEditBoardView().disappearByView(self.view);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .bgColorBy(RGBA_COLOR(255, 255, 255, 0.92));
        _editBtn.byFrame(CGRectMake(0, 0, JobsWidth(56), JobsWidth(40)));
        _editBtn.layer
            .byCornerRadius(JobsWidth(20))
            .byShadowColor(RGBA_COLOR(39, 50, 68, 0.12).CGColor)
            .byShadowOpacity(1)
            .byShadowOffset(CGSizeMake(0, JobsWidth(3)))
            .byShadowRadius(JobsWidth(8));
    };return _editBtn;
}
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .byRowHeight(JobsWidth(104))
                .byEstimatedRowHeight(JobsWidth(104))
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .byAllowsMultipleSelectionDuringEditing(YES)
                .byMJRefreshHeader([MJRefreshNormalHeader headerWithRefreshingBlock:^{
                    @jobs_strongify(self)
                    NSObject.feedbackGenerator(nil);/// 震动反馈
                    self->_tableView.endRefreshing(YES);
                }].byMJRefreshHeaderConfigModel(self.jobsMjHeaderDefaultConfig()))
                .byMJRefreshFooter([MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                    @jobs_strongify(self)
                    NSObject.feedbackGenerator(nil);/// 震动反馈
                    self->_tableView.endRefreshing(YES);
                }].byMJRefreshFooterConfigModel(self.jobsMjFooterDefaultConfig()))
                .byShowsVerticalScrollIndicator(NO)
                .resetContentInset(UIEdgeInsetsMake(JobsWidth(10), 0, JobsWidth(92), 0))
                .byScrollIndicatorInsets(tableView.contentInset)
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .addOn(self.view);
            [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
                make.left.right.bottom.equalTo(self.view);
            }];
        });
    };return _tableView;
}

-(MsgEditBoardView *)msgEditBoardView{
    if (!_msgEditBoardView) {
        _msgEditBoardView = MsgEditBoardView.new;
        _msgEditBoardView
            .byFrame(MsgEditBoardView.viewFrameByModel(nil))
            .jobsRichViewByModel(nil);
        _msgEditBoardView.getDeleteBtn().enabledBlock(self.selectedDataMutArr.count);
        @jobs_weakify(self)
        _msgEditBoardView.actionObjBlock(^(id data) {
            @jobs_strongify(self)
            if ([data isKindOfClass:UIButton.class]) {
                UIButton *btn = (UIButton *)data;
                if ([btn.jobsTitleForNormalState() isEqualToString:@"全選".jobsTr()]) {
                    btn.selected ? self.allChoose() : self.allCancelChoose();
                }else if ([btn.jobsTitleForNormalState() isEqualToString:@"標記為已讀".jobsTr()]){
                    for (JobsMsgDataModel *model in self.selectedDataMutArr) {//dataMutArr
                        model.byRead(YES);
                        NSUInteger index = [self.dataMutArr indexOfObject:model];
                        [self.dataMutArr replaceObjectAtIndex:index withObject:model];
                    }
                    self.dataForUI();
                }else if ([btn.jobsTitleForNormalState() isEqualToString:@"删除".jobsTr()]){
                    JobsLog(@"%@",self.selectedDataMutArr);
                    [self.dataMutArr removeObjectsInArray:self.selectedDataMutArr];
                    self.dataForUI();
                }else{}
            }
        });
    };return _msgEditBoardView;
}

-(NSMutableArray<JobsMsgDataModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeMsgDataModel(^(__kindof JobsMsgDataModel * _Nullable viewModel) {
                /// 通知
                viewModel
                    .byMsgStyle(JobsMsgType_Notify)
                    .byTimeText(@"05-13 18:20".jobsTr())
                    .byIsDraw(NO)
                    .byIsRead(NO)
                    .byTextModelBlock(^(__kindof UITextModel * _Nullable textModel) {
                        textModel.byText(@"6月1日13:00點整，英超焦點賽月1日13:00點整，英超焦點賽".jobsTr());
                    })
                    .bySubTextModelBlock(^(__kindof UITextModel * _Nullable subTextModel) {
                        subTextModel.byText(@"夏季聯賽火熱來襲，全體會員虛擬幣存...夏季聯賽火熱來襲，全體會員虛擬幣存".jobsTr());
                    });
            }))
            .add(jobsMakeMsgDataModel(^(__kindof JobsMsgDataModel * _Nullable viewModel) {
                /// 活动
                viewModel
                    .byMsgStyle(JobsMsgType_Activity)
                    .byTimeText(@"05-13 18:20".jobsTr())
                    .byIsDraw(YES)
                    .byIsRead(YES)
                    .byTextModelBlock(^(__kindof UITextModel * _Nullable textModel) {
                        textModel.byText(@"6月1日13:00點".jobsTr());
                    })
                    .bySubTextModelBlock(^(__kindof UITextModel * _Nullable subTextModel) {
                        subTextModel.byText(@"夏季聯賽火熱來襲，全體會員虛擬幣存...".jobsTr());
                    });
            }))
            .add(jobsMakeMsgDataModel(^(__kindof JobsMsgDataModel * _Nullable viewModel) {
                /// 公告
                viewModel
                    .byMsgStyle(JobsMsgType_Notice)
                    .byTimeText(@"05-13 18:20".jobsTr())
                    .byIsDraw(NO)
                    .byIsRead(NO)
                    .byTextModelBlock(^(__kindof UITextModel * _Nullable textModel) {
                        textModel.byText(@"6月1日".jobsTr());
                    })
                    .bySubTextModelBlock(^(__kindof UITextModel * _Nullable subTextModel) {
                        subTextModel.byText(@"夏季聯賽火熱來襲，全體會員虛擬幣存...".jobsTr());
                    });
            }))
            .add(jobsMakeMsgDataModel(^(__kindof JobsMsgDataModel * _Nullable viewModel) {
                /// 红利
                viewModel
                    .byMsgStyle(JobsMsgType_Bonus)
                    .byTimeText(@"05-13 18:20".jobsTr())
                    .byIsDraw(YES)
                    .byIsRead(YES)
                    .byTextModelBlock(^(__kindof UITextModel * _Nullable textModel) {
                        textModel.byText(@"wowowowowo".jobsTr());
                    })
                    .bySubTextModelBlock(^(__kindof UITextModel * _Nullable subTextModel) {
                        subTextModel.byText(@"夏季聯賽火熱來襲，全體會員虛擬幣存...".jobsTr());
                    });
            }));
        });
    };return _dataMutArr;
}

-(NSMutableArray<JobsMsgDataModel *> *)selectedDataMutArr{
    if (!_selectedDataMutArr) {
        _selectedDataMutArr = NSMutableArray.array;
    };return _selectedDataMutArr;
}

@end
