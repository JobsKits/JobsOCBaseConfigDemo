//
//  JobsWalletVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsWalletVC.h"

static NSString *const JobsWalletModeCellReuseIdentifier = @"JobsWalletModeCellReuseIdentifier";
static NSInteger const JobsWalletModeCardViewTag = 81001;
static NSInteger const JobsWalletModeTitleLabelTag = 81002;
static NSInteger const JobsWalletModeSubTitleLabelTag = 81003;
static NSInteger const JobsWalletModeChevronViewTag = 81004;

@interface JobsWalletVC ()

Prop_strong()UITableView *modeTableView;
Prop_strong()JobsWalletCardView *walletCardView;
Prop_copy()NSArray<UIViewModel *> *modeDataSource;
Prop_copy()NSArray<JobsWalletCardModel *> *cardModels;
Prop_strong()BaseButton *walletExpandBtn;
Prop_assign()BOOL showsModeList;
Prop_assign()BOOL walletCardsExpanded;
Prop_assign()JobsWalletCardExpandStyle walletStyle;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsWalletVC
@interface JobsWalletVC (JobsPropertyDSLSetterAutogen_dc02b5cd9c)
-(void)setShowsModeList:(BOOL)data;
-(void)setWalletCardsExpanded:(BOOL)data;
-(void)setWalletStyle:(JobsWalletCardExpandStyle)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsWalletVC

@implementation JobsWalletVC
- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsWalletVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.byWalletStyle(JobsWalletCardExpandStyleOnlySelected);
        self.byShowsModeList(![self.requestParams isKindOfClass:NSNumber.class]);
        if ([self.requestParams isKindOfClass:NSNumber.class]) {
            self.byWalletStyle([(NSNumber *)self.requestParams integerValue]);
        }
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
                data.byTextCor(JobsLabelColor);
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byText(self.showsModeList ? @"卡片展开动效".jobsTr() : self.titleByWalletStyle(self.walletStyle))
                    .byFont(UIFontWeightSemiboldSize(17));
            })
            .byBgCor(HEXCOLOR(0xF5F7FB))
            .byNavBgCor(HEXCOLOR(0xFFF1E4))
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsWalletVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.makeNavByAlpha(1);
        self.view.byBgColor(JobsSystemBackgroundColor);
        if (self.showsModeList) {
            self.modeTableView.byAlpha(1);
        } else {
            self.setupRightItems();
            self.walletCardView.byAlpha(1);
        }
    };
}

#pragma mark —— UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.modeDataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(104);
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsWalletModeCellReuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:JobsWalletModeCellReuseIdentifier];
    }
    if (![cell.contentView viewWithTag:JobsWalletModeCardViewTag]) {
        self.setupModeCell(cell);
    }
    if (indexPath.row < self.modeDataSource.count) {
        UIViewModel *viewModel = self.modeDataSource[indexPath.row];
        [self configureModeCell:cell
                       byModel:viewModel];
    };return cell;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row >= self.modeDataSource.count) return;
    UIViewModel *viewModel = self.modeDataSource[indexPath.row];
    JobsWalletVC *vc = JobsWalletVC.new;
    vc.byRequestParams(viewModel.requestParams);
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark —— 一些私有方法

-(JobsRetNSStringByJobsWalletCardExpandStyleBlock _Nonnull)titleByWalletStyle{
    @jobs_weakify(self)
    return ^NSString *(JobsWalletCardExpandStyle style){
        @jobs_strongify(self)
        if (!self) return nil;
        switch (style) {
            /// 处理 JobsWalletCardExpandStyleKeepOpened 分支
            case JobsWalletCardExpandStyleKeepOpened:
                return @"独立展开".jobsTr();
            /// 处理 JobsWalletCardExpandStyleOnlySelected 分支
            case JobsWalletCardExpandStyleOnlySelected:
            /// 未匹配已知分支时执行兜底处理
            default:
                return @"单选展开".jobsTr();
        }
    };
}

-(JobsWalletCardModel *)cardModelWithBankName:(NSString *)bankName
                                   cardNumber:(NSString *)cardNumber
                                     iconName:(NSString *)iconName
                              backgroundColor:(UIColor *)backgroundColor
                                          cvc:(NSString *_Nullable)cvc
                               expirationDate:(NSString *_Nullable)expirationDate{
    return JobsWalletCardModel.new
        .byBankName(bankName.jobsTr())
        .byCardNumber(cardNumber.jobsTr())
        .byBankIcon(iconName.img)
        .byBackgroundColor(backgroundColor)
        .byCvc(cvc)
        .byExpirationDate(expirationDate);
}

-(jobsByVoidBlock _Nonnull)setupRightItems{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byRightBarButtonItems(jobsMakeMutArr(^(__kindof NSMutableArray<UIBarButtonItem *> * _Nullable data) {
            data.add(self.walletExpandBtn.bySize(CGSizeMake(JobsWidth(58), JobsWidth(32))).barBtnItem);
        }));
    };
}

-(jobsByVoidBlock _Nonnull)toggleWalletCardsExpanded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byWalletCardsExpanded(!self.walletCardsExpanded);
        if (self.walletCardsExpanded) {
            [self.walletCardView expandAllCards];
        } else {
            [self.walletCardView collapseAllCards];
        }
        self.refreshWalletExpandBtnTitle();
    };
}

-(jobsByVoidBlock _Nonnull)refreshWalletExpandBtnTitle{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        _walletExpandBtn.jobsResetBtnTitle(self.walletCardsExpanded ? @"收起".jobsTr() : @"展开".jobsTr());
    };
}

-(jobsByTableViewCellBlock _Nonnull)setupModeCell{
    @jobs_weakify(self)
    return ^(UITableViewCell * cell){
        @jobs_strongify(self)
        if (!self) return;
        cell
            .bySelectionStyle(UITableViewCellSelectionStyleNone)
            .byAccessoryType(UITableViewCellAccessoryNone)
            .byBgColor(JobsClearColor);
        cell.contentView
            .byBgColor(JobsClearColor)
            .byLayer(^(__kindof CALayer * _Nullable layer) {
                layer
                    .byCornerRadius(0)
                    .byMasksToBounds(NO);
            });
        UIView *cardView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byTag(JobsWalletModeCardViewTag)
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .byCornerRadius(JobsWidth(18))
                .byClipsToBounds(NO)
                .addOn(cell.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(cell.contentView).offset(JobsWidth(8));
                    make.bottom.equalTo(cell.contentView).offset(-JobsWidth(8));
                    make.left.equalTo(cell.contentView).offset(JobsWidth(24));
                    make.right.equalTo(cell.contentView).offset(-JobsWidth(24));
                });
            view.layer
                .byShadowColor(RGBA_COLOR(36, 54, 77, 0.08).CGColor)
                .byShadowOpacity(1)
                .byShadowOffset(CGSizeMake(0, JobsWidth(4)))
                .byShadowRadius(JobsWidth(10));
        });
        UIImageView *chevronView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView.byTag(JobsWalletModeChevronViewTag);
            imageView.byImage([@"chevron.right".sys_img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate])
                .byTintColor(HEXCOLOR(0xC2C9D2))
                .byContentMode(UIViewContentModeScaleAspectFit)
                .addOn(cardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.right.equalTo(cardView).offset(-JobsWidth(18));
                    make.centerY.equalTo(cardView);
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(16), JobsWidth(16)));
                });
        });
        jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byTag(JobsWalletModeTitleLabelTag);
            label.byFont(UIFontWeightSemiboldSize(16))
                .byTextCor(JobsLabelColor)
                .byNumberOfLines(1)
                .byLineBreakMode(NSLineBreakByTruncatingTail)
                .addOn(cardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(cardView).offset(JobsWidth(24));
                    make.right.lessThanOrEqualTo(chevronView.mas_left).offset(-JobsWidth(14));
                    make.top.equalTo(cardView).offset(JobsWidth(22));
                });
        });
        jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byTag(JobsWalletModeSubTitleLabelTag);
            label.byFont(UIFontWeightRegularSize(12))
                .byTextCor(JobsSecondaryLabelColor)
                .byNumberOfLines(2)
                .byLineBreakMode(NSLineBreakByTruncatingTail)
                .addOn(cardView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(cardView).offset(JobsWidth(24));
                    make.right.lessThanOrEqualTo(chevronView.mas_left).offset(-JobsWidth(14));
                    make.top.equalTo(cardView).offset(JobsWidth(48));
                });
        });
    };
}

-(void)configureModeCell:(UITableViewCell *)cell
                 byModel:(UIViewModel *)viewModel{
    UIView *cardView = [cell.contentView viewWithTag:JobsWalletModeCardViewTag];
    UILabel *titleLabel = (UILabel *)[cardView viewWithTag:JobsWalletModeTitleLabelTag];
    UILabel *subTitleLabel = (UILabel *)[cardView viewWithTag:JobsWalletModeSubTitleLabelTag];
    titleLabel.byText(viewModel.textModel.text);
    subTitleLabel.byText(viewModel.subTextModel.text);
}

#pragma mark —— lazyLoad

-(UITableView *)modeTableView{
    if (!_modeTableView) {
        _modeTableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            tableView
                .byDelegate(self)
                .byDataSource(self)
                .byRowHeight(JobsWidth(104))
                .byTableFooterView(jobsMakeView(^(__kindof UIView * _Nullable view) {}))
                .byContentInset(UIEdgeInsetsMake(JobsWidth(2), 0, JobsWidth(20), 0))
                .byBgColor(JobsClearColor)
                .addOn(self.view);
        });
        _modeTableView.bySeparatorStyle(UITableViewCellSeparatorStyleNone);
        _modeTableView.byShowsVerticalScrollIndicator(NO);
        [_modeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.top.equalTo(self.gk_navigationBar.mas_bottom);
        }];
    };return _modeTableView;
}

-(JobsWalletCardView *)walletCardView{
    if (!_walletCardView) {
        _walletCardView = [[JobsWalletCardView alloc] initWithFrame:CGRectZero
                                                        expandStyle:self.walletStyle
                                                         cardModels:self.cardModels];
        _walletCardView.addOn(self.view);
        [_walletCardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.top.equalTo(self.gk_navigationBar.mas_bottom);
        }];
    };return _walletCardView;
}

-(BaseButton *)walletExpandBtn{
    if (!_walletExpandBtn) {
        @jobs_weakify(self)
        _walletExpandBtn = BaseButton
            .initByStyle1(@"展开".jobsTr(),
                          UIFontWeightMediumSize(14),
                          HEXCOLOR(0x2F3A46))
            .bgColorBy(JobsClearColor)
            .cornerRadiusValueBy(0)
            .jobsResetBtnLayerBorderWidth(0)
            .onClickBy(^(UIButton *x) {
                @jobs_strongify(self)
                self.toggleWalletCardsExpanded();
            })
            .makeBtnTitleByShowingType(UILabelShowingType_03);
    };return _walletExpandBtn;
}

-(NSArray<UIViewModel *> *)modeDataSource{
    if (!_modeDataSource) {
        _modeDataSource = @[
            jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
                data.textModel.byText(@"单选展开".jobsTr());
                data.subTextModel.byText(@"只显示当下点选的卡片，其他卡片自动收回。".jobsTr());
                data.byRequestParams(@(JobsWalletCardExpandStyleOnlySelected));
            }),
            jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
                data.textModel.byText(@"独立展开".jobsTr());
                data.subTextModel.byText(@"每张卡片独立开合，只要不再次关闭就保持展开。".jobsTr());
                data.byRequestParams(@(JobsWalletCardExpandStyleKeepOpened));
            })
        ];
    };return _modeDataSource;
}

-(NSArray<JobsWalletCardModel *> *)cardModels{
    if (!_cardModels) {
        _cardModels = @[
            [self cardModelWithBankName:@"上海银行"
                             cardNumber:@"**** 7895"
                               iconName:@"上海银行"
                        backgroundColor:HEXCOLOR(0xBFE2FF)
                                    cvc:@"238"
                         expirationDate:@"08/29"],
            [self cardModelWithBankName:@"国泰世华"
                             cardNumber:@"**** 2345"
                               iconName:@"国泰世华"
                        backgroundColor:HEXCOLOR(0xCFEFDF)
                                    cvc:nil
                         expirationDate:@"11/28"],
            [self cardModelWithBankName:@"台湾银行"
                             cardNumber:@"**** 7654"
                               iconName:@"台湾银行"
                        backgroundColor:HEXCOLOR(0xFFE2A8)
                                    cvc:@"510"
                         expirationDate:nil],
            [self cardModelWithBankName:@"嘉华银行"
                             cardNumber:@"**** 2345"
                               iconName:@"嘉华银行"
                        backgroundColor:HEXCOLOR(0xDCD5FF)
                                    cvc:nil
                         expirationDate:@"02/30"],
            [self cardModelWithBankName:@"包头银行"
                             cardNumber:@"**** 7654"
                               iconName:@"包头银行"
                        backgroundColor:HEXCOLOR(0xFBD0DA)
                                    cvc:nil
                         expirationDate:@"05/31"],
            [self cardModelWithBankName:@"成都银行"
                             cardNumber:@"**** 2345"
                               iconName:@"成都银行"
                        backgroundColor:HEXCOLOR(0xD6F1F5)
                                    cvc:@"792"
                         expirationDate:@"09/29"],
            [self cardModelWithBankName:@"南充商业银行"
                             cardNumber:@"**** 7654"
                               iconName:@"南充商业银行"
                        backgroundColor:HEXCOLOR(0xE4E9F6)
                                    cvc:nil
                         expirationDate:@"12/30"]
        ];
    };return _cardModels;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsWalletVC
-(JobsRetJobsWalletVCByBOOLBlock _Nonnull)byShowsModeList{
    @jobs_weakify(self)
    return ^__kindof JobsWalletVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setShowsModeList:data];
        return self;
    };
}

-(JobsRetJobsWalletVCByBOOLBlock _Nonnull)byWalletCardsExpanded{
    @jobs_weakify(self)
    return ^__kindof JobsWalletVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setWalletCardsExpanded:data];
        return self;
    };
}

-(JobsRetJobsWalletVCByJobsWalletCardExpandStyleBlock _Nonnull)byWalletStyle{
    @jobs_weakify(self)
    return ^__kindof JobsWalletVC * _Nullable(JobsWalletCardExpandStyle data){
        @jobs_strongify(self)
        [self setWalletStyle:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsWalletVC
@end
