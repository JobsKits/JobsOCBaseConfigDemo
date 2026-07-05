//
//  AppIconSwitchingVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AppIconSwitchingVC.h"

static NSString * const JobsAppIconPrimaryIcon = @"";
static NSString * const JobsAppIconAlternateIcon1 = @"AlternateIcon1";
static NSString * const JobsAppIconAlternateIcon2 = @"AlternateIcon2";
static NSString * const JobsAppIconAlternateIcon3 = @"AlternateIcon3";
static NSString * const JobsAppIconAlternateIcon4 = @"AlternateIcon4";
static NSString * const JobsAppIconAlternateIcon5 = @"AlternateIcon5";
static NSString * const JobsAppIconCellID = @"JobsAppIconCellID";
static NSString * const JobsAppIconTitleKey = @"title";
static NSString * const JobsAppIconNameKey = @"iconName";
static NSString * const JobsAppIconImageKey = @"imageName";
static NSInteger const JobsAppIconImageViewTag = 2026070301;
static NSInteger const JobsAppIconTitleLabTag = 2026070302;
static NSInteger const JobsAppIconCheckLabTag = 2026070303;

@interface AppIconSwitchingVC ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

Prop_strong()UICollectionView *iconCollectionView;
Prop_strong()NSArray <NSDictionary <NSString *, NSString *>*>*iconOptions;

@end

@implementation AppIconSwitchingVC

- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.setupNavigationBarHidden = YES;
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byTextCor(HEXCOLOR(0x3D4A58));
            data.byText(data.attributedTitle.string);
            data.byFont(UIFontWeightRegularSize(18));
        })
    
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byBgImage(@"新首页的底图".img)
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.byBgColor(JobsRandomColor);

    self.makeNavByAlpha(1);
    self.iconCollectionView.alpha = 1;
    [self.iconCollectionView reloadData];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    JobsLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    JobsLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

#pragma mark —— 一些私有方法
-(NSDictionary <NSString *, NSString *>*_Nullable)iconOptionAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.item >= self.iconOptions.count) return nil;
    return self.iconOptions[indexPath.item];
}

-(NSString *)currentAppIconName{
    if (@available(iOS 10.3, *)) {
        NSString *currentIconName = UIApplication.sharedApplication.alternateIconName;
        return currentIconName.length ? currentIconName : JobsAppIconPrimaryIcon;
    };return JobsAppIconPrimaryIcon;
}

-(NSString *_Nullable)alternateIconNameByOption:(NSDictionary <NSString *, NSString *>*)option{
    NSString *iconName = option[JobsAppIconNameKey];
    return iconName.length ? iconName : nil;
}

-(NSString *)displayTitleByIconName:(NSString *_Nullable)iconName{
    NSString *normalizedIconName = iconName.length ? iconName : JobsAppIconPrimaryIcon;
    for (NSDictionary <NSString *, NSString *>*option in self.iconOptions) {
        if ([option[JobsAppIconNameKey] isEqualToString:normalizedIconName]) return option[JobsAppIconTitleKey].tr;
    };return normalizedIconName.length ? normalizedIconName : @"默认图标".tr;
}

-(void)reloadIconSelectionState{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.iconCollectionView reloadData];
    });
}

-(void)showAppIconSwitchToast:(NSString *)msg{
    dispatch_async(dispatch_get_main_queue(), ^{
        msg.tr.toast();
    });
}

-(void)changeAppIconToName:(NSString *_Nullable)iconName {
    if (@available(iOS 10.3, *)) {
        UIApplication *application = UIApplication.sharedApplication;
        NSString *targetIconName = [self displayTitleByIconName:iconName];
        NSString *currentIconName = application.alternateIconName;
        BOOL isSameIcon = (currentIconName.length == 0 && iconName.length == 0) || [currentIconName isEqualToString:iconName];
        if (!application.supportsAlternateIcons) {
            NSString *msg = @"当前包未开启备用 App 图标，请检查 target 的 Alternate App Icon Sets 配置";
            JobsLog(@"%@", msg);
            [self showAppIconSwitchToast:msg];
            return;
        }
        if (isSameIcon) {
            NSString *msg = [NSString stringWithFormat:@"当前已经是 %@ 图标", targetIconName];
            JobsLog(@"%@", msg);
            [self showAppIconSwitchToast:msg];
            [self reloadIconSelectionState];
            return;
        }
        [application setAlternateIconName:iconName
                        completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSString *msg = [NSString stringWithFormat:@"切换 App 图标失败：%@", error.localizedDescription];
                JobsLog(@"%@", msg);
                [self showAppIconSwitchToast:msg];
            } else {
                NSString *msg = [NSString stringWithFormat:@"已切换为 %@ 图标", targetIconName];
                JobsLog(@"%@", msg);
                [self showAppIconSwitchToast:msg];
                [self reloadIconSelectionState];
            }
        }];
    } else {
        NSString *msg = @"iOS 10.3 以下不支持动态切换 App 图标";
        JobsLog(@"%@", msg);
        [self showAppIconSwitchToast:msg];
    }
}
#pragma mark —— UICollectionViewDelegate,UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section{
    return self.iconOptions.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:JobsAppIconCellID
                                                                           forIndexPath:indexPath];
    NSDictionary <NSString *, NSString *>*option = [self iconOptionAtIndexPath:indexPath];
    UIImageView *iconView = (UIImageView *)[cell.contentView viewWithTag:JobsAppIconImageViewTag];
    UILabel *titleLab = (UILabel *)[cell.contentView viewWithTag:JobsAppIconTitleLabTag];
    UILabel *checkLab = (UILabel *)[cell.contentView viewWithTag:JobsAppIconCheckLabTag];
    if (!iconView) {
        iconView = UIImageView.new;
        iconView.tag = JobsAppIconImageViewTag;
        iconView.contentMode = UIViewContentModeScaleAspectFill;
        iconView.clipsToBounds = YES;
        iconView.layer.cornerRadius = JobsWidth(14);
        [cell.contentView addSubview:iconView];
    }
    if (!titleLab) {
        titleLab = UILabel.new;
        titleLab.tag = JobsAppIconTitleLabTag;
        titleLab.font = UIFontWeightRegularSize(JobsWidth(12));
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.textColor = HEXCOLOR(0x26313D);
        [cell.contentView addSubview:titleLab];
    }
    if (!checkLab) {
        checkLab = UILabel.new;
        checkLab.tag = JobsAppIconCheckLabTag;
        checkLab.font = UIFontWeightBoldSize(JobsWidth(12));
        checkLab.text = @"✓";
        checkLab.textAlignment = NSTextAlignmentCenter;
        checkLab.textColor = JobsWhiteColor;
        checkLab.backgroundColor = HEXCOLOR(0x1F9D6A);
        checkLab.layer.cornerRadius = JobsWidth(10);
        checkLab.layer.masksToBounds = YES;
        [cell.contentView addSubview:checkLab];
    }
    CGFloat contentWidth = CGRectGetWidth(cell.contentView.bounds);
    if (contentWidth <= 0) contentWidth = JobsWidth(108);
    CGFloat iconWidth = MIN(JobsWidth(66), contentWidth - JobsWidth(28));
    iconView.frame = CGRectMake((contentWidth - iconWidth) / 2, JobsWidth(12), iconWidth, iconWidth);
    titleLab.frame = CGRectMake(JobsWidth(6), CGRectGetMaxY(iconView.frame) + JobsWidth(8), contentWidth - JobsWidth(12), JobsWidth(20));
    checkLab.frame = CGRectMake(contentWidth - JobsWidth(28), JobsWidth(8), JobsWidth(20), JobsWidth(20));
    UIImage *iconImage = [UIImage imageNamed:option[JobsAppIconImageKey]];
    if (!iconImage) {
        if (@available(iOS 13.0, *)) {
            iconImage = [UIImage systemImageNamed:@"app.fill"];
        }
    }
    iconView.image = iconImage;
    titleLab.text = option[JobsAppIconTitleKey].tr;
    NSString *currentIconName = self.currentAppIconName;
    BOOL selected = [currentIconName isEqualToString:option[JobsAppIconNameKey]];
    cell.contentView.backgroundColor = JobsWhiteColor;
    cell.contentView.layer.cornerRadius = JobsWidth(10);
    cell.contentView.layer.borderWidth = selected ? JobsWidth(2) : JobsWidth(1);
    cell.contentView.layer.borderColor = (selected ? HEXCOLOR(0x1F9D6A) : RGBA_COLOR(255, 255, 255, 0.72)).CGColor;
    cell.contentView.layer.masksToBounds = YES;
    checkLab.hidden = !selected;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary <NSString *, NSString *>*option = [self iconOptionAtIndexPath:indexPath];
    [self changeAppIconToName:[self alternateIconNameByOption:option]];
}

-(CGSize)collectionView:(UICollectionView *)collectionView
                 layout:(UICollectionViewLayout *)collectionViewLayout
 sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat sectionInset = JobsWidth(16);
    CGFloat interitemSpacing = JobsWidth(12);
    CGFloat collectionWidth = CGRectGetWidth(collectionView.bounds);
    if (collectionWidth <= 0) collectionWidth = CGRectGetWidth(UIScreen.mainScreen.bounds) - JobsWidth(36);
    CGFloat contentWidth = collectionWidth - sectionInset * 2 - interitemSpacing * 2;
    CGFloat itemWidth = floor(contentWidth / 3);
    return CGSizeMake(itemWidth, JobsWidth(132));
}
#pragma mark —— lazyLoad
-(NSArray <NSDictionary <NSString *, NSString *>*>*)iconOptions{
    if (!_iconOptions) {
        _iconOptions = @[
            @{JobsAppIconTitleKey: @"默认图标", JobsAppIconNameKey: JobsAppIconPrimaryIcon, JobsAppIconImageKey: @"AppIconPreviewPrimary"},
            @{JobsAppIconTitleKey: @"经典红", JobsAppIconNameKey: JobsAppIconAlternateIcon1, JobsAppIconImageKey: @"AppIconPreviewAlternate1"},
            @{JobsAppIconTitleKey: @"活力款", JobsAppIconNameKey: JobsAppIconAlternateIcon2, JobsAppIconImageKey: @"AppIconPreviewAlternate2"},
            @{JobsAppIconTitleKey: @"海蓝款", JobsAppIconNameKey: JobsAppIconAlternateIcon3, JobsAppIconImageKey: @"AppIconPreviewAlternate3"},
            @{JobsAppIconTitleKey: @"日落款", JobsAppIconNameKey: JobsAppIconAlternateIcon4, JobsAppIconImageKey: @"AppIconPreviewAlternate4"},
            @{JobsAppIconTitleKey: @"霓虹款", JobsAppIconNameKey: JobsAppIconAlternateIcon5, JobsAppIconImageKey: @"AppIconPreviewAlternate5"}
        ];
    };return _iconOptions;
}

-(UICollectionView *)iconCollectionView{
    if (!_iconCollectionView) {
        UICollectionViewFlowLayout *layout = UICollectionViewFlowLayout.alloc.init;
        layout.minimumInteritemSpacing = JobsWidth(12);
        layout.minimumLineSpacing = JobsWidth(14);
        layout.sectionInset = UIEdgeInsetsMake(JobsWidth(20), JobsWidth(16), JobsWidth(20), JobsWidth(16));
        _iconCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                                 collectionViewLayout:layout];
        [_iconCollectionView registerClass:UICollectionViewCell.class
                forCellWithReuseIdentifier:JobsAppIconCellID];
        _iconCollectionView.delegate = self;
        _iconCollectionView.dataSource = self;
        _iconCollectionView.backgroundColor = JobsClearColor;
        _iconCollectionView.showsVerticalScrollIndicator = NO;
        _iconCollectionView.alwaysBounceVertical = YES;
        if (@available(iOS 11.0, *)) {
            _iconCollectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        _iconCollectionView
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(12));
                make.left.right.equalTo(self.view).inset(JobsWidth(18));
                make.bottom.equalTo(self.view).offset(JobsWidth(-28));
            });
    };return _iconCollectionView;
}

@end
